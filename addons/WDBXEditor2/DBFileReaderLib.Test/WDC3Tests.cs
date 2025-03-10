using System;
using Xunit;
using DBFileReaderLib.Readers;
using DBFileReaderLib.Writers;
using DBCD;
using WDBXEditor2.Controller;
using System.IO;

namespace DBFileReaderLib.Test
{
    public class WDC3Tests
    {
        // Please provide your own db2 files for testing. <3

        [Fact]
        public void Reading_And_Writing_AlliedRace_DB2_Should_Produce_Same_File()
        {
            var dbdProvider = new DBDProvider();
            var dbcProvider = new DBCProvider();
            var dbcd = new DBCD.DBCD(dbcProvider, dbdProvider);
            var filePath = "DB2Files/AlliedRace.db2";
            var storage = dbcd.Load(filePath);

            var tempFileName = "DB2Files/AlliedRace_mod.db2";

            storage.Save(tempFileName);

            var originalBytes = File.ReadAllBytes(filePath);
            var writtenBytes = File.ReadAllBytes(tempFileName);

            Assert.Equal(originalBytes, writtenBytes);
        }

        [Fact]
        public void Reading_And_Writing_ChrCustomizationReq_DB2_Should_Produce_Same_File()
        {
            var dbdProvider = new DBDProvider();
            var dbcProvider = new DBCProvider();
            var dbcd = new DBCD.DBCD(dbcProvider, dbdProvider);
            var filePath = "DB2Files/ChrCustomizationReq.db2";
            var storage = dbcd.Load(filePath);

            var tempFileName = "DB2Files/ChrCustomizationReq_mod.db2";

            storage.Save(tempFileName);

            var originalBytes = File.ReadAllBytes(filePath);
            var writtenBytes = File.ReadAllBytes(tempFileName);

            Assert.Equal(originalBytes, writtenBytes);
        }

        [Fact]
        public void Reading_And_Writing_ChrCustomizationChoice_DB2_Should_Produce_Same_File()
        {
            var dbdProvider = new DBDProvider();
            var dbcProvider = new DBCProvider();
            var dbcd = new DBCD.DBCD(dbcProvider, dbdProvider);
            var filePath = "DB2Files/ChrCustomizationChoice.db2";
            var storage = dbcd.Load(filePath);

            var tempFileName = "DB2Files/ChrCustomizationChoice_mod.db2";

            storage.Save(tempFileName);

            var originalBytes = File.ReadAllBytes(filePath);
            var writtenBytes = File.ReadAllBytes(tempFileName);

            Assert.Equal(originalBytes, writtenBytes);
        }


        [Fact]
        public void Reading_And_Writing_SkillRaceClassInfo_DB2_Should_Produce_Same_File()
        {
            var dbdProvider = new DBDProvider();
            var dbcProvider = new DBCProvider();
            var dbcd = new DBCD.DBCD(dbcProvider, dbdProvider);
            var filePath = "DB2Files/SkillRaceClassInfo.db2";
            var storage = dbcd.Load(filePath);

            var tempFileName = "DB2Files/SkillRaceClassInfo_mod.db2";

            storage.Save(tempFileName);

            var originalBytes = File.ReadAllBytes(filePath);
            var writtenBytes = File.ReadAllBytes(tempFileName);

            Assert.Equal(originalBytes, writtenBytes);
        }

        [Fact]
        public void Exporting_And_Importing_SkillRaceClassInfo_DB2_Should_Produce_Same_File()
        {
            var dbdProvider = new DBDProvider();
            var dbcProvider = new DBCProvider();
            var dbcd = new DBCD.DBCD(dbcProvider, dbdProvider);
            var filePath = "DB2Files/SkillRaceClassInfo.db2";
            var storage = dbcd.Load(filePath);

            var tempExportPath = "SkillRaceClassInfo.csv";
            storage.Export(tempExportPath);
            storage.Import(tempExportPath);

            File.Delete(tempExportPath);

            var tempFileName = "DB2Files/SkillRaceClassInfo_mod.db2";

            storage.Save(tempFileName);

            var originalBytes = File.ReadAllBytes(filePath);
            var writtenBytes = File.ReadAllBytes(tempFileName);

            Assert.Equal(originalBytes, writtenBytes);
        }
    }
}
