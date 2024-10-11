using DBCD;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using WDBXEditor2.Controller;
using WDBXEditor2.Misc;
using WDBXEditor2.Views;

namespace WDBXEditor2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private DBLoader dbLoader = new DBLoader();
        public string CurrentOpenDB2 { get; set; } = string.Empty;
        public IDBCDStorage OpenedDB2Storage { get; set; }

        public MainWindow()
        {
            InitializeComponent();
            SettingStorage.Initialize();

            Exit.Click += (e, o) => Close();

            Title = $"WDBXEditor2  -  {Constants.Version}";
        }

        private void Open_Click(object sender, RoutedEventArgs e)
        {
            var openFileDialog = new OpenFileDialog
            {
                Multiselect = true,
                Filter = "DB2 Files (*.db2)|*.db2",
                InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.MyComputer)
            };

            if (openFileDialog.ShowDialog() == true)
            {
                var files = openFileDialog.FileNames;

                foreach (string loadedDB in dbLoader.LoadFiles(files))
                    OpenDBItems.Items.Add(loadedDB);
            }
        }

        private void OpenDBItems_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            // Clear DataGrid
            DB2DataGrid.Columns.Clear();
            DB2DataGrid.ItemsSource = new List<string>();

            CurrentOpenDB2 = (string)OpenDBItems.SelectedItem;
            if (CurrentOpenDB2 == null)
                return;

            if (dbLoader.LoadedDBFiles.TryGetValue(CurrentOpenDB2, out IDBCDStorage storage))
            {
                OpenedDB2Storage = storage;
                ReloadDataView();
            }

            Title = $"WDBXEditor2  -  {Constants.Version}  -  {CurrentOpenDB2}";
        }

        /// <summary>
        /// Populate the DataView with the DB2 Columns.
        /// </summary>
        private void PopulateColumns(IDBCDStorage storage, ref DataTable data)
        {
            var firstItem = storage.Values.FirstOrDefault();
            if (firstItem == null)
            {
                return;
            }

            foreach (string columnName in firstItem.GetDynamicMemberNames())
            {
                var columnValue = firstItem[columnName];

                if (columnValue.GetType().IsArray)
                {
                    Array columnValueArray = (Array)columnValue;
                    for (var i = 0; i < columnValueArray.Length; ++i)
                        data.Columns.Add(columnName + i);
                }
                else
                    data.Columns.Add(columnName);
            }
        }

        /// <summary>
        /// Populate the DataView with the DB2 Data.
        /// </summary>
        private void PopulateDataView(IDBCDStorage storage, ref DataTable data)
        {
            foreach (var rowData in storage.Values)
            {
                var row = data.NewRow();

                foreach (string columnName in rowData.GetDynamicMemberNames())
                {
                    var columnValue = rowData[columnName];

                    if (columnValue.GetType().IsArray)
                    {
                        Array columnValueArray = (Array)columnValue;
                        for (var i = 0; i < columnValueArray.Length; ++i)
                            row[columnName + i] = columnValueArray.GetValue(i);
                    }
                    else
                        row[columnName] = columnValue;
                }

                data.Rows.Add(row);
            }
        }

        /// <summary>
        /// Close the currently opened DB2 file.
        /// </summary>
        private void Close_Click(object sender, RoutedEventArgs e)
        {
            Title = $"WDBXEditor2  -  {Constants.Version}";

            // Remove the DB2 file from the open files.
            OpenDBItems.Items.Remove(CurrentOpenDB2);

            // Clear DataGrid
            DB2DataGrid.Columns.Clear();

            CurrentOpenDB2 = string.Empty;
            OpenedDB2Storage = null;
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrEmpty(CurrentOpenDB2))
                dbLoader.LoadedDBFiles[CurrentOpenDB2].Save(CurrentOpenDB2);
        }

        private void SaveAs_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(CurrentOpenDB2))
                return;

            var saveFileDialog = new SaveFileDialog
            {
                FileName = CurrentOpenDB2,
                Filter = "DB2 Files (*.db2)|*.db2",
                InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.MyComputer)
            };

            if (saveFileDialog.ShowDialog() == true)
            {
                dbLoader.LoadedDBFiles[CurrentOpenDB2].Save(saveFileDialog.FileName);
            }
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void DB2DataGrid_CellEditEnding(object sender, DataGridCellEditEndingEventArgs e)
        {
            if (e.EditAction == DataGridEditAction.Commit)
            {
                if (e.Column != null)
                {
                    var rowIdx = e.Row.GetIndex();
                    if (rowIdx >= OpenedDB2Storage.Keys.Count)
                        OpenedDB2Storage.AddEmpty();

                    var newVal = e.EditingElement as TextBox;

                    var dbcRow = OpenedDB2Storage.Values.ElementAt(rowIdx);
                    try
                    {
                        dbcRow[CurrentOpenDB2, e.Column.Header.ToString()] = newVal.Text;
                    }
                    catch
                    {
                        newVal.Text = dbcRow[e.Column.Header.ToString()].ToString();
                    }

                    Console.WriteLine($"RowIdx: {rowIdx} Text: {newVal.Text}");
                }
            }
        }

        private void Export_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(CurrentOpenDB2))
                return;

            var saveFileDialog = new SaveFileDialog
            {
                FileName = Path.GetFileNameWithoutExtension(CurrentOpenDB2) + ".csv",
                Filter = "Comma Seperated Values Files (*.csv)|*.csv",
                InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.MyComputer)
            };

            if (saveFileDialog.ShowDialog() == true)
            {
                dbLoader.LoadedDBFiles[CurrentOpenDB2].Export(saveFileDialog.FileName);
            }
        }

        private void Import_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(CurrentOpenDB2))
                return;

            var openFileDialog = new OpenFileDialog
            {
                Multiselect = false,
                Filter = "Comma Seperated Values Files (*.csv)|*.csv",
                InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.MyComputer)
            };

            if (openFileDialog.ShowDialog() == true)
            {
                var storage = dbLoader.LoadedDBFiles[CurrentOpenDB2];
                var fileName = openFileDialog.FileNames[0];
                storage.Import(fileName);
                ReloadDataView();
            }
        }

        private void SetColumn_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(CurrentOpenDB2))
                return;
            new SetColumnWindow(this).Show();
        }

        private void ReplaceColumn_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(CurrentOpenDB2))
                return;

            new ReplaceColumnWindow(this).Show();
        }

        private void SetBitColumn_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(CurrentOpenDB2))
                return;

            new SetFlagWindow(this).Show();
        }

        private void SetDependentColumn_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(CurrentOpenDB2))
                return;

            new SetDependentColumnWindow(this).Show();
        }

        public void ReloadDataView()
        {
            var stopWatch = new Stopwatch();
            stopWatch.Start();

            var data = new DataTable();
            PopulateColumns(OpenedDB2Storage, ref data);
            if (OpenedDB2Storage.Values.Count > 0)
                PopulateDataView(OpenedDB2Storage, ref data);

            stopWatch.Stop();
            Console.WriteLine($"Populating Grid: {CurrentOpenDB2} Elapsed Time: {stopWatch.Elapsed}");
            DB2DataGrid.ItemsSource = data.DefaultView;
        }
    }
}
