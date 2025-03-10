using DBCD;
using DBDefsLib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using WDBXEditor2.Misc;
using static DBDefsLib.Structs;

namespace WDBXEditor2.Views
{
    public partial class ExceptionWindow : Window
    {
        public Exception CaughtException { get; set; }
        public ExceptionWindow()
        {
            InitializeComponent();
        }

        public void DisplayException(Exception e)
        {
            CaughtException = e;
            TxtException.Text = e.ToString();
        }
    }
}
