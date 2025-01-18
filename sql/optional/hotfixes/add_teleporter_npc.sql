SET @broadcast_id = 333333;

DELETE FROM `broadcast_text` WHERE ID > @broadcast_id - 1 AND ID < @broadcast_id + 5;
INSERT INTO `broadcast_text` (`ID`, `Text`, `Text1`, `EmoteID1`, `EmoteID2`, `EmoteID3`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmotesID`, `LanguageID`, `Flags`, `ConditionID`, `SoundEntriesID1`, `SoundEntriesID2`, `VerifiedBuild`) VALUES
(@broadcast_id + 4, '$BWhere would you like to be ported?$B', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26124),
(@broadcast_id + 3, '$BBe careful with choosing raids,I wont be there if you die.$B', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26124),
(@broadcast_id + 2, '$BUp for some dungeon exploring?$B', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26124),
(@broadcast_id + 1, '$B For The Alliance!$B', '', 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26124),
(@broadcast_id, '$B For the Horde!$B', '', 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26124);

-- Reference for 'TableHash': https://github.com/TrinityCore/WowPacketParser/blob/master/WowPacketParser/Enums/DB2Hash.cs
DELETE FROM `hotfix_data` WHERE `Id` IN (@broadcast_id + 4, @broadcast_id + 3, @broadcast_id + 2, @broadcast_id + 1, @broadcast_id);
INSERT INTO `hotfix_data` (`Id`, `TableHash`, `RecordID`, `Timestamp`, `Deleted`) VALUES
(@broadcast_id + 4, 35137211, @broadcast_id + 4, 0, 0),
(@broadcast_id + 3, 35137211, @broadcast_id + 3, 0, 0),
(@broadcast_id + 2, 35137211, @broadcast_id + 2, 0, 0),
(@broadcast_id + 1, 35137211, @broadcast_id + 1, 0, 0),
(@broadcast_id, 35137211, @broadcast_id, 0, 0);