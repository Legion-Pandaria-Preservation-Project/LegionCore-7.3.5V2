-- Fix loot chance for the following quest items

-- These should all be 100%
-- 884 = Ghoul Rib
-- 981 = Bernice's Necklace
-- 1006 = Brass Collar
-- 1946 = Mary's Looking Glass
-- 1968 = Ogre's Monocle
-- 2713 = Ol' Sooty's Head
-- 22934 = Lasher Sample
-- 59522 = Key of Ilgalar

-- 60792 = Pristine Flight Feather (bump from 35% to 50%)

DELETE FROM `creature_loot_template` WHERE `item` IN (884,981,1006,1946,1968,2713,22934,59522,60792);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `shared`) VALUES
(327, 981, -100, 0, 0, 1, 1, 0),
(330, 1006, -100, 0, 0, 1, 1, 0),
(511, 1946, -100, 0, 0, 1, 1, 0),
(300, 1968, -100, 0, 0, 1, 1, 0),
(1225, 2713, -100, 0, 0, 1, 1, 0),
(703, 59522, -100, 0, 0, 1, 1, 0),
(44628, 60792, -50, 0, 0, 1, 1, 0),
(1270, 884, -40, 0, 0, 1, 1, 0),
(948, 884, -40, 0, 0, 1, 1, 0),
(604, 884, -40, 0, 0, 1, 1, 0),
(570, 884, -40, 0, 0, 1, 1, 0),
(210, 884, -40, 0, 0, 1, 1, 0),
(3, 884, -40, 0, 0, 1, 1, 0),
(16517, 22934, -100, 0, 0, 1, 1, 0);

-- Fix broken "Rescue the Survivors!" quest (can't heal the Draenei Survivor, wrong faction and NPC flag)
DELETE FROM `creature_template` WHERE `entry` = 16483;
INSERT INTO `creature_template` (`entry`, `gossip_menu_id`, `minlevel`, `maxlevel`, `SandboxScalingID`, `ScaleLevelMin`, `ScaleLevelMax`, `ScaleLevelDelta`, `ScaleLevelDuration`, `exp`, `faction`, `npcflag`, `npcflag2`, `speed_walk`, `speed_run`, `speed_fly`, `scale`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Mana_mod_extra`, `Armor_mod`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ControllerID`, `WorldEffects`, `PassiveSpells`, `StateWorldEffectID`, `SpellStateVisualID`, `SpellStateAnimID`, `SpellStateAnimKitID`, `IgnoreLos`, `AffixState`, `MaxVisible`, `ScriptName`) VALUES
('16483', '0', '1', '5', '165', '0', '0', '0', '0', '0', '1638', '0', '0', '1', '1.14286', '1.14286', '1', '5', '6', '0', '2', '1', '2000', '0', '1', '4608', '2048', '0', '8', '0', '0', '0', '0', '3', '4', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'SmartAI', '1', '3', '1', '1', '1', '0', '0', '2', '0', '', '', '0', '0', '0', '0', '0', '0', '0', 'npc_draenei_survivor');

-- Fix broken "Thistle While You Work" quest (can't loot the seeds)
DELETE FROM `conditions` WHERE `SourceEntry` = 60737;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(4, 205089, 60737, 0, 0, 9, 0, 27025, 0, 0, 0, 0, '', '');

DELETE FROM `gameobject_template` WHERE `entry` = 205089;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `Data24`, `Data25`, `Data26`, `Data27`, `Data28`, `Data29`, `Data30`, `Data31`, `Data32`, `unkInt32`, `AIName`, `ScriptName`, `WorldEffectID`, `StateWorldEffectID`, `SpellVisualID`, `SpellStateVisualID`, `SpellStateAnimID`, `SpellStateAnimKitID`, `MaxVisible`, `IgnoreDynLos`, `MinGold`, `MaxGold`, `VerifiedBuild`) VALUES
(205089, 3, 7918, 'Stabthistle Seed', '', 'Collecting', '', 0, 4, 0.5, 60737, 0, 0, 0, 0, 0, 43, 205089, 0, 1, 0, 0, 0, 0, 27025, 0, 0, 0, 0, 0, 19676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- Fix bad quest POI point

-- Mistmantle's Revenge
DELETE FROM `quest_poi_points` WHERE `QuestID` = 26674;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(26674, 0, 0, -10372, -1252, 22908),
(26674, 1, 0, -10382, -1246, 26124);  -- Adjusted this one (OLD: 26674, 1, 0, -10512, -1301, 22908)

-- Fix missing item template

-- Inoculation
DELETE FROM `item_template` WHERE `entry` = 22962;
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `Flags2`, `Unk530_1`, `Flags3`, `Unk430_1`, `Unk430_2`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_unk1_1`, `stat_unk2_1`, `stat_type2`, `stat_value2`, `stat_unk1_2`, `stat_unk2_2`, `stat_type3`, `stat_value3`, `stat_unk1_3`, `stat_unk2_3`, `stat_type4`, `stat_value4`, `stat_unk1_4`, `stat_unk2_4`, `stat_type5`, `stat_value5`, `stat_unk1_5`, `stat_unk2_5`, `stat_type6`, `stat_value6`, `stat_unk1_6`, `stat_unk2_6`, `stat_type7`, `stat_value7`, `stat_unk1_7`, `stat_unk2_7`, `stat_type8`, `stat_value8`, `stat_unk1_8`, `stat_unk2_8`, `stat_type9`, `stat_value9`, `stat_unk1_9`, `stat_unk2_9`, `stat_type10`, `stat_value10`, `stat_unk1_10`, `stat_unk2_10`, `ScalingStatDistribution`, `DamageType`, `delay`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `StatScalingFactor`, `CurrencySubstitutionId`, `CurrencySubstitutionCount`, `flagsCustom`, `WDBVerified`) VALUES
(22962, 12, 0, -1, 'Inoculating Crystal', 36540, 1, 64, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29528, 0, 0, 5000, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26124);