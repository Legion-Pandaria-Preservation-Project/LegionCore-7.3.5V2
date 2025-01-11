-- Fix ExclusiveGroup being set incorrectly to -40883
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 0 WHERE `ID` IN (40883, 40949);


-- Fix quest AllowableClasses not being set

/*
	Warrior = 1
	Paladin = 2
	Hunter = 4
	Rogue = 8
	Priest = 16
	Death Knight = 32
	Shaman = 64
	Mage = 128
	Warlock = 256
	Monk = 512
	Druid = 1024
	Demon Hunter = 2048
*/

-- Paladin
UPDATE `quest_template_addon` SET `AllowableClasses` = 2 WHERE `ID` IN (38576, 42811, 42812);

-- Hunter
UPDATE `quest_template_addon` SET `AllowableClasses` = 4 WHERE `ID` IN (39427, 44043, 44366);

-- Rogue
UPDATE `quest_template_addon` SET `AllowableClasses` = 8 WHERE `ID` IN (44034);

-- Druid
UPDATE `quest_template_addon` SET `AllowableClasses` = 1024 WHERE `ID` IN (43980, 44431, 44443);

-- Shaman
UPDATE `quest_template_addon` SET `AllowableClasses` = 64 WHERE `ID` IN (43334, 43644);

-- Death Knight
UPDATE `quest_template_addon` SET `AllowableClasses` = 32 WHERE `ID` IN (40714);

-- Demon Hunter
UPDATE `quest_template_addon` SET `AllowableClasses` = 2048 WHERE `ID` IN (39047, 39051, 39261, 40247, 40249, 40814, 40815, 40816, 40819, 41119, 41120, 41121, 41803, 41863, 44137, 44140, 44278, 44457, 44489, 44490);

-- Warlock/Druid
UPDATE `quest_template_addon` SET `AllowableClasses` = 1280 WHERE `ID` IN (40731);

-- Warrior/Rogue
UPDATE `quest_template_addon` SET `AllowableClasses` = 9 WHERE `ID` IN (44375);


-- Fix quest AllowableRaces not being set

-- Alliance (824181837)
UPDATE `quest_template` SET `AllowableRaces` = 824181837 WHERE `ID` IN (44821, 45627, 47221, 48506);

-- Horde (234881970)
UPDATE `quest_template` SET `AllowableRaces` = 824181837 WHERE `ID` IN (47835, 48507);


-- Fix profession quests that should not show up for everyone

-- Jewelcrafting
UPDATE `quest_template_addon` SET `RequiredSkillID` = 755, `RequiredSkillPoints` = 1 WHERE `ID` IN (40526, 40527, 40528, 40532, 40533, 40534, 40542, 40543, 40544);
-- UPDATE `quest_template_addon` SET `PrevQuestID` = 40523, `ExclusiveGroup` = 40526 WHERE `ID` IN (40526, 40527, 40528);
-- UPDATE `quest_template_addon` SET `PrevQuestID` = 40531 WHERE `ID` IN (40532, 40533, 40534);

-- Inscription
UPDATE `quest_template_addon` SET `RequiredSkillID` = 773, `RequiredSkillPoints` = 1 WHERE `ID` IN (39942, 39951, 39952, 40062, 40064, 40065);

-- Leatherworking
UPDATE `quest_template_addon` SET `RequiredSkillID` = 165, `RequiredSkillPoints` = 1 WHERE `ID` IN (40190, 40193);
-- UPDATE `quest_template_addon` SET `NextQuestID` = 40190 WHERE `ID` = 40189;
-- UPDATE `quest_template_addon` SET `PrevQuestID` = 40189, `NextQuestID` = 40191 WHERE `ID` = 40190;

DELETE FROM `creature_queststarter` WHERE `quest` IN (40190, 40193, 40415);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES 
('93522', '40190'),
('98931', '40193'),
('98948', '40415');

-- Alchemy
UPDATE `quest_template_addon` SET `RequiredSkillID` = 171, `RequiredSkillPoints` = 1 WHERE `ID` IN (39566);

-- Engineering
UPDATE `quest_template_addon` SET `RequiredSkillID` = 202, `RequiredSkillPoints` = 1 WHERE `ID` IN (46119);

DELETE FROM `quest_template_addon` WHERE `ID` IN (48056, 48065, 48069);
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RewardMailTitle`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES 
(48056, 0, 0, 0, 0, 48065, 0, 0, 0, '', 202, 1, 0, 0, 0, 0, 0, 0),
(48065, 0, 0, 0, 48056, 48069, 0, 0, 0, '', 202, 1, 0, 0, 0, 0, 0, 0),
(48069, 0, 0, 0, 48065, 0, 0, 0, 0, '', 202, 1, 0, 0, 0, 0, 0, 0);

-- Blacksmithing
DELETE FROM `quest_template_addon` WHERE `ID` IN (48053, 48054);
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RewardMailTitle`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES 
(48053, 0, 0, 0, 0, 0, 0, 0, 0, '', 164, 1, 0, 0, 0, 0, 0, 0),
(48054, 0, 0, 0, 0, 0, 0, 0, 0, '', 164, 1, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_queststarter` WHERE `quest` IN (48053, 48054);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES 
('92183', '48053'),
('106655', '48054');


-- Fix missing previous/next quest


/*  For another time, have to check all of these quests first
UPDATE `quest_template_addon` SET `NextQuestID` = 44874 WHERE `ID` = 44873;
UPDATE `quest_template_addon` SET `PrevQuestID` = 44873, `NextQuestID` = 44875 WHERE `ID` = 44874;
UPDATE `quest_template_addon` SET `NextQuestID` = 44876 WHERE `ID` = 44875;

UPDATE `quest_template_addon` SET `PrevQuestID` = 39942, `NextQuestID` = 40064 WHERE `ID` = 40062;
UPDATE `quest_template_addon` SET `PrevQuestID` = 40062, `NextQuestID` = 40065 WHERE `ID` = 40064;
UPDATE `quest_template_addon` SET `PrevQuestID` = 40064, `NextQuestID` = 39951 WHERE `ID` = 40065;
*/