DROP TABLE IF EXISTS `black_market_armor_sets`;
DROP TABLE IF EXISTS `black_market_current_set`;

set @Token_Name = "Araxia Token";
set @Vendor_Name = "Xur";
set @Vendor_Surname = "Specially Acquired Goods";
set @Vendor_Model = 25447;

CREATE TABLE IF NOT EXISTS `black_market_armor_sets` (
    `class` INT NOT NULL,
    `item_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `item_set_id` INT NOT NULL,
    `set_name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`class`, `item_id`)
);

CREATE TABLE IF NOT EXISTS `black_market_current_set` (
    `class` INT NOT NULL,
    `item_set_id` INT NOT NULL,
    `set_name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`class`)
);

-- Make NPC Vendor Currency
DELETE FROM `item_template` WHERE (`entry` = 910001);
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES
(910001, 15, 4, -1, @Token_Name, 51567, 2, 134217728, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Use to buy the rarest goods in the realm', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 8192, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0);

-- Make NPC template
DELETE FROM `creature_template` WHERE (`entry` = 101111);
INSERT INTO creature_template
(entry, modelid1, name, subname, IconName, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, BaseAttackTime, RangeAttackTime, BaseVariance, RangeVariance, unit_class, MovementType, HealthModifier, ManaModifier, ArmorModifier, DamageModifier, ExperienceModifier, RacialLeader, RegenHealth, spell_school_immune_mask, ScriptName, VerifiedBuild ) VALUES
(101111, @Vendor_Model, @Vendor_Name, @Vendor_Surname, '', 80, 80, 35, 1, 1, 1.14286, 1, 1500, 2000, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, '', 0 );

-- Place NPC into world. He's in dalaran in front of the bank.
DELETE FROM `creature` WHERE (`id` = 101111);
INSERT INTO `creature`
(`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `StringId`, `VerifiedBuild`) VALUES
(9000695, 101111, 571, 0, 0, 1, 1, 0, 5698.8647, 678.71, 645.818115, 4.773741, 300, 0, 0, 52, 0, 0, 0, 0, 0, '', NULL, 0);


-- EVENT SCHEDULING AND EXECUTING
DELIMITER $$
DROP PROCEDURE IF EXISTS UpdateBlackMarketSets;
CREATE PROCEDURE UpdateBlackMarketSets()
BEGIN
    DELETE FROM black_market_current_set;
    INSERT INTO black_market_current_set (class, item_set_id, set_name)
    SELECT
        class,
        item_set_id,
        set_name
    FROM (SELECT class, item_set_id, set_name, ROW_NUMBER() OVER (PARTITION BY class ORDER BY RAND()) AS rn
        FROM black_market_armor_sets
        GROUP BY class, item_set_id, set_name
    ) AS ranked_sets
    WHERE rn = 1;
END $$
DELIMITER ;

-- Insert Armor Sets
-- Lieutenant Commander's SETS
-- Druid: Lieutenant Commander's Refuge

INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11,23294,'Knight-Captain''s Dragonhide Chestpiece',551,'Lieutenant Commander''s Refuge'),
(11,23295,'Knight-Captain''s Dragonhide Leggings',551,'Lieutenant Commander''s Refuge'),
(11,23280,'Knight-Lieutenant''s Dragonhide Grips',551,'Lieutenant Commander''s Refuge'),
(11,23281,'Knight-Lieutenant''s Dragonhide Treads',551,'Lieutenant Commander''s Refuge'),
(11,23308,'Lieutenant Commander''s Dragonhide Headguard',551,'Lieutenant Commander''s Refuge'),
(11,23309,'Lieutenant Commander''s Dragonhide Shoulders',551,'Lieutenant Commander''s Refuge');

-- Hunter: Lieutenant Commander's Pursuance
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3,16425,'Knight-Captain''s Chain Hauberk',550,'Lieutenant Commander''s Pursuance'),
(3,16426,'Knight-Captain''s Chain Leggings',550,'Lieutenant Commander''s Pursuance'),
(3,23279,'Knight-Lieutenant''s Chain Vices',550,'Lieutenant Commander''s Pursuance'),
(3,16401,'Knight-Lieutenant''s Chain Boots',550,'Lieutenant Commander''s Pursuance'),
(3,23306,'Lieutenant Commander''s Chain Helm',550,'Lieutenant Commander''s Pursuance'),
(3,23307,'Lieutenant Commander''s Chain Shoulders',550,'Lieutenant Commander''s Pursuance');

-- Mage: Lieutenant Commander's Arcanum
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8,16413,'Knight-Captain''s Silk Tunic',546,'Lieutenant Commander''s Arcanum'),
(8,16414,'Knight-Captain''s Silk Legguards',546,'Lieutenant Commander''s Arcanum'),
(8,23290,'Knight-Lieutenant''s Silk Handwraps',546,'Lieutenant Commander''s Arcanum'),
(8,23291,'Knight-Lieutenant''s Silk Walkers',546,'Lieutenant Commander''s Arcanum'),
(8,23318,'Lieutenant Commander''s Silk Cowl',546,'Lieutenant Commander''s Arcanum'),
(8,23319,'Lieutenant Commander''s Silk Mantle',546,'Lieutenant Commander''s Arcanum');

-- Paladin: Lieutenant Commander's Redoubt
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 23272, 'Knight-Captain''s Lamellar Breastplate', 544, 'Lieutenant Commander''s Redoubt'),
(2, 23273, 'Knight-Captain''s Lamellar Leggings', 544, 'Lieutenant Commander''s Redoubt'),
(2, 23274, 'Knight-Lieutenant''s Lamellar Gauntlets', 544, 'Lieutenant Commander''s Redoubt'),
(2, 23275, 'Knight-Lieutenant''s Lamellar Sabatons', 544, 'Lieutenant Commander''s Redoubt'),
(2, 23276, 'Lieutenant Commander''s Lamellar Headguard', 544, 'Lieutenant Commander''s Redoubt'),
(2, 23277, 'Lieutenant Commander''s Lamellar Shoulders', 544, 'Lieutenant Commander''s Redoubt');

-- Priest: Lieutenant Commander's Investiture
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 23303, 'Knight-Captain''s Satin Tunic', 549, 'Lieutenant Commander''s Investiture'),
(5, 23302, 'Knight-Captain''s Satin Legguards', 549, 'Lieutenant Commander''s Investiture'),
(5, 23288, 'Knight-Lieutenant''s Satin Handwraps', 549, 'Lieutenant Commander''s Investiture'),
(5, 23289, 'Knight-Lieutenant''s Satin Walkers', 549, 'Lieutenant Commander''s Investiture'),
(5, 23316, 'Lieutenant Commander''s Satin Hood', 549, 'Lieutenant Commander''s Investiture'),
(5, 23317, 'Lieutenant Commander''s Satin Mantle', 549, 'Lieutenant Commander''s Investiture');


-- Rogue: Lieutenant Commander's Guard
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 23298, 'Knight-Captain''s Leather Chestpiece', 548, 'Lieutenant Commander''s Guard'),
(4, 23299, 'Knight-Captain''s Leather Legguards', 548, 'Lieutenant Commander''s Guard'),
(4, 23284, 'Knight-Lieutenant''s Leather Grips', 548, 'Lieutenant Commander''s Guard'),
(4, 23285, 'Knight-Lieutenant''s Leather Walkers', 548, 'Lieutenant Commander''s Guard'),
(4, 23312, 'Lieutenant Commander''s Leather Helm', 548, 'Lieutenant Commander''s Guard'),
(4, 23313, 'Lieutenant Commander''s Leather Shoulders', 548, 'Lieutenant Commander''s Guard');

-- Shaman: Lieutenant Commander's Earthshaker
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 29599, 'Lieutenant Commander''s Mail Pauldrons', 718, 'Lieutenant Commander''s Earthshaker'),
(7, 29595, 'Knight-Lieutenant''s Mail Vices', 718, 'Lieutenant Commander''s Earthshaker'),
(7, 29597, 'Knight-Lieutenant''s Mail Legguards', 718, 'Lieutenant Commander''s Earthshaker'),
(7, 29596, 'Knight-Captain''s Mail Hauberk', 718, 'Lieutenant Commander''s Earthshaker'),
(7, 29598, 'Lieutenant Commander''s Mail Headguard', 718, 'Lieutenant Commander''s Earthshaker'),
(7, 29594, 'Knight-Lieutenant''s Mail Greaves', 718, 'Lieutenant Commander''s Earthshaker');

-- Warlock: Lieutenant Commander's Dreadgear
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 23296, 'Knight-Captain''s Dreadweave Legguards', 547, 'Lieutenant Commander''s Dreadgear'),
(9, 23297, 'Knight-Captain''s Dreadweave Tunic', 547, 'Lieutenant Commander''s Dreadgear'),
(9, 23282, 'Knight-Lieutenant''s Dreadweave Handwraps', 547, 'Lieutenant Commander''s Dreadgear'),
(9, 23283, 'Knight-Lieutenant''s Dreadweave Walkers', 547, 'Lieutenant Commander''s Dreadgear'),
(9, 23310, 'Lieutenant Commander''s Dreadweave Cowl', 547, 'Lieutenant Commander''s Dreadgear'),
(9, 23311, 'Lieutenant Commander''s Dreadweave Spaulders', 547, 'Lieutenant Commander''s Dreadgear');

-- Warrior: Lieutenant Commander's Battlearmor
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 23300, 'Knight-Captain''s Plate Hauberk', 545, 'Lieutenant Commander''s Battlearmor'),
(1, 23301, 'Knight-Captain''s Plate Leggings', 545, 'Lieutenant Commander''s Battlearmor'),
(1, 23286, 'Knight-Lieutenant''s Plate Gauntlets', 545, 'Lieutenant Commander''s Battlearmor'),
(1, 23287, 'Knight-Lieutenant''s Plate Greaves', 545, 'Lieutenant Commander''s Battlearmor'),
(1, 23314, 'Lieutenant Commander''s Plate Helmet', 545, 'Lieutenant Commander''s Battlearmor'),
(1, 23315, 'Lieutenant Commander''s Plate Shoulders', 545, 'Lieutenant Commander''s Battlearmor');


-- [[Level 60 Low Tier Set ]]

-- Druid: Champion's Refuge
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 22863, 'Blood Guard''s Dragonhide Grips', 539, 'Blood Guard''s Dragonhide'),
(11, 22852, 'Blood Guard''s Dragonhide Treads', 539, 'Blood Guard''s Dragonhide'),
(11, 22877, 'Legionnaire''s Dragonhide Chestpiece', 539, 'Blood Guard''s Dragonhide'),
(11, 22878, 'Legionnaire''s Dragonhide Leggings', 539, 'Blood Guard''s Dragonhide'),
(11, 23253, 'Champion''s Dragonhide Headguard', 539, 'Blood Guard''s Dragonhide'),
(11, 23254, 'Champion''s Dragonhide Shoulders', 539, 'Blood Guard''s Dragonhide');


-- Hunter: Champion's Pursuance
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 22843, 'Blood Guard''s Chain Greaves', 543, 'Blood Guard''s Chain'),
(3, 22862, 'Blood Guard''s Chain Vices', 543, 'Blood Guard''s Chain'),
(3, 23251, 'Champion''s Chain Helm', 543, 'Blood Guard''s Chain'),
(3, 23252, 'Champion''s Chain Shoulders', 543, 'Blood Guard''s Chain'),
(3, 22874, 'Legionnaire''s Chain Hauberk', 543, 'Blood Guard''s Chain'),
(3, 22875, 'Legionnaire''s Chain Legguards', 543, 'Blood Guard''s Chain');

-- Insert Armor Sets for Mage: Champion's Arcanum Item set 542
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 22870, 'Blood Guard''s Silk Handwraps', 542, 'Champion''s Arcanum'),
(8, 22860, 'Blood Guard''s Silk Walkers', 542, 'Champion''s Arcanum'),
(8, 23263, 'Champion''s Silk Cowl', 542, 'Champion''s Arcanum'),
(8, 23264, 'Champion''s Silk Mantle', 542, 'Champion''s Arcanum'),
(8, 22883, 'Legionnaire''s Silk Leggings', 542, 'Champion''s Arcanum'),
(8, 22886, 'Legionnaire''s Silk Tunic', 542, 'Champion''s Arcanum');

-- Insert Armor Sets for Paladin: Champion's Redoubt Item Set 697
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 29600, 'Blood Guard''s Lamellar Gauntlets', 697, 'Champion''s Redoubt'),
(2, 29601, 'Blood Guard''s Lamellar Sabatons', 697, 'Champion''s Redoubt'),
(2, 29602, 'Legionnaire''s Lamellar Breastplate', 697, 'Champion''s Redoubt'),
(2, 29603, 'Legionnaire''s Lamellar Leggings', 697, 'Champion''s Redoubt'),
(2, 29604, 'Champion''s Lamellar Headguard', 697, 'Champion''s Redoubt'),
(2, 29605, 'Champion''s Lamellar Shoulders', 697, 'Champion''s Redoubt');

-- Insert Armor Sets for Priest: Champion's Investiture Item Set 540
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 22869, 'Blood Guard''s Satin Handwraps', 540, 'Champion''s Investiture'),
(5, 22859, 'Blood Guard''s Satin Walkers', 540, 'Champion''s Investiture'),
(5, 22882, 'Legionnaire''s Satin Legguards', 540, 'Champion''s Investiture'),
(5, 22885, 'Legionnaire''s Satin Tunic', 540, 'Champion''s Investiture'),
(5, 23261, 'Champion''s Satin Hood', 540, 'Champion''s Investiture'),
(5, 23262, 'Champion''s Satin Mantle', 540, 'Champion''s Investiture');

-- Insert Armor Sets for Rogue: Champion's Guard Item Set 522
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 22864, 'Blood Guard''s Leather Grips', 522, 'Champion''s Guard'),
(4, 22856, 'Blood Guard''s Leather Walkers', 522, 'Champion''s Guard'),
(4, 22879, 'Legionnaire''s Leather Chestpiece', 522, 'Champion''s Guard'),
(4, 22880, 'Legionnaire''s Leather Legguards', 522, 'Champion''s Guard'),
(4, 23257, 'Champion''s Leather Helm', 522, 'Champion''s Guard'),
(4, 23258, 'Champion''s Leather Shoulders', 522, 'Champion''s Guard');

-- Insert Armor Sets for Shaman: Champion's Stormcaller Item set 538
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 22857, 'Blood Guard''s Mail Greaves', 538, 'Champion''s Stormcaller'),
(7, 22867, 'Blood Guard''s Mail Vices', 538, 'Champion''s Stormcaller'),
(7, 22876, 'Legionnaire''s Mail Hauberk', 538, 'Champion''s Stormcaller'),
(7, 22887, 'Legionnaire''s Mail Leggings', 538, 'Champion''s Stormcaller'),
(7, 23259, 'Champion''s Mail Headguard', 538, 'Champion''s Stormcaller'),
(7, 23260, 'Champion''s Mail Pauldrons', 538, 'Champion''s Stormcaller');

-- Warlock: Champion's Dreadgear Item Set 541
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 22865, 'Blood Guard''s Dreadweave Handwraps', 541, 'Champion''s Dreadgear'),
(9, 22855, 'Blood Guard''s Dreadweave Walkers', 541, 'Champion''s Dreadgear'),
(9, 23255, 'Legionnaire''s Dreadweave Cowl', 541, 'Champion''s Dreadgear'),
(9, 23256, 'Legionnaire''s Dreadweave Spaulders', 541, 'Champion''s Dreadgear'),
(9, 22881, 'Champion''s Dreadweave Legguards', 541, 'Champion''s Dreadgear'),
(9, 22884, 'Champion''s Dreadweave Tunic', 541, 'Champion''s Dreadgear');

-- Warrior: Champion's Battlearmor Item Set 537
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 22868, 'Blood Guard''s Plate Gauntlets', 537, 'Champion''s Battlearmor'),
(1, 22858, 'Blood Guard''s Plate Greaves', 537, 'Champion''s Battlearmor'),
(1, 22872, 'Legionnaire''s Plate Hauberk', 537, 'Champion''s Battlearmor'),
(1, 22873, 'Legionnaire''s Plate Leggings', 537, 'Champion''s Battlearmor'),
(1, 23244, 'Champion''s Plate Helm', 537, 'Champion''s Battlearmor'),
(1, 23243, 'Champion''s Plate Shoulders', 537, 'Champion''s Battlearmor');


-- [[Level 60 High Tier Set ]]



-- Insert Armor Sets for Druid: Field Marshal's Sanctuary Item Set 397
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 16452, 'Field Marshal''s Dragonhide Breastplate', 397, 'Field Marshal''s Sanctuary'),
(11, 16451, 'Field Marshal''s Dragonhide Helmet', 397, 'Field Marshal''s Sanctuary'),
(11, 16449, 'Field Marshal''s Dragonhide Spaulders', 397, 'Field Marshal''s Sanctuary'),
(11, 16459, 'Marshal''s Dragonhide Boots', 397, 'Field Marshal''s Sanctuary'),
(11, 16448, 'Marshal''s Dragonhide Gauntlets', 397, 'Field Marshal''s Sanctuary'),
(11, 16450, 'Marshal''s Dragonhide Legguards', 397, 'Field Marshal''s Sanctuary');

-- Insert Armor Sets for Hunter: Field Marshal's Pursuit Item Set 395
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 16466, 'Field Marshal''s Chain Breastplate', 395, 'Field Marshal''s Pursuit'),
(3, 16465, 'Field Marshal''s Chain Helm', 395, 'Field Marshal''s Pursuit'),
(3, 16468, 'Field Marshal''s Chain Spaulders', 395, 'Field Marshal''s Pursuit'),
(3, 16462, 'Marshal''s Chain Boots', 395, 'Field Marshal''s Pursuit'),
(3, 16463, 'Marshal''s Chain Grips', 395, 'Field Marshal''s Pursuit'),
(3, 16467, 'Marshal''s Chain Legguards', 395, 'Field Marshal''s Pursuit');

-- Insert Armor Sets for Mage: Field Marshal's Regalia Item set 388
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 16441, 'Field Marshal''s Coronet', 388, 'Field Marshal''s Regalia'),
(8, 16444, 'Field Marshal''s Silk Spaulders', 388, 'Field Marshal''s Regalia'),
(8, 16443, 'Field Marshal''s Silk Vestments', 388, 'Field Marshal''s Regalia'),
(8, 16437, 'Marshal''s Silk Footwraps', 388, 'Field Marshal''s Regalia'),
(8, 16440, 'Marshal''s Silk Gloves', 388, 'Field Marshal''s Regalia'),
(8, 16442, 'Marshal''s Silk Leggings', 388, 'Field Marshal''s Regalia');

-- Insert Armor Sets for Paladin: Field Marshal's Aegis Item Set 402
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 16473, 'Field Marshal''s Lamellar Chestplate', 402, 'Field Marshal''s Aegis'),
(2, 16474, 'Field Marshal''s Lamellar Faceguard', 402, 'Field Marshal''s Aegis'),
(2, 16476, 'Field Marshal''s Lamellar Pauldrons', 402, 'Field Marshal''s Aegis'),
(2, 16472, 'Marshal''s Lamellar Boots', 402, 'Field Marshal''s Aegis'),
(2, 16471, 'Marshal''s Lamellar Gloves', 402, 'Field Marshal''s Aegis'),
(2, 16475, 'Marshal''s Lamellar Legplates', 402, 'Field Marshal''s Aegis');

-- Insert Armor Sets for Priest: Field Marshal's Raiment Item Set 389
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 17604, 'Field Marshal''s Satin Mantle', 389, 'Field Marshal''s Raiment'),
(5, 17603, 'Marshal''s Satin Pants', 389, 'Field Marshal''s Raiment'),
(5, 17605, 'Field Marshal''s Satin Vestments', 389, 'Field Marshal''s Raiment'),
(5, 17608, 'Marshal''s Satin Gloves', 389, 'Field Marshal''s Raiment'),
(5, 17607, 'Marshal''s Satin Sandals', 389, 'Field Marshal''s Raiment'),
(5, 17602, 'Field Marshal''s Headdress', 389, 'Field Marshal''s Raiment');

-- Insert Armor Sets for Rogue: Field Marshal's Vestments Item Set 394
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 16453, 'Field Marshal''s Leather Chestpiece', 394, 'Field Marshal''s Vestments'),
(4, 16457, 'Field Marshal''s Leather Epaulets', 394, 'Field Marshal''s Vestments'),
(4, 16455, 'Field Marshal''s Leather Mask', 394, 'Field Marshal''s Vestments'),
(4, 16446, 'Marshal''s Leather Footguards', 394, 'Field Marshal''s Vestments'),
(4, 16454, 'Marshal''s Leather Handgrips', 394, 'Field Marshal''s Vestments'),
(4, 16456, 'Marshal''s Leather Leggings', 394, 'Field Marshal''s Vestments');

-- Insert Armor Sets for Shaman: Field Marshal's Earthshaker Item Set 717
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 29608, 'Marshal''s Mail Leggings', 717, 'Field Marshal''s Earthshaker'),
(7, 29606, 'Marshal''s Mail Boots', 717, 'Field Marshal''s Earthshaker'),
(7, 29611, 'Field Marshal''s Mail Spaulders', 717, 'Field Marshal''s Earthshaker'),
(7, 29609, 'Field Marshal''s Mail Armor', 717, 'Field Marshal''s Earthshaker'),
(7, 29607, 'Marshal''s Mail Gauntlets', 717, 'Field Marshal''s Earthshaker'),
(7, 29610, 'Field Marshal''s Mail Helm', 717, 'Field Marshal''s Earthshaker');

-- Insert Armor Sets for Warlock: Field Marshal's Threads Item Set 392
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 17581, 'Field Marshal''s Dreadweave Robe', 392, 'Field Marshal''s Threads'),
(9, 17580, 'Field Marshal''s Dreadweave Shoulders', 392, 'Field Marshal''s Threads'),
(9, 17583, 'Marshal''s Dreadweave Boots', 392, 'Field Marshal''s Threads'),
(9, 17584, 'Marshal''s Dreadweave Gloves', 392, 'Field Marshal''s Threads'),
(9, 17579, 'Marshal''s Dreadweave Leggings', 392, 'Field Marshal''s Threads'),
(9, 17578, 'Field Marshal''s Coronal', 392, 'Field Marshal''s Threads');

-- Insert Armor Sets for Warrior: Field Marshal's Battlegear Item Set 384
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 16477, 'Field Marshal''s Plate Armor', 384, 'Field Marshal''s Battlegear'),
(1, 16478, 'Field Marshal''s Plate Helm', 384, 'Field Marshal''s Battlegear'),
(1, 16480, 'Field Marshal''s Plate Shoulderguards', 384, 'Field Marshal''s Battlegear'),
(1, 16483, 'Marshal''s Plate Boots', 384, 'Field Marshal''s Battlegear'),
(1, 16484, 'Marshal''s Plate Gauntlets', 384, 'Field Marshal''s Battlegear'),
(1, 16479, 'Marshal''s Plate Legguards', 384, 'Field Marshal''s Battlegear');

-- Insert Armor Sets for Druid: Warlord's Sanctuary Item Set 398
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 16554, 'General''s Dragonhide Boots', 398, 'Warlord''s Sanctuary'),
(11, 16555, 'General''s Dragonhide Gloves', 398, 'Warlord''s Sanctuary'),
(11, 16552, 'General''s Dragonhide Leggings', 398, 'Warlord''s Sanctuary'),
(11, 16551, 'Warlord''s Dragonhide Epaulets', 398, 'Warlord''s Sanctuary'),
(11, 16549, 'Warlord''s Dragonhide Hauberk', 398, 'Warlord''s Sanctuary'),
(11, 16550, 'Warlord''s Dragonhide Helmet', 398, 'Warlord''s Sanctuary');

-- Insert Armor Sets for Hunter: Warlord's Pursuit Item Set 396
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 16569, 'General''s Chain Boots', 396, 'Warlord''s Pursuit'),
(3, 16571, 'General''s Chain Gloves', 396, 'Warlord''s Pursuit'),
(3, 16567, 'General''s Chain Legguards', 396, 'Warlord''s Pursuit'),
(3, 16565, 'Warlord''s Chain Chestpiece', 396, 'Warlord''s Pursuit'),
(3, 16566, 'Warlord''s Chain Helmet', 396, 'Warlord''s Pursuit'),
(3, 16568, 'Warlord''s Chain Shoulders', 396, 'Warlord''s Pursuit');

-- Insert Armor Sets for Mage: Warlord's Regalia Item Set 387
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 16536, 'Warlord''s Silk Amice', 387, 'Warlord''s Regalia'),
(8, 16533, 'Warlord''s Silk Cowl', 387, 'Warlord''s Regalia'),
(8, 16535, 'Warlord''s Silk Raiment', 387, 'Warlord''s Regalia'),
(8, 16539, 'General''s Silk Boots', 387, 'Warlord''s Regalia'),
(8, 16540, 'General''s Silk Handguards', 387, 'Warlord''s Regalia'),
(8, 16534, 'General''s Silk Trousers', 387, 'Warlord''s Regalia');

-- Insert Armor Sets for Paladin: Warlord's Aegis Item Set 698
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 29612, 'General''s Lamellar Boots', 698, 'Warlord''s Aegis'),
(2, 29613, 'General''s Lamellar Gloves', 698, 'Warlord''s Aegis'),
(2, 29614, 'General''s Lamellar Legplates', 698, 'Warlord''s Aegis'),
(2, 29615, 'Warlord''s Lamellar Chestplate', 698, 'Warlord''s Aegis'),
(2, 29616, 'Warlord''s Lamellar Faceguard', 698, 'Warlord''s Aegis'),
(2, 29617, 'Warlord''s Lamellar Pauldrons', 698, 'Warlord''s Aegis');

-- Insert Armor Sets for Priest: Warlord's Raiment Item Set 390
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 17623, 'Warlord''s Satin Cowl', 390, 'Warlord''s Raiment'),
(5, 17625, 'General''s Satin Leggings', 390, 'Warlord''s Raiment'),
(5, 17622, 'Warlord''s Satin Mantle', 390, 'Warlord''s Raiment'),
(5, 17624, 'Warlord''s Satin Robes', 390, 'Warlord''s Raiment'),
(5, 17618, 'General''s Satin Boots', 390, 'Warlord''s Raiment'),
(5, 17620, 'General''s Satin Gloves', 390, 'Warlord''s Raiment');

-- Insert Armor Sets for Rogue: Warlord's Vestments Item Set 393
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 16563, 'Warlord''s Leather Breastplate', 393, 'Warlord''s Vestments'),
(4, 16561, 'Warlord''s Leather Helm', 393, 'Warlord''s Vestments'),
(4, 16562, 'Warlord''s Leather Spaulders', 393, 'Warlord''s Vestments'),
(4, 16564, 'General''s Leather Legguards', 393, 'Warlord''s Vestments'),
(4, 16560, 'General''s Leather Mitts', 393, 'Warlord''s Vestments'),
(4, 16558, 'General''s Leather Treads', 393, 'Warlord''s Vestments');

-- Insert Armor Sets for Shaman: Warlord's Earthshaker Item Set 386
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 16577, 'Warlord''s Mail Armor', 386, 'Warlord''s Earthshaker'),
(7, 16578, 'Warlord''s Mail Helm', 386, 'Warlord''s Earthshaker'),
(7, 16580, 'Warlord''s Mail Spaulders', 386, 'Warlord''s Earthshaker'),
(7, 16573, 'General''s Mail Boots', 386, 'Warlord''s Earthshaker'),
(7, 16574, 'General''s Mail Gauntlets', 386, 'Warlord''s Earthshaker'),
(7, 16579, 'General''s Mail Leggings', 386, 'Warlord''s Earthshaker');

-- Insert Armor Sets for Warlock: Warlord's Threads Item Set 391
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 17586, 'General''s Dreadweave Boots', 391, 'Warlord''s Threads'),
(9, 17588, 'General''s Dreadweave Gloves', 391, 'Warlord''s Threads'),
(9, 17593, 'General''s Dreadweave Pants', 391, 'Warlord''s Threads'),
(9, 17591, 'Warlord''s Dreadweave Hood', 391, 'Warlord''s Threads'),
(9, 17590, 'Warlord''s Dreadweave Mantle', 391, 'Warlord''s Threads'),
(9, 17592, 'Warlord''s Dreadweave Robe', 391, 'Warlord''s Threads');

-- Insert Armor Sets for Warrior: Warlord's Battlegear Item Set 383
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 16541, 'Warlord''s Plate Armor', 383, 'Warlord''s Battlegear'),
(1, 16542, 'Warlord''s Plate Headpiece', 383, 'Warlord''s Battlegear'),
(1, 16544, 'Warlord''s Plate Shoulders', 383, 'Warlord''s Battlegear'),
(1, 16545, 'General''s Plate Boots', 383, 'Warlord''s Battlegear'),
(1, 16548, 'General''s Plate Gauntlets', 383, 'Warlord''s Battlegear'),
(1, 16543, 'General''s Plate Leggings', 383, 'Warlord''s Battlegear');


-- [[ Dungeon Set 1 ]]



-- Insert Armor Sets for Druid: Wildheart Raiment Item Set 185
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 16716, 'Wildheart Belt', 185, 'Wildheart Raiment'),
(11, 16715, 'Wildheart Boots', 185, 'Wildheart Raiment'),
(11, 16714, 'Wildheart Bracers', 185, 'Wildheart Raiment'),
(11, 16720, 'Wildheart Cowl', 185, 'Wildheart Raiment'),
(11, 16706, 'Wildheart Vest', 185, 'Wildheart Raiment'),
(11, 16718, 'Wildheart Spaulders', 185, 'Wildheart Raiment'),
(11, 16719, 'Wildheart Kilt', 185, 'Wildheart Raiment'),
(11, 16717, 'Wildheart Gloves', 185, 'Wildheart Raiment');

-- Insert Armor Sets for Hunter: Beaststalker Armor Item Set 186
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 16680, 'Beaststalker''s Belt', 186, 'Beaststalker Armor'),
(3, 16675, 'Beaststalker''s Boots', 186, 'Beaststalker Armor'),
(3, 16681, 'Beaststalker''s Bindings', 186, 'Beaststalker Armor'),
(3, 16677, 'Beaststalker''s Cap', 186, 'Beaststalker Armor'),
(3, 16674, 'Beaststalker''s Tunic', 186, 'Beaststalker Armor'),
(3, 16678, 'Beaststalker''s Pants', 186, 'Beaststalker Armor'),
(3, 16679, 'Beaststalker''s Mantle', 186, 'Beaststalker Armor'),
(3, 16676, 'Beaststalker''s Gloves', 186, 'Beaststalker Armor');

-- Insert Armor Sets for Mage: Magister's Regalia Item Set 181
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 16685, 'Magister''s Belt', 181, 'Magister''s Regalia'),
(8, 16683, 'Magister''s Bindings', 181, 'Magister''s Regalia'),
(8, 16686, 'Magister''s Crown', 181, 'Magister''s Regalia'),
(8, 16684, 'Magister''s Gloves', 181, 'Magister''s Regalia'),
(8, 16687, 'Magister''s Leggings', 181, 'Magister''s Regalia'),
(8, 16689, 'Magister''s Mantle', 181, 'Magister''s Regalia'),
(8, 16688, 'Magister''s Robes', 181, 'Magister''s Regalia'),
(8, 16682, 'Magister''s Boots', 181, 'Magister''s Regalia');

-- Insert Armor Sets for Paladin: Lightforge Armor Item Set 188
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 16723, 'Lightforge Belt', 188, 'Lightforge Armor'),
(2, 16725, 'Lightforge Boots', 188, 'Lightforge Armor'),
(2, 16722, 'Lightforge Bracers', 188, 'Lightforge Armor'),
(2, 16726, 'Lightforge Breastplate', 188, 'Lightforge Armor'),
(2, 16724, 'Lightforge Gauntlets', 188, 'Lightforge Armor'),
(2, 16728, 'Lightforge Legplates', 188, 'Lightforge Armor'),
(2, 16729, 'Lightforge Spaulders', 188, 'Lightforge Armor'),
(2, 16727, 'Lightforge Helm', 188, 'Lightforge Armor');

-- Insert Armor Sets for Priest: Vestments of the Devout Item Set 182
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 16696, 'Devout Belt', 182, 'Vestments of the Devout'),
(5, 16691, 'Devout Sandals', 182, 'Vestments of the Devout'),
(5, 16697, 'Devout Bracers', 182, 'Vestments of the Devout'),
(5, 16693, 'Devout Crown', 182, 'Vestments of the Devout'),
(5, 16692, 'Devout Gloves', 182, 'Vestments of the Devout'),
(5, 16695, 'Devout Mantle', 182, 'Vestments of the Devout'),
(5, 16694, 'Devout Skirt', 182, 'Vestments of the Devout'),
(5, 16690, 'Devout Robe', 182, 'Vestments of the Devout');

-- Insert Armor Sets for Rogue: Shadowcraft Armor Item Set 184
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 16713, 'Shadowcraft Belt', 184, 'Shadowcraft Armor'),
(4, 16711, 'Shadowcraft Boots', 184, 'Shadowcraft Armor'),
(4, 16710, 'Shadowcraft Bracers', 184, 'Shadowcraft Armor'),
(4, 16721, 'Shadowcraft Tunic', 184, 'Shadowcraft Armor'),
(4, 16708, 'Shadowcraft Spaulders', 184, 'Shadowcraft Armor'),
(4, 16709, 'Shadowcraft Pants', 184, 'Shadowcraft Armor'),
(4, 16712, 'Shadowcraft Gloves', 184, 'Shadowcraft Armor'),
(4, 16707, 'Shadowcraft Cap', 184, 'Shadowcraft Armor');

-- Insert Armor Sets for Shaman: The Elements Item Set 187
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 16673, 'Cord of Elements', 187, 'The Elements'),
(7, 16670, 'Boots of Elements', 187, 'The Elements'),
(7, 16671, 'Bindings of Elements', 187, 'The Elements'),
(7, 16667, 'Coif of Elements', 187, 'The Elements'),
(7, 16672, 'Gauntlets of Elements', 187, 'The Elements'),
(7, 16668, 'Kilt of Elements', 187, 'The Elements'),
(7, 16669, 'Pauldrons of Elements', 187, 'The Elements'),
(7, 16666, 'Vest of Elements', 187, 'The Elements');

-- Insert Armor Sets for Warlock: Dreadmist Raiment Item Set 183
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 16702, 'Dreadmist Belt', 183, 'Dreadmist Raiment'),
(9, 16703, 'Dreadmist Bracers', 183, 'Dreadmist Raiment'),
(9, 16699, 'Dreadmist Leggings', 183, 'Dreadmist Raiment'),
(9, 16701, 'Dreadmist Mantle', 183, 'Dreadmist Raiment'),
(9, 16700, 'Dreadmist Robe', 183, 'Dreadmist Raiment'),
(9, 16704, 'Dreadmist Sandals', 183, 'Dreadmist Raiment'),
(9, 16698, 'Dreadmist Mask', 183, 'Dreadmist Raiment'),
(9, 16705, 'Dreadmist Wraps', 183, 'Dreadmist Raiment');

-- Insert Armor Sets for Warrior: Battlegear of Valor Item Set 189
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 16736, 'Belt of Valor', 189, 'Battlegear of Valor'),
(1, 16734, 'Boots of Valor', 189, 'Battlegear of Valor'),
(1, 16735, 'Bracers of Valor', 189, 'Battlegear of Valor'),
(1, 16730, 'Breastplate of Valor', 189, 'Battlegear of Valor'),
(1, 16737, 'Gauntlets of Valor', 189, 'Battlegear of Valor'),
(1, 16731, 'Helm of Valor', 189, 'Battlegear of Valor'),
(1, 16732, 'Legplates of Valor', 189, 'Battlegear of Valor'),
(1, 16733, 'Spaulders of Valor', 189, 'Battlegear of Valor');


-- [[ Dungeon Set 2 ]]



-- Insert Armor Sets for Druid: Feralheart Raiment Item Set 513
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 22106, 'Feralheart Belt', 513, 'Feralheart Raiment'),
(11, 22107, 'Feralheart Boots', 513, 'Feralheart Raiment'),
(11, 22108, 'Feralheart Bracers', 513, 'Feralheart Raiment'),
(11, 22109, 'Feralheart Cowl', 513, 'Feralheart Raiment'),
(11, 22110, 'Feralheart Gloves', 513, 'Feralheart Raiment'),
(11, 22111, 'Feralheart Kilt', 513, 'Feralheart Raiment'),
(11, 22112, 'Feralheart Spaulders', 513, 'Feralheart Raiment'),
(11, 22113, 'Feralheart Vest', 513, 'Feralheart Raiment');

-- Insert Armor Sets for Hunter: Beastmaster Armor Item Set 515
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 22010, 'Beastmaster\'s Belt', 515, 'Beastmaster Armor'),
(3, 22011, 'Beastmaster\'s Bindings', 515, 'Beastmaster Armor'),
(3, 22061, 'Beastmaster\'s Boots', 515, 'Beastmaster Armor'),
(3, 22013, 'Beastmaster\'s Cap', 515, 'Beastmaster Armor'),
(3, 22015, 'Beastmaster\'s Gloves', 515, 'Beastmaster Armor'),
(3, 22016, 'Beastmaster\'s Mantle', 515, 'Beastmaster Armor'),
(3, 22017, 'Beastmaster\'s Pants', 515, 'Beastmaster Armor'),
(3, 22060, 'Beastmaster\'s Tunic', 515, 'Beastmaster Armor');

-- Insert Armor Sets for Mage: Sorcerer's Regalia Item Set 517
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 22062, 'Sorcerer\'s Belt', 517, 'Sorcerer\'s Regalia'),
(8, 22063, 'Sorcerer\'s Bindings', 517, 'Sorcerer\'s Regalia'),
(8, 22064, 'Sorcerer\'s Boots', 517, 'Sorcerer\'s Regalia'),
(8, 22065, 'Sorcerer\'s Crown', 517, 'Sorcerer\'s Regalia'),
(8, 22066, 'Sorcerer\'s Gloves', 517, 'Sorcerer\'s Regalia'),
(8, 22067, 'Sorcerer\'s Leggings', 517, 'Sorcerer\'s Regalia'),
(8, 22068, 'Sorcerer\'s Mantle', 517, 'Sorcerer\'s Regalia'),
(8, 22069, 'Sorcerer\'s Robes', 517, 'Sorcerer\'s Regalia');

-- Insert Armor Sets for Paladin: Soulforge Armor Item Set 516
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 22086, 'Soulforge Belt', 516, 'Soulforge Armor'),
(2, 22087, 'Soulforge Boots', 516, 'Soulforge Armor'),
(2, 22088, 'Soulforge Bracers', 516, 'Soulforge Armor'),
(2, 22089, 'Soulforge Breastplate', 516, 'Soulforge Armor'),
(2, 22090, 'Soulforge Gauntlets', 516, 'Soulforge Armor'),
(2, 22091, 'Soulforge Helm', 516, 'Soulforge Armor'),
(2, 22092, 'Soulforge Legplates', 516, 'Soulforge Armor'),
(2, 22093, 'Soulforge Spaulders', 516, 'Soulforge Armor');

-- Insert Armor Sets for Priest: Vestments of the Virtuous Item Set 514
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 22078, 'Virtuous Belt', 514, 'Vestments of the Virtuous'),
(5, 22079, 'Virtuous Bracers', 514, 'Vestments of the Virtuous'),
(5, 22080, 'Virtuous Crown', 514, 'Vestments of the Virtuous'),
(5, 22081, 'Virtuous Gloves', 514, 'Vestments of the Virtuous'),
(5, 22082, 'Virtuous Mantle', 514, 'Vestments of the Virtuous'),
(5, 22083, 'Virtuous Robe', 514, 'Vestments of the Virtuous'),
(5, 22084, 'Virtuous Sandals', 514, 'Vestments of the Virtuous'),
(5, 22085, 'Virtuous Skirt', 514, 'Vestments of the Virtuous');

-- Insert Armor Sets for Rogue: Darkmantle Armor Item Set 512
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 22002, 'Darkmantle Belt', 512, 'Darkmantle Armor'),
(4, 22003, 'Darkmantle Boots', 512, 'Darkmantle Armor'),
(4, 22004, 'Darkmantle Bracers', 512, 'Darkmantle Armor'),
(4, 22005, 'Darkmantle Cap', 512, 'Darkmantle Armor'),
(4, 22006, 'Darkmantle Gloves', 512, 'Darkmantle Armor'),
(4, 22007, 'Darkmantle Pants', 512, 'Darkmantle Armor'),
(4, 22008, 'Darkmantle Spaulders', 512, 'Darkmantle Armor'),
(4, 22009, 'Darkmantle Tunic', 512, 'Darkmantle Armor');

-- Insert Armor Sets for Shaman: The Five Thunders Item Set 519
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 22095, 'Bindings of The Five Thunders', 519, 'The Five Thunders'),
(7, 22096, 'Boots of The Five Thunders', 519, 'The Five Thunders'),
(7, 22097, 'Coif of The Five Thunders', 519, 'The Five Thunders'),
(7, 22098, 'Cord of The Five Thunders', 519, 'The Five Thunders'),
(7, 22099, 'Gauntlets of The Five Thunders', 519, 'The Five Thunders'),
(7, 22100, 'Kilt of The Five Thunders', 519, 'The Five Thunders'),
(7, 22101, 'Pauldrons of The Five Thunders', 519, 'The Five Thunders'),
(7, 22102, 'Vest of The Five Thunders', 519, 'The Five Thunders');

-- Insert Armor Sets for Warlock: Deathmist Raiment Item Set 518
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 22070, 'Deathmist Belt', 518, 'Deathmist Raiment'),
(9, 22071, 'Deathmist Bracers', 518, 'Deathmist Raiment'),
(9, 22072, 'Deathmist Leggings', 518, 'Deathmist Raiment'),
(9, 22073, 'Deathmist Mantle', 518, 'Deathmist Raiment'),
(9, 22074, 'Deathmist Mask', 518, 'Deathmist Raiment'),
(9, 22075, 'Deathmist Robe', 518, 'Deathmist Raiment'),
(9, 22076, 'Deathmist Sandals', 518, 'Deathmist Raiment'),
(9, 22077, 'Deathmist Wraps', 518, 'Deathmist Raiment');

-- Insert Armor Sets for Warrior: Battlegear of Heroism Item Set 511
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 21994, 'Belt of Heroism', 511, 'Battlegear of Heroism'),
(1, 21995, 'Boots of Heroism', 511, 'Battlegear of Heroism'),
(1, 21996, 'Bracers of Heroism', 511, 'Battlegear of Heroism'),
(1, 21997, 'Breastplate of Heroism', 511, 'Battlegear of Heroism'),
(1, 21998, 'Gauntlets of Heroism', 511, 'Battlegear of Heroism'),
(1, 21999, 'Helm of Heroism', 511, 'Battlegear of Heroism'),
(1, 22000, 'Legplates of Heroism', 511, 'Battlegear of Heroism'),
(1, 22001, 'Spaulders of Heroism', 511, 'Battlegear of Heroism');





-- [[ Tier 1 ]]




-- Insert Armor Sets for Druid: Cenarion Raiment Item Set 205
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 16828, 'Cenarion Belt', 205, 'Cenarion Raiment'),
(11, 16829, 'Cenarion Boots', 205, 'Cenarion Raiment'),
(11, 16830, 'Cenarion Bracers', 205, 'Cenarion Raiment'),
(11, 16833, 'Cenarion Vestments', 205, 'Cenarion Raiment'),
(11, 16831, 'Cenarion Gloves', 205, 'Cenarion Raiment'),
(11, 16834, 'Cenarion Helm', 205, 'Cenarion Raiment'),
(11, 16835, 'Cenarion Leggings', 205, 'Cenarion Raiment'),
(11, 16836, 'Cenarion Spaulders', 205, 'Cenarion Raiment');

-- Insert Armor Sets for Hunter: Giantstalker Armor Item Set 206
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 16851, 'Giantstalker\'s Belt', 206, 'Giantstalker Armor'),
(3, 16849, 'Giantstalker\'s Boots', 206, 'Giantstalker Armor'),
(3, 16850, 'Giantstalker\'s Bracers', 206, 'Giantstalker Armor'),
(3, 16845, 'Giantstalker\'s Breastplate', 206, 'Giantstalker Armor'),
(3, 16848, 'Giantstalker\'s Epaulets', 206, 'Giantstalker Armor'),
(3, 16852, 'Giantstalker\'s Gloves', 206, 'Giantstalker Armor'),
(3, 16846, 'Giantstalker\'s Helmet', 206, 'Giantstalker Armor'),
(3, 16847, 'Giantstalker\'s Leggings', 206, 'Giantstalker Armor');

-- Insert Armor Sets for Mage: Arcanist Regalia Item Set 201
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 16802, 'Arcanist Belt', 201, 'Arcanist Regalia'),
(8, 16799, 'Arcanist Bindings', 201, 'Arcanist Regalia'),
(8, 16795, 'Arcanist Crown', 201, 'Arcanist Regalia'),
(8, 16800, 'Arcanist Boots', 201, 'Arcanist Regalia'),
(8, 16801, 'Arcanist Gloves', 201, 'Arcanist Regalia'),
(8, 16796, 'Arcanist Leggings', 201, 'Arcanist Regalia'),
(8, 16797, 'Arcanist Mantle', 201, 'Arcanist Regalia'),
(8, 16798, 'Arcanist Robes', 201, 'Arcanist Regalia');

-- Insert Armor Sets for Paladin: Lawbringer Armor Item Set 208
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 16858, 'Lawbringer Belt', 208, 'Lawbringer Armor'),
(2, 16859, 'Lawbringer Boots', 208, 'Lawbringer Armor'),
(2, 16857, 'Lawbringer Bracers', 208, 'Lawbringer Armor'),
(2, 16853, 'Lawbringer Chestguard', 208, 'Lawbringer Armor'),
(2, 16860, 'Lawbringer Gauntlets', 208, 'Lawbringer Armor'),
(2, 16854, 'Lawbringer Helm', 208, 'Lawbringer Armor'),
(2, 16855, 'Lawbringer Legplates', 208, 'Lawbringer Armor'),
(2, 16856, 'Lawbringer Spaulders', 208, 'Lawbringer Armor');

-- Insert Armor Sets for Priest: Vestments of Prophecy Item Set 202
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 16811, 'Boots of Prophecy', 202, 'Vestments of Prophecy'),
(5, 16813, 'Circlet of Prophecy', 202, 'Vestments of Prophecy'),
(5, 16817, 'Girdle of Prophecy', 202, 'Vestments of Prophecy'),
(5, 16812, 'Gloves of Prophecy', 202, 'Vestments of Prophecy'),
(5, 16814, 'Pants of Prophecy', 202, 'Vestments of Prophecy'),
(5, 16816, 'Mantle of Prophecy', 202, 'Vestments of Prophecy'),
(5, 16815, 'Robes of Prophecy', 202, 'Vestments of Prophecy'),
(5, 16819, 'Vambraces of Prophecy', 202, 'Vestments of Prophecy');

-- Insert Armor Sets for Rogue: Nightslayer Armor Item Set 204
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 16827, 'Nightslayer Belt', 204, 'Nightslayer Armor'),
(4, 16824, 'Nightslayer Boots', 204, 'Nightslayer Armor'),
(4, 16825, 'Nightslayer Bracers', 204, 'Nightslayer Armor'),
(4, 16820, 'Nightslayer Chestpiece', 204, 'Nightslayer Armor'),
(4, 16821, 'Nightslayer Cover', 204, 'Nightslayer Armor'),
(4, 16826, 'Nightslayer Gloves', 204, 'Nightslayer Armor'),
(4, 16822, 'Nightslayer Pants', 204, 'Nightslayer Armor'),
(4, 16823, 'Nightslayer Shoulder Pads', 204, 'Nightslayer Armor');

-- Insert Armor Sets for Shaman: Earthfury Raiment Item Set 207
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 16838, 'Earthfury Belt', 207, 'Earthfury Raiment'),
(7, 16837, 'Earthfury Boots', 207, 'Earthfury Raiment'),
(7, 16840, 'Earthfury Bracers', 207, 'Earthfury Raiment'),
(7, 16841, 'Earthfury Vestments', 207, 'Earthfury Raiment'),
(7, 16844, 'Earthfury Epaulets', 207, 'Earthfury Raiment'),
(7, 16839, 'Earthfury Gauntlets', 207, 'Earthfury Raiment'),
(7, 16842, 'Earthfury Helmet', 207, 'Earthfury Raiment'),
(7, 16843, 'Earthfury Legguards', 207, 'Earthfury Raiment');

-- Insert Armor Sets for Warlock: Felheart Raiment Item Set 203
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 16806, 'Felheart Belt', 203, 'Felheart Raiment'),
(9, 16804, 'Felheart Bracers', 203, 'Felheart Raiment'),
(9, 16805, 'Felheart Gloves', 203, 'Felheart Raiment'),
(9, 16810, 'Felheart Pants', 203, 'Felheart Raiment'),
(9, 16809, 'Felheart Robes', 203, 'Felheart Raiment'),
(9, 16807, 'Felheart Shoulder Pads', 203, 'Felheart Raiment'),
(9, 16808, 'Felheart Horns', 203, 'Felheart Raiment'),
(9, 16803, 'Felheart Slippers', 203, 'Felheart Raiment');

-- Insert Armor Sets for Warrior: Battlegear of Might Item Set 209
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 16864, 'Belt of Might', 209, 'Battlegear of Might'),
(1, 16861, 'Bracers of Might', 209, 'Battlegear of Might'),
(1, 16865, 'Breastplate of Might', 209, 'Battlegear of Might'),
(1, 16863, 'Gauntlets of Might', 209, 'Battlegear of Might'),
(1, 16866, 'Helm of Might', 209, 'Battlegear of Might'),
(1, 16867, 'Legplates of Might', 209, 'Battlegear of Might'),
(1, 16868, 'Pauldrons of Might', 209, 'Battlegear of Might'),
(1, 16862, 'Sabatons of Might', 209, 'Battlegear of Might');



-- [[ Tier 1.5/ Zandalar Tribe Set ]]




-- Insert Armor Sets for Druid: Haruspex's Garb Item Set 479
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 19613, 'Pristine Enchanted South Seas Kelp', 479, 'Haruspex''s Garb'),
(11, 19955, 'Wushoolay''s Charm of Nature', 479, 'Haruspex''s Garb'),
(11, 19840, 'Zandalar Haruspex''s Bracers', 479, 'Haruspex''s Garb'),
(11, 19839, 'Zandalar Haruspex''s Belt', 479, 'Haruspex''s Garb'),
(11, 19838, 'Haruspex''s Tunic', 479, 'Haruspex''s Garb');

-- Insert Armor Sets for Hunter: Predator's Armor Item Set 477
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 19621, 'Maelstrom''s Wrath', 477, 'Predator''s Armor'),
(3, 19953, 'Renataki''s Charm of Beasts', 477, 'Predator''s Armor'),
(3, 19833, 'Zandalar Predator''s Bracers', 477, 'Predator''s Armor'),
(3, 19832, 'Zandalar Predator''s Belt', 477, 'Predator''s Armor'),
(3, 19831, 'Zandalar Predator''s Mantle', 477, 'Predator''s Armor');

-- Insert Armor Sets for Mage: Illusionist's Attire Item Set 482
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 19601, 'Jewel of Kajaro', 482, 'Illusionist''s Attire'),
(8, 19959, 'Hazza''rah''s Charm of Magic', 482, 'Illusionist''s Attire'),
(8, 19846, 'Zandalar Illusionist''s Wraps', 482, 'Illusionist''s Attire'),
(8, 19845, 'Zandalar Illusionist''s Mantle', 482, 'Illusionist''s Attire'),
(8, 20034, 'Zandalar Illusionist''s Robe', 482, 'Illusionist''s Attire');

-- Insert Armor Sets for Paladin: Freethinker's Armor Item Set 475
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 19952, 'Gri''lek''s Charm of Valor', 475, 'Freethinker''s Armor'),
(2, 19588, 'Hero''s Brand', 475, 'Freethinker''s Armor'),
(2, 19827, 'Zandalar Freethinker''s Armguards', 475, 'Freethinker''s Armor'),
(2, 19826, 'Zandalar Freethinker''s Belt', 475, 'Freethinker''s Armor'),
(2, 19825, 'Zandalar Freethinker''s Breastplate', 475, 'Freethinker''s Armor');

-- Insert Armor Sets for Priest: Confessor's Raiment Item Set 480
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 19594, 'The All-Seeing Eye of Zuldazar', 480, 'Confessor''s Raiment'),
(5, 19958, 'Hazza''rah''s Charm of Healing', 480, 'Confessor''s Raiment'),
(5, 19843, 'Zandalar Confessor''s Wraps', 480, 'Confessor''s Raiment'),
(5, 19842, 'Zandalar Confessor''s Bindings', 480, 'Confessor''s Raiment'),
(5, 19841, 'Zandalar Confessor''s Mantle', 480, 'Confessor''s Raiment');

-- Insert Armor Sets for Rogue: Madcap's Outfit Item Set 478
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 19617, 'Zandalarian Shadow Mastery Talisman', 478, 'Madcap''s Outfit'),
(4, 19954, 'Renataki''s Charm of Trickery', 478, 'Madcap''s Outfit'),
(4, 19836, 'Zandalar Madcap''s Bracers', 478, 'Madcap''s Outfit'),
(4, 19835, 'Zandalar Madcap''s Mantle', 478, 'Madcap''s Outfit'),
(4, 19834, 'Zandalar Madcap''s Tunic', 478, 'Madcap''s Outfit');

-- Insert Armor Sets for Shaman: Augur's Regalia Item Set 476
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 19609, 'Unmarred Vision of Voodress', 476, 'Augur''s Regalia'),
(7, 19956, 'Wushoolay''s Charm of Spirits', 476, 'Augur''s Regalia'),
(7, 19830, 'Zandalar Augur''s Bracers', 476, 'Augur''s Regalia'),
(7, 19829, 'Zandalar Augur''s Belt', 476, 'Augur''s Regalia'),
(7, 19828, 'Zandalar Augur''s Hauberk', 476, 'Augur''s Regalia');

-- Insert Armor Sets for Warlock: Demoniac's Threads Item Set 481
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 19605, 'Kezan''s Unstoppable Taint', 481, 'Demoniac''s Threads'),
(9, 19957, 'Hazza''rah''s Charm of Destruction', 481, 'Demoniac''s Threads'),
(9, 19848, 'Zandalar Demoniac''s Wraps', 481, 'Demoniac''s Threads'),
(9, 19849, 'Zandalar Demoniac''s Mantle', 481, 'Demoniac''s Threads'),
(9, 20033, 'Zandalar Demoniac''s Robe', 481, 'Demoniac''s Threads');

-- Insert Armor Sets for Warrior: Vindicator's Battlegear Item Set 474
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 19951, 'Gri''lek''s Charm of Might', 474, 'Vindicator''s Battlegear'),
(1, 19577, 'Rage of Mugamba', 474, 'Vindicator''s Battlegear'),
(1, 19824, 'Zandalar Vindicator''s Armguards', 474, 'Vindicator''s Battlegear'),
(1, 19823, 'Zandalar Vindicator''s Belt', 474, 'Vindicator''s Battlegear'),
(1, 19822, 'Zandalar Vindicator''s Breastplate', 474, 'Vindicator''s Battlegear');





-- [[ Tier 2 Armor Sets ]]




-- Insert Armor Sets for Druid: Stormrage Raiment Item Set 214
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 16903, 'Stormrage Belt', 214, 'Stormrage Raiment'),
(11, 16898, 'Stormrage Boots', 214, 'Stormrage Raiment'),
(11, 16904, 'Stormrage Bracers', 214, 'Stormrage Raiment'),
(11, 16897, 'Stormrage Chestguard', 214, 'Stormrage Raiment'),
(11, 16900, 'Stormrage Cover', 214, 'Stormrage Raiment'),
(11, 16899, 'Stormrage Handguards', 214, 'Stormrage Raiment'),
(11, 16901, 'Stormrage Legguards', 214, 'Stormrage Raiment'),
(11, 16902, 'Stormrage Pauldrons', 214, 'Stormrage Raiment');

-- Insert Armor Sets for Hunter: Dragonstalker Armor Item Set 215
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 16936, 'Dragonstalker\'s Belt', 215, 'Dragonstalker Armor'),
(3, 16935, 'Dragonstalker\'s Bracers', 215, 'Dragonstalker Armor'),
(3, 16942, 'Dragonstalker\'s Breastplate', 215, 'Dragonstalker Armor'),
(3, 16940, 'Dragonstalker\'s Gauntlets', 215, 'Dragonstalker Armor'),
(3, 16941, 'Dragonstalker\'s Greaves', 215, 'Dragonstalker Armor'),
(3, 16939, 'Dragonstalker\'s Helm', 215, 'Dragonstalker Armor'),
(3, 16938, 'Dragonstalker\'s Legguards', 215, 'Dragonstalker Armor'),
(3, 16937, 'Dragonstalker\'s Spaulders', 215, 'Dragonstalker Armor');

-- Insert Armor Sets for Mage: Netherwind Regalia Item Set 210
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 16818, 'Netherwind Belt', 210, 'Netherwind Regalia'),
(8, 16918, 'Netherwind Bindings', 210, 'Netherwind Regalia'),
(8, 16912, 'Netherwind Boots', 210, 'Netherwind Regalia'),
(8, 16914, 'Netherwind Crown', 210, 'Netherwind Regalia'),
(8, 16917, 'Netherwind Mantle', 210, 'Netherwind Regalia'),
(8, 16913, 'Netherwind Gloves', 210, 'Netherwind Regalia'),
(8, 16915, 'Netherwind Pants', 210, 'Netherwind Regalia'),
(8, 16916, 'Netherwind Robes', 210, 'Netherwind Regalia');

-- Insert Armor Sets for Paladin: Judgment Armor Item Set 217
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 16952, 'Judgment Belt', 217, 'Judgment Armor'),
(2, 16951, 'Judgment Bindings', 217, 'Judgment Armor'),
(2, 16958, 'Judgment Breastplate', 217, 'Judgment Armor'),
(2, 16955, 'Judgment Crown', 217, 'Judgment Armor'),
(2, 16956, 'Judgment Gauntlets', 217, 'Judgment Armor'),
(2, 16954, 'Judgment Legplates', 217, 'Judgment Armor'),
(2, 16957, 'Judgment Sabatons', 217, 'Judgment Armor'),
(2, 16953, 'Judgment Spaulders', 217, 'Judgment Armor');

-- Insert Armor Sets for Priest: Vestments of Transcendence Item Set 211
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 16925, 'Belt of Transcendence', 211, 'Vestments of Transcendence'),
(5, 16926, 'Bindings of Transcendence', 211, 'Vestments of Transcendence'),
(5, 16919, 'Boots of Transcendence', 211, 'Vestments of Transcendence'),
(5, 16921, 'Halo of Transcendence', 211, 'Vestments of Transcendence'),
(5, 16920, 'Handguards of Transcendence', 211, 'Vestments of Transcendence'),
(5, 16922, 'Leggings of Transcendence', 211, 'Vestments of Transcendence'),
(5, 16924, 'Pauldrons of Transcendence', 211, 'Vestments of Transcendence'),
(5, 16923, 'Robes of Transcendence', 211, 'Vestments of Transcendence');

-- Insert Armor Sets for Rogue: Bloodfang Armor Item Set 213
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 16910, 'Bloodfang Belt', 213, 'Bloodfang Armor'),
(4, 16906, 'Bloodfang Boots', 213, 'Bloodfang Armor'),
(4, 16911, 'Bloodfang Bracers', 213, 'Bloodfang Armor'),
(4, 16905, 'Bloodfang Chestpiece', 213, 'Bloodfang Armor'),
(4, 16907, 'Bloodfang Gloves', 213, 'Bloodfang Armor'),
(4, 16908, 'Bloodfang Hood', 213, 'Bloodfang Armor'),
(4, 16909, 'Bloodfang Pants', 213, 'Bloodfang Armor'),
(4, 16832, 'Bloodfang Spaulders', 213, 'Bloodfang Armor');

-- Insert Armor Sets for Shaman: The Ten Storms Item Set 216
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 16944, 'Belt of Ten Storms', 216, 'The Ten Storms'),
(7, 16943, 'Bracers of Ten Storms', 216, 'The Ten Storms'),
(7, 16950, 'Breastplate of Ten Storms', 216, 'The Ten Storms'),
(7, 16945, 'Epaulets of Ten Storms', 216, 'The Ten Storms'),
(7, 16948, 'Gauntlets of Ten Storms', 216, 'The Ten Storms'),
(7, 16949, 'Greaves of Ten Storms', 216, 'The Ten Storms'),
(7, 16947, 'Helmet of Ten Storms', 216, 'The Ten Storms'),
(7, 16946, 'Legplates of Ten Storms', 216, 'The Ten Storms');

-- Insert Armor Sets for Warlock: Nemesis Raiment Item Set 212
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 16933, 'Nemesis Belt', 212, 'Nemesis Raiment'),
(9, 16927, 'Nemesis Boots', 212, 'Nemesis Raiment'),
(9, 16934, 'Nemesis Bracers', 212, 'Nemesis Raiment'),
(9, 16928, 'Nemesis Gloves', 212, 'Nemesis Raiment'),
(9, 16930, 'Nemesis Leggings', 212, 'Nemesis Raiment'),
(9, 16931, 'Nemesis Robes', 212, 'Nemesis Raiment'),
(9, 16929, 'Nemesis Skullcap', 212, 'Nemesis Raiment'),
(9, 16932, 'Nemesis Spaulders', 212, 'Nemesis Raiment');

-- Insert Armor Sets for Warrior: Battlegear of Wrath Item Set 218
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 16959, 'Bracelets of Wrath', 218, 'Battlegear of Wrath'),
(1, 16966, 'Breastplate of Wrath', 218, 'Battlegear of Wrath'),
(1, 16964, 'Gauntlets of Wrath', 218, 'Battlegear of Wrath'),
(1, 16963, 'Helm of Wrath', 218, 'Battlegear of Wrath'),
(1, 16962, 'Legplates of Wrath', 218, 'Battlegear of Wrath'),
(1, 16961, 'Pauldrons of Wrath', 218, 'Battlegear of Wrath'),
(1, 16965, 'Sabatons of Wrath', 218, 'Battlegear of Wrath'),
(1, 16960, 'Waistband of Wrath', 218, 'Battlegear of Wrath');




-- [[ Cenarion Circle Sets ]]




-- Insert Armor Sets for Druid: Symbols of Unending Life Item Set 494
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 21408, 'Band of Unending Life', 494, 'Symbols of Unending Life'),
(11, 21409, 'Cloak of Unending Life', 494, 'Symbols of Unending Life'),
(11, 21407, 'Mace of Unending Life', 494, 'Symbols of Unending Life');

-- Insert Armor Sets for Hunter: Trappings of the Unseen Path Item Set 510
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 21403, 'Cloak of the Unseen Path', 510, 'Trappings of the Unseen Path'),
(3, 21401, 'Scythe of the Unseen Path', 510, 'Trappings of the Unseen Path'),
(3, 21402, 'Signet of the Unseen Path', 510, 'Trappings of the Unseen Path');

-- Insert Armor Sets for Mage: Trappings of Vaulted Secrets Item Set 504
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 21414, 'Band of Vaulted Secrets', 504, 'Trappings of Vaulted Secrets'),
(8, 21413, 'Blade of Vaulted Secrets', 504, 'Trappings of Vaulted Secrets'),
(8, 21415, 'Drape of Vaulted Secrets', 504, 'Trappings of Vaulted Secrets');

-- Insert Armor Sets for Paladin: Battlegear of Eternal Justice Item Set 506
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 21397, 'Cape of Eternal Justice', 506, 'Battlegear of Eternal Justice'),
(2, 21395, 'Blade of Eternal Justice', 506, 'Battlegear of Eternal Justice'),
(2, 21396, 'Ring of Eternal Justice', 506, 'Battlegear of Eternal Justice');

-- Insert Armor Sets for Priest: Finery of Infinite Wisdom Item Set 508
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 21410, 'Gavel of Infinite Wisdom', 508, 'Finery of Infinite Wisdom'),
(5, 21411, 'Ring of Infinite Wisdom', 508, 'Finery of Infinite Wisdom'),
(5, 21412, 'Shroud of Infinite Wisdom', 508, 'Finery of Infinite Wisdom');

-- Insert Armor Sets for Rogue: Emblems of Veiled Shadows Item Set 498
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 21405, 'Band of Veiled Shadows', 498, 'Emblems of Veiled Shadows'),
(4, 21406, 'Cloak of Veiled Shadows', 498, 'Emblems of Veiled Shadows'),
(4, 21404, 'Dagger of Veiled Shadows', 498, 'Emblems of Veiled Shadows');

-- Insert Armor Sets for Shaman: Gift of the Gathering Storm Item Set 502
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 21400, 'Cloak of the Gathering Storm', 502, 'Gift of the Gathering Storm'),
(7, 21398, 'Hammer of the Gathering Storm', 502, 'Gift of the Gathering Storm'),
(7, 21399, 'Ring of the Gathering Storm', 502, 'Gift of the Gathering Storm');

-- Insert Armor Sets for Warlock: Implements of Unspoken Names Item Set 500
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 21416, 'Kris of Unspoken Names', 500, 'Implements of Unspoken Names'),
(9, 21417, 'Ring of Unspoken Names', 500, 'Implements of Unspoken Names'),
(9, 21418, 'Shroud of Unspoken Names', 500, 'Implements of Unspoken Names');

-- Insert Armor Sets for Warrior: Battlegear of Unyielding Strength Item Set 495
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 21394, 'Drape of Unyielding Strength', 495, 'Battlegear of Unyielding Strength'),
(1, 21392, 'Sickle of Unyielding Strength', 495, 'Battlegear of Unyielding Strength'),
(1, 21393, 'Signet of Unyielding Strength', 495, 'Battlegear of Unyielding Strength');




-- [[ Tier 2.5 Armor Sets ]]




-- Insert Armor Sets for Druid: Genesis Raiment Item Set 493
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 21355, 'Genesis Boots', 493, 'Genesis Raiment'),
(11, 21353, 'Genesis Helm', 493, 'Genesis Raiment'),
(11, 21354, 'Genesis Shoulderpads', 493, 'Genesis Raiment'),
(11, 21356, 'Genesis Trousers', 493, 'Genesis Raiment'),
(11, 21357, 'Genesis Vest', 493, 'Genesis Raiment');

-- Insert Armor Sets for Hunter: Striker's Garb Item Set 509
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 21366, 'Striker\'s Diadem', 509, 'Striker\'s Garb'),
(3, 21365, 'Striker\'s Footguards', 509, 'Striker\'s Garb'),
(3, 21370, 'Striker\'s Hauberk', 509, 'Striker\'s Garb'),
(3, 21368, 'Striker\'s Leggings', 509, 'Striker\'s Garb'),
(3, 21367, 'Striker\'s Pauldrons', 509, 'Striker\'s Garb');

-- Insert Armor Sets for Mage: Enigma Vestments Item Set 503
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 21344, 'Enigma Boots', 503, 'Enigma Vestments'),
(8, 21347, 'Enigma Circlet', 503, 'Enigma Vestments'),
(8, 21346, 'Enigma Leggings', 503, 'Enigma Vestments'),
(8, 21343, 'Enigma Robes', 503, 'Enigma Vestments'),
(8, 21345, 'Enigma Shoulderpads', 503, 'Enigma Vestments');

-- Insert Armor Sets for Paladin: Avenger's Battlegear Item Set 505
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 21389, 'Avenger\'s Breastplate', 505, 'Avenger\'s Battlegear'),
(2, 21387, 'Avenger\'s Crown', 505, 'Avenger\'s Battlegear'),
(2, 21388, 'Avenger\'s Greaves', 505, 'Avenger\'s Battlegear'),
(2, 21390, 'Avenger\'s Legguards', 505, 'Avenger\'s Battlegear'),
(2, 21391, 'Avenger\'s Pauldrons', 505, 'Avenger\'s Battlegear');

-- Insert Armor Sets for Priest: Garments of the Oracle Item Set 507
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 21349, 'Footwraps of the Oracle', 507, 'Garments of the Oracle'),
(5, 21350, 'Mantle of the Oracle', 507, 'Garments of the Oracle'),
(5, 21348, 'Tiara of the Oracle', 507, 'Garments of the Oracle'),
(5, 21352, 'Trousers of the Oracle', 507, 'Garments of the Oracle'),
(5, 21351, 'Vestments of the Oracle', 507, 'Garments of the Oracle');

-- Insert Armor Sets for Rogue: Deathdealer's Embrace Item Set 497
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 21359, 'Deathdealer\'s Boots', 497, 'Deathdealer\'s Embrace'),
(4, 21360, 'Deathdealer\'s Helm', 497, 'Deathdealer\'s Embrace'),
(4, 21361, 'Deathdealer\'s Spaulders', 497, 'Deathdealer\'s Embrace'),
(4, 21362, 'Deathdealer\'s Leggings', 497, 'Deathdealer\'s Embrace'),
(4, 21364, 'Deathdealer\'s Vest', 497, 'Deathdealer\'s Embrace');

-- Insert Armor Sets for Shaman: Stormcaller's Garb Item Set 501
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 21372, 'Stormcaller\'s Diadem', 501, 'Stormcaller\'s Garb'),
(7, 21373, 'Stormcaller\'s Footguards', 501, 'Stormcaller\'s Garb'),
(7, 21374, 'Stormcaller\'s Hauberk', 501, 'Stormcaller\'s Garb'),
(7, 21375, 'Stormcaller\'s Leggings', 501, 'Stormcaller\'s Garb'),
(7, 21376, 'Stormcaller\'s Pauldrons', 501, 'Stormcaller\'s Garb');

-- Insert Armor Sets for Warlock: Doomcaller's Attire Item Set 499
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 21337, 'Doomcaller\'s Circlet', 499, 'Doomcaller\'s Attire'),
(9, 21338, 'Doomcaller\'s Footwraps', 499, 'Doomcaller\'s Attire'),
(9, 21335, 'Doomcaller\'s Mantle', 499, 'Doomcaller\'s Attire'),
(9, 21334, 'Doomcaller\'s Robes', 499, 'Doomcaller\'s Attire'),
(9, 21336, 'Doomcaller\'s Trousers', 499, 'Doomcaller\'s Attire');

-- Insert Armor Sets for Warrior: Conqueror's Battlegear Item Set 496
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 21331, 'Conqueror\'s Breastplate', 496, 'Conqueror\'s Battlegear'),
(1, 21329, 'Conqueror\'s Crown', 496, 'Conqueror\'s Battlegear'),
(1, 21333, 'Conqueror\'s Greaves', 496, 'Conqueror\'s Battlegear'),
(1, 21332, 'Conqueror\'s Legguards', 496, 'Conqueror\'s Battlegear'),
(1, 21330, 'Conqueror\'s Spaulders', 496, 'Conqueror\'s Battlegear');




-- [[ Tier 3 Armor Sets ]]




-- Insert Armor Sets for Druid: Dreamwalker Raiment Item Set 521
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 22492, 'Dreamwalker Boots', 521, 'Dreamwalker Raiment'),
(11, 22494, 'Dreamwalker Girdle', 521, 'Dreamwalker Raiment'),
(11, 22493, 'Dreamwalker Handguards', 521, 'Dreamwalker Raiment'),
(11, 22490, 'Dreamwalker Headpiece', 521, 'Dreamwalker Raiment'),
(11, 22489, 'Dreamwalker Legguards', 521, 'Dreamwalker Raiment'),
(11, 22491, 'Dreamwalker Spaulders', 521, 'Dreamwalker Raiment'),
(11, 22488, 'Dreamwalker Tunic', 521, 'Dreamwalker Raiment'),
(11, 22495, 'Dreamwalker Bindings', 521, 'Dreamwalker Raiment'),
(11, 23064, 'Ring of the Dreamwalker', 521, 'Dreamwalker Raiment');

-- Insert Armor Sets for Hunter: Cryptstalker Armor Item Set 530
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 22440, 'Cryptstalker Boots', 530, 'Cryptstalker Armor'),
(3, 22442, 'Cryptstalker Girdle', 530, 'Cryptstalker Armor'),
(3, 22441, 'Cryptstalker Handguards', 530, 'Cryptstalker Armor'),
(3, 22438, 'Cryptstalker Headpiece', 530, 'Cryptstalker Armor'),
(3, 22437, 'Cryptstalker Legguards', 530, 'Cryptstalker Armor'),
(3, 22439, 'Cryptstalker Spaulders', 530, 'Cryptstalker Armor'),
(3, 22436, 'Cryptstalker Tunic', 530, 'Cryptstalker Armor'),
(3, 22443, 'Cryptstalker Wristguards', 530, 'Cryptstalker Armor'),
(3, 23067, 'Ring of the Cryptstalker', 530, 'Cryptstalker Armor');

-- Insert Armor Sets for Mage: Frostfire Regalia Item Set 526
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 22502, 'Frostfire Belt', 526, 'Frostfire Regalia'),
(8, 22503, 'Frostfire Bindings', 526, 'Frostfire Regalia'),
(8, 22498, 'Frostfire Circlet', 526, 'Frostfire Regalia'),
(8, 22501, 'Frostfire Gloves', 526, 'Frostfire Regalia'),
(8, 22497, 'Frostfire Leggings', 526, 'Frostfire Regalia'),
(8, 22496, 'Frostfire Robe', 526, 'Frostfire Regalia'),
(8, 22500, 'Frostfire Sandals', 526, 'Frostfire Regalia'),
(8, 22499, 'Frostfire Shoulderpads', 526, 'Frostfire Regalia'),
(8, 23062, 'Frostfire Ring', 526, 'Frostfire Regalia');

-- Insert Armor Sets for Paladin: Redemption Armor Item Set 528
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 22430, 'Redemption Boots', 528, 'Redemption Armor'),
(2, 22431, 'Redemption Girdle', 528, 'Redemption Armor'),
(2, 22426, 'Redemption Handguards', 528, 'Redemption Armor'),
(2, 22428, 'Redemption Headpiece', 528, 'Redemption Armor'),
(2, 22427, 'Redemption Legguards', 528, 'Redemption Armor'),
(2, 22429, 'Redemption Spaulders', 528, 'Redemption Armor'),
(2, 22425, 'Redemption Tunic', 528, 'Redemption Armor'),
(2, 22424, 'Redemption Wristguards', 528, 'Redemption Armor'),
(2, 23066, 'Ring of Redemption', 528, 'Redemption Armor');

-- Insert Armor Sets for Priest: Vestments of Faith Item Set 525
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 22518, 'Belt of Faith', 525, 'Vestments of Faith'),
(5, 22519, 'Bindings of Faith', 525, 'Vestments of Faith'),
(5, 22514, 'Circlet of Faith', 525, 'Vestments of Faith'),
(5, 22517, 'Gloves of Faith', 525, 'Vestments of Faith'),
(5, 22513, 'Leggings of Faith', 525, 'Vestments of Faith'),
(5, 22512, 'Robe of Faith', 525, 'Vestments of Faith'),
(5, 22516, 'Sandals of Faith', 525, 'Vestments of Faith'),
(5, 22515, 'Shoulderpads of Faith', 525, 'Vestments of Faith'),
(5, 23061, 'Ring of Faith', 525, 'Vestments of Faith');

-- Insert Armor Sets for Rogue: Bonescythe Armor Item Set 524
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 22483, 'Bonescythe Bracers', 524, 'Bonescythe Armor'),
(4, 22476, 'Bonescythe Breastplate', 524, 'Bonescythe Armor'),
(4, 22481, 'Bonescythe Gauntlets', 524, 'Bonescythe Armor'),
(4, 22478, 'Bonescythe Helmet', 524, 'Bonescythe Armor'),
(4, 22477, 'Bonescythe Legplates', 524, 'Bonescythe Armor'),
(4, 22479, 'Bonescythe Pauldrons', 524, 'Bonescythe Armor'),
(4, 22480, 'Bonescythe Sabatons', 524, 'Bonescythe Armor'),
(4, 22482, 'Bonescythe Waistguard', 524, 'Bonescythe Armor'),
(4, 23060, 'Bonescythe Ring', 524, 'Bonescythe Armor');

-- Insert Armor Sets for Shaman: The Earthshatterer Item Set 527
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 22468, 'Earthshatter Boots', 527, 'The Earthshatterer'),
(7, 22470, 'Earthshatter Girdle', 527, 'The Earthshatterer'),
(7, 22469, 'Earthshatter Handguards', 527, 'The Earthshatterer'),
(7, 22466, 'Earthshatter Headpiece', 527, 'The Earthshatterer'),
(7, 22465, 'Earthshatter Legguards', 527, 'The Earthshatterer'),
(7, 22467, 'Earthshatter Spaulders', 527, 'The Earthshatterer'),
(7, 22464, 'Earthshatter Tunic', 527, 'The Earthshatterer'),
(7, 22471, 'Earthshatter Wristguards', 527, 'The Earthshatterer'),
(7, 23065, 'Ring of the Earthshatterer', 527, 'The Earthshatterer');

-- Insert Armor Sets for Warlock: Plagueheart Raiment Item Set 529
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 22510, 'Plagueheart Belt', 529, 'Plagueheart Raiment'),
(9, 22511, 'Plagueheart Bindings', 529, 'Plagueheart Raiment'),
(9, 22506, 'Plagueheart Circlet', 529, 'Plagueheart Raiment'),
(9, 22509, 'Plagueheart Gloves', 529, 'Plagueheart Raiment'),
(9, 22505, 'Plagueheart Leggings', 529, 'Plagueheart Raiment'),
(9, 22504, 'Plagueheart Robe', 529, 'Plagueheart Raiment'),
(9, 22508, 'Plagueheart Sandals', 529, 'Plagueheart Raiment'),
(9, 22507, 'Plagueheart Shoulderpads', 529, 'Plagueheart Raiment'),
(9, 23063, 'Plagueheart Ring', 529, 'Plagueheart Raiment');

-- Insert Armor Sets for Warrior: Dreadnaught's Battlegear Item Set 523
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 22423, 'Dreadnaught Bracers', 523, 'Dreadnaught Battlegear'),
(1, 22416, 'Dreadnaught Breastplate', 523, 'Dreadnaught Battlegear'),
(1, 22421, 'Dreadnaught Gauntlets', 523, 'Dreadnaught Battlegear'),
(1, 22422, 'Dreadnaught Waistguard', 523, 'Dreadnaught Battlegear'),
(1, 22418, 'Dreadnaught Helmet', 523, 'Dreadnaught Battlegear'),
(1, 22417, 'Dreadnaught Legplates', 523, 'Dreadnaught Battlegear'),
(1, 22419, 'Dreadnaught Pauldrons', 523, 'Dreadnaught Battlegear'),
(1, 22420, 'Dreadnaught Sabatons', 523, 'Dreadnaught Battlegear'),
(1, 23059, 'Ring of the Dreadnaught', 523, 'Dreadnaught Battlegear');




-- [[ Battlegear ]]



-- Insert Armor Sets for Druid: Wyrmhide Battlegear Item Set 743
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 35371, 'Wyrmhide Gloves', 743, 'Wyrmhide Battlegear'),
(11, 35372, 'Wyrmhide Helm', 743, 'Wyrmhide Battlegear'),
(11, 35373, 'Wyrmhide Legguards', 743, 'Wyrmhide Battlegear'),
(11, 35375, 'Wyrmhide Robe', 743, 'Wyrmhide Battlegear'),
(11, 35374, 'Wyrmhide Spaulders', 743, 'Wyrmhide Battlegear');

-- Insert Armor Sets for Druid: Dragonhide Battlegear Item Set 742
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 35356, 'Dragonhide Gloves', 742, 'Dragonhide Battlegear'),
(11, 35357, 'Dragonhide Helm', 742, 'Dragonhide Battlegear'),
(11, 35358, 'Dragonhide Legguards', 742, 'Dragonhide Battlegear'),
(11, 35360, 'Dragonhide Robe', 742, 'Dragonhide Battlegear'),
(11, 35359, 'Dragonhide Spaulders', 742, 'Dragonhide Battlegear');

-- Insert Armor Sets for Druid: Kodohide Battlegear Item Set 744
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 35361, 'Kodohide Gloves', 744, 'Kodohide Battlegear'),
(11, 35362, 'Kodohide Helm', 744, 'Kodohide Battlegear'),
(11, 35363, 'Kodohide Legguards', 744, 'Kodohide Battlegear'),
(11, 35365, 'Kodohide Robe', 744, 'Kodohide Battlegear'),
(11, 35364, 'Kodohide Spaulders', 744, 'Kodohide Battlegear');

-- Insert Armor Sets for Hunter: Stalker's Chain Battlegear Item Set 749
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 35376, 'Stalker\'s Chain Armor', 749, 'Stalker\'s Chain Battlegear'),
(3, 35377, 'Stalker\'s Chain Gauntlets', 749, 'Stalker\'s Chain Battlegear'),
(3, 35378, 'Stalker\'s Chain Helm', 749, 'Stalker\'s Chain Battlegear'),
(3, 35379, 'Stalker\'s Chain Leggings', 749, 'Stalker\'s Chain Battlegear'),
(3, 35380, 'Stalker\'s Chain Spaulders', 749, 'Stalker\'s Chain Battlegear');

-- Insert Armor Sets for Mage: Evoker's Silk Battlegear Item Set 741
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 35343, 'Evoker\'s Silk Amice', 741, 'Evoker\'s Silk Battlegear'),
(8, 35344, 'Evoker\'s Silk Cowl', 741, 'Evoker\'s Silk Battlegear'),
(8, 35345, 'Evoker\'s Silk Handguards', 741, 'Evoker\'s Silk Battlegear'),
(8, 35346, 'Evoker\'s Silk Raiment', 741, 'Evoker\'s Silk Battlegear'),
(8, 35347, 'Evoker\'s Silk Trousers', 741, 'Evoker\'s Silk Battlegear');

-- Insert Armor Sets for Paladin: Crusader's Ornamented Battlegear Item Set 751
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 35402, 'Crusader\'s Ornamented Chestplate', 751, 'Crusader\'s Ornamented Battlegear'),
(2, 35403, 'Crusader\'s Ornamented Gloves', 751, 'Crusader\'s Ornamented Battlegear'),
(2, 35404, 'Crusader\'s Ornamented Headguard', 751, 'Crusader\'s Ornamented Battlegear'),
(2, 35405, 'Crusader\'s Ornamented Leggings', 751, 'Crusader\'s Ornamented Battlegear'),
(2, 35406, 'Crusader\'s Ornamented Spaulders', 751, 'Crusader\'s Ornamented Battlegear');

-- Insert Armor Sets for Paladin: Crusader's Scaled Battlegear Item Set 752
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 35412, 'Crusader\'s Scaled Chestpiece', 752, 'Crusader\'s Scaled Battlegear'),
(2, 35413, 'Crusader\'s Scaled Gauntlets', 752, 'Crusader\'s Scaled Battlegear'),
(2, 35414, 'Crusader\'s Scaled Helm', 752, 'Crusader\'s Scaled Battlegear'),
(2, 35415, 'Crusader\'s Scaled Legguards', 752, 'Crusader\'s Scaled Battlegear'),
(2, 35416, 'Crusader\'s Scaled Shoulders', 752, 'Crusader\'s Scaled Battlegear');

-- Insert Armor Sets for Priest: Mooncloth Battlegear Item Set 739
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 35333, 'Mooncloth Cowl', 739, 'Mooncloth Battlegear'),
(5, 35334, 'Mooncloth Legguards', 739, 'Mooncloth Battlegear'),
(5, 35335, 'Mooncloth Mitts', 739, 'Mooncloth Battlegear'),
(5, 35336, 'Mooncloth Shoulderpads', 739, 'Mooncloth Battlegear'),
(5, 35337, 'Mooncloth Vestments', 739, 'Mooncloth Battlegear');

-- Insert Armor Sets for Priest: Satin Battlegear Item Set 740
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 35338, 'Satin Gloves', 740, 'Satin Battlegear'),
(5, 35339, 'Satin Hood', 740, 'Satin Battlegear'),
(5, 35340, 'Satin Leggings', 740, 'Satin Battlegear'),
(5, 35341, 'Satin Mantle', 740, 'Satin Battlegear'),
(5, 35342, 'Satin Robe', 740, 'Satin Battlegear');

-- Insert Armor Sets for Rogue: Opportunist's Battlegear Item Set 745
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 35366, 'Opportunist\'s Leather Gloves', 745, 'Opportunist\'s Battlegear'),
(4, 35367, 'Opportunist\'s Leather Helm', 745, 'Opportunist\'s Battlegear'),
(4, 35368, 'Opportunist\'s Leather Legguards', 745, 'Opportunist\'s Battlegear'),
(4, 35369, 'Opportunist\'s Leather Spaulders', 745, 'Opportunist\'s Battlegear'),
(4, 35370, 'Opportunist\'s Leather Tunic', 745, 'Opportunist\'s Battlegear');

-- Insert Armor Sets for Shaman: Seer's Mail Battlegear Item Set 746
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 35386, 'Seer\'s Mail Armor', 746, 'Seer\'s Mail Battlegear'),
(7, 35387, 'Seer\'s Mail Gauntlets', 746, 'Seer\'s Mail Battlegear'),
(7, 35388, 'Seer\'s Mail Helm', 746, 'Seer\'s Mail Battlegear'),
(7, 35389, 'Seer\'s Mail Leggings', 746, 'Seer\'s Mail Battlegear'),
(7, 35390, 'Seer\'s Mail Spaulders', 746, 'Seer\'s Mail Battlegear');

-- Insert Armor Sets for Shaman: Seer's Linked Battlegear Item Set 748
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 35381, 'Seer\'s Linked Armor', 748, 'Seer\'s Linked Battlegear'),
(7, 35382, 'Seer\'s Linked Gauntlets', 748, 'Seer\'s Linked Battlegear'),
(7, 35383, 'Seer\'s Linked Helm', 748, 'Seer\'s Linked Battlegear'),
(7, 35384, 'Seer\'s Linked Leggings', 748, 'Seer\'s Linked Battlegear'),
(7, 35385, 'Seer\'s Linked Spaulders', 748, 'Seer\'s Linked Battlegear');

-- Insert Armor Sets for Shaman: Seer's Ringmail Battlegear Item Set 747
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 35391, 'Seer\'s Ringmail Chestguard', 747, 'Seer\'s Ringmail Battlegear'),
(7, 35392, 'Seer\'s Ringmail Gloves', 747, 'Seer\'s Ringmail Battlegear'),
(7, 35393, 'Seer\'s Ringmail Headpiece', 747, 'Seer\'s Ringmail Battlegear'),
(7, 35394, 'Seer\'s Ringmail Legguards', 747, 'Seer\'s Ringmail Battlegear'),
(7, 35395, 'Seer\'s Ringmail Shoulderpads', 747, 'Seer\'s Ringmail Battlegear');

-- Insert Armor Sets for Warlock: Dreadweave Battlegear Item Set 738
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 35328, 'Dreadweave Gloves', 738, 'Dreadweave Battlegear'),
(9, 35329, 'Dreadweave Hood', 738, 'Dreadweave Battlegear'),
(9, 35330, 'Dreadweave Leggings', 738, 'Dreadweave Battlegear'),
(9, 35331, 'Dreadweave Mantle', 738, 'Dreadweave Battlegear'),
(9, 35332, 'Dreadweave Robe', 738, 'Dreadweave Battlegear');

-- Insert Armor Sets for Warrior: Savage Plate Battlegear Item Set 750
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 35407, 'Savage Plate Chestpiece', 750, 'Savage Plate Battlegear'),
(1, 35408, 'Savage Plate Gauntlets', 750, 'Savage Plate Battlegear'),
(1, 35409, 'Savage Plate Helm', 750, 'Savage Plate Battlegear'),
(1, 35410, 'Savage Plate Legguards', 750, 'Savage Plate Battlegear'),
(1, 35411, 'Savage Plate Shoulders', 750, 'Savage Plate Battlegear');




-- [[ Season 1 Gear ]]




-- Insert Armor Sets for Druid: Gladiator's Sanctuary (Feral) Item Set 584
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 28126, 'Gladiator\'s Dragonhide Gloves', 584, 'Gladiator\'s Sanctuary'),
(11, 28127, 'Gladiator\'s Dragonhide Helm', 584, 'Gladiator\'s Sanctuary'),
(11, 28128, 'Gladiator\'s Dragonhide Legguards', 584, 'Gladiator\'s Sanctuary'),
(11, 28129, 'Gladiator\'s Dragonhide Spaulders', 584, 'Gladiator\'s Sanctuary'),
(11, 28130, 'Gladiator\'s Dragonhide Tunic', 584, 'Gladiator\'s Sanctuary');

-- Insert Armor Sets for Druid: Gladiator's Wildhide (Balance) Item Set 585
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 28136, 'Gladiator\'s Wyrmhide Gloves', 585, 'Gladiator\'s Wildhide'),
(11, 28137, 'Gladiator\'s Wyrmhide Helm', 585, 'Gladiator\'s Wildhide'),
(11, 28138, 'Gladiator\'s Wyrmhide Legguards', 585, 'Gladiator\'s Wildhide'),
(11, 28139, 'Gladiator\'s Wyrmhide Spaulders', 585, 'Gladiator\'s Wildhide'),
(11, 28140, 'Gladiator\'s Wyrmhide Tunic', 585, 'Gladiator\'s Wildhide');

-- Insert Armor Sets for Druid: Gladiator's Refuge (Restoration) Item Set 685
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 31375, 'Gladiator\'s Kodohide Gloves', 685, 'Gladiator\'s Refuge'),
(11, 31376, 'Gladiator\'s Kodohide Helm', 685, 'Gladiator\'s Refuge'),
(11, 31377, 'Gladiator\'s Kodohide Legguards', 685, 'Gladiator\'s Refuge'),
(11, 31378, 'Gladiator\'s Kodohide Spaulders', 685, 'Gladiator\'s Refuge'),
(11, 31379, 'Gladiator\'s Kodohide Tunic', 685, 'Gladiator\'s Refuge');

-- Insert Armor Sets for Hunter: Gladiator's Pursuit Item Set 586
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 28334, 'Gladiator\'s Chain Armor', 586, 'Gladiator\'s Pursuit'),
(3, 28335, 'Gladiator\'s Chain Gauntlets', 586, 'Gladiator\'s Pursuit'),
(3, 28331, 'Gladiator\'s Chain Helm', 586, 'Gladiator\'s Pursuit'),
(3, 28332, 'Gladiator\'s Chain Leggings', 586, 'Gladiator\'s Pursuit'),
(3, 28333, 'Gladiator\'s Chain Spaulders', 586, 'Gladiator\'s Pursuit');

-- Insert Armor Sets for Mage: Gladiator's Regalia Item Set 579
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 25854, 'Gladiator\'s Silk Amice', 579, 'Gladiator\'s Regalia'),
(8, 25855, 'Gladiator\'s Silk Cowl', 579, 'Gladiator\'s Regalia'),
(8, 25857, 'Gladiator\'s Silk Handguards', 579, 'Gladiator\'s Regalia'),
(8, 25856, 'Gladiator\'s Silk Raiment', 579, 'Gladiator\'s Regalia'),
(8, 25858, 'Gladiator\'s Silk Trousers', 579, 'Gladiator\'s Regalia');

-- Insert Armor Sets for Paladin: Gladiator's Aegis (Spell Damage) Item Set 582
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 27702, 'Gladiator\'s Scaled Chestpiece', 582, 'Gladiator\'s Aegis'),
(2, 27703, 'Gladiator\'s Scaled Gauntlets', 582, 'Gladiator\'s Aegis'),
(2, 27704, 'Gladiator\'s Scaled Helm', 582, 'Gladiator\'s Aegis'),
(2, 27705, 'Gladiator\'s Scaled Legguards', 582, 'Gladiator\'s Aegis'),
(2, 27706, 'Gladiator\'s Scaled Shoulders', 582, 'Gladiator\'s Aegis');

-- Insert Armor Sets for Paladin: Gladiator's Vindication (Retribution) Item Set 583
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 27879, 'Gladiator\'s Scaled Chestpiece', 583, 'Gladiator\'s Vindication'),
(2, 27880, 'Gladiator\'s Scaled Gauntlets', 583, 'Gladiator\'s Vindication'),
(2, 27881, 'Gladiator\'s Scaled Helm', 583, 'Gladiator\'s Vindication'),
(2, 27882, 'Gladiator\'s Scaled Legguards', 583, 'Gladiator\'s Vindication'),
(2, 27883, 'Gladiator\'s Scaled Shoulders', 583, 'Gladiator\'s Vindication');

-- Insert Armor Sets for Paladin: Gladiator's Redemption (Holy) Item Set 690
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 31613, 'Gladiator\'s Ornamented Chestguard', 690, 'Gladiator\'s Redemption'),
(2, 31614, 'Gladiator\'s Ornamented Gloves', 690, 'Gladiator\'s Redemption'),
(2, 31616, 'Gladiator\'s Ornamented Headcover', 690, 'Gladiator\'s Redemption'),
(2, 31618, 'Gladiator\'s Ornamented Leggings', 690, 'Gladiator\'s Redemption'),
(2, 31619, 'Gladiator\'s Ornamented Spaulders', 690, 'Gladiator\'s Redemption');

-- Insert Armor Sets for Priest: Gladiator's Raiment (Shadow) Item Set 581
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 27707, 'Gladiator\'s Satin Gloves', 581, 'Gladiator\'s Raiment'),
(5, 27708, 'Gladiator\'s Satin Hood', 581, 'Gladiator\'s Raiment'),
(5, 27709, 'Gladiator\'s Satin Leggings', 581, 'Gladiator\'s Raiment'),
(5, 27710, 'Gladiator\'s Satin Mantle', 581, 'Gladiator\'s Raiment'),
(5, 27711, 'Gladiator\'s Satin Robe', 581, 'Gladiator\'s Raiment');

-- Insert Armor Sets for Priest: Gladiator's Investiture (Holy) Item Set 687
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 31409, 'Gladiator\'s Mooncloth Gloves', 687, 'Gladiator\'s Investiture'),
(5, 31410, 'Gladiator\'s Mooncloth Hood', 687, 'Gladiator\'s Investiture'),
(5, 31411, 'Gladiator\'s Mooncloth Leggings', 687, 'Gladiator\'s Investiture'),
(5, 31412, 'Gladiator\'s Mooncloth Mantle', 687, 'Gladiator\'s Investiture'),
(5, 31413, 'Gladiator\'s Mooncloth Robe', 687, 'Gladiator\'s Investiture');

-- Insert Armor Sets for Rogue: Gladiator's Vestments Item Set 577
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 25834, 'Gladiator\'s Leather Gloves', 577, 'Gladiator\'s Vestments'),
(4, 25833, 'Gladiator\'s Leather Legguards', 577, 'Gladiator\'s Vestments'),
(4, 25830, 'Gladiator\'s Leather Helm', 577, 'Gladiator\'s Vestments'),
(4, 25832, 'Gladiator\'s Leather Spaulders', 577, 'Gladiator\'s Vestments'),
(4, 25831, 'Gladiator\'s Leather Tunic', 577, 'Gladiator\'s Vestments');

-- Insert Armor Sets for Shaman: Gladiator's Earthshaker (Enhancement) Item Set 578
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 25997, 'Gladiator\'s Linked Armor', 578, 'Gladiator\'s Earthshaker'),
(7, 26000, 'Gladiator\'s Linked Gauntlets', 578, 'Gladiator\'s Earthshaker'),
(7, 25998, 'Gladiator\'s Linked Helm', 578, 'Gladiator\'s Earthshaker'),
(7, 26001, 'Gladiator\'s Linked Leggings', 578, 'Gladiator\'s Earthshaker'),
(7, 25999, 'Gladiator\'s Linked Spaulders', 578, 'Gladiator\'s Earthshaker');

-- Insert Armor Sets for Shaman: Gladiator's Thunderfist (Elemental) Item Set 580
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 27469, 'Gladiator\'s Mail Armor', 580, 'Gladiator\'s Thunderfist'),
(7, 27470, 'Gladiator\'s Mail Gauntlets', 580, 'Gladiator\'s Thunderfist'),
(7, 27471, 'Gladiator\'s Mail Helm', 580, 'Gladiator\'s Thunderfist'),
(7, 27472, 'Gladiator\'s Mail Leggings', 580, 'Gladiator\'s Thunderfist'),
(7, 27473, 'Gladiator\'s Mail Spaulders', 580, 'Gladiator\'s Thunderfist');

-- Insert Armor Sets for Shaman: Gladiator's Wartide (Restoration) Item Set 686
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 31396, 'Gladiator\'s Ringmail Armor', 686, 'Gladiator\'s Wartide'),
(7, 31397, 'Gladiator\'s Ringmail Gauntlets', 686, 'Gladiator\'s Wartide'),
(7, 31400, 'Gladiator\'s Ringmail Helm', 686, 'Gladiator\'s Wartide'),
(7, 31406, 'Gladiator\'s Ringmail Leggings', 686, 'Gladiator\'s Wartide'),
(7, 31407, 'Gladiator\'s Ringmail Spaulders', 686, 'Gladiator\'s Wartide');

-- Insert Armor Sets for Warlock: Gladiator's Dreadgear (Affliction) Item Set 568
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 24556, 'Gladiator\'s Dreadweave Gloves', 568, 'Gladiator\'s Dreadgear'),
(9, 24553, 'Gladiator\'s Dreadweave Hood', 568, 'Gladiator\'s Dreadgear'),
(9, 24555, 'Gladiator\'s Dreadweave Leggings', 568, 'Gladiator\'s Dreadgear'),
(9, 24554, 'Gladiator\'s Dreadweave Mantle', 568, 'Gladiator\'s Dreadgear'),
(9, 24552, 'Gladiator\'s Dreadweave Robe', 568, 'Gladiator\'s Dreadgear');

-- Insert Armor Sets for Warlock: Gladiator's Felshroud (Destruction) Item Set 615
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 30186, 'Gladiator\'s Felweave Amice', 615, 'Gladiator\'s Felshroud'),
(9, 30187, 'Gladiator\'s Felweave Cowl', 615, 'Gladiator\'s Felshroud'),
(9, 30188, 'Gladiator\'s Felweave Handguards', 615, 'Gladiator\'s Felshroud'),
(9, 30200, 'Gladiator\'s Felweave Raiment', 615, 'Gladiator\'s Felshroud'),
(9, 30201, 'Gladiator\'s Felweave Trousers', 615, 'Gladiator\'s Felshroud');

-- Insert Armor Sets for Warrior: Gladiator's Battlegear Item Set 567
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 24544, 'Gladiator\'s Plate Chestpiece', 567, 'Gladiator\'s Battlegear'),
(1, 24549, 'Gladiator\'s Plate Gauntlets', 567, 'Gladiator\'s Battlegear'),
(1, 24545, 'Gladiator\'s Plate Helm', 567, 'Gladiator\'s Battlegear'),
(1, 24547, 'Gladiator\'s Plate Legguards', 567, 'Gladiator\'s Battlegear'),
(1, 24546, 'Gladiator\'s Plate Shoulders', 567, 'Gladiator\'s Battlegear');




-- [[ Season 2 Gear ]]



-- Insert Armor Sets for Druid: Merciless Gladiator's Sanctuary (Feral) Item Set 711
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 31967, 'Merciless Gladiator\'s Dragonhide Gloves', 711, 'Merciless Gladiator\'s Sanctuary'),
(11, 31968, 'Merciless Gladiator\'s Dragonhide Helm', 711, 'Merciless Gladiator\'s Sanctuary'),
(11, 31969, 'Merciless Gladiator\'s Dragonhide Legguards', 711, 'Merciless Gladiator\'s Sanctuary'),
(11, 31971, 'Merciless Gladiator\'s Dragonhide Spaulders', 711, 'Merciless Gladiator\'s Sanctuary'),
(11, 31972, 'Merciless Gladiator\'s Dragonhide Tunic', 711, 'Merciless Gladiator\'s Sanctuary');

-- Insert Armor Sets for Druid: Merciless Gladiator's Wildhide (Balance) Item Set 716
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 32056, 'Merciless Gladiator\'s Wyrmhide Gloves', 716, 'Merciless Gladiator\'s Wildhide'),
(11, 32057, 'Merciless Gladiator\'s Wyrmhide Helm', 716, 'Merciless Gladiator\'s Wildhide'),
(11, 32058, 'Merciless Gladiator\'s Wyrmhide Legguards', 716, 'Merciless Gladiator\'s Wildhide'),
(11, 32059, 'Merciless Gladiator\'s Wyrmhide Spaulders', 716, 'Merciless Gladiator\'s Wildhide'),
(11, 32060, 'Merciless Gladiator\'s Wyrmhide Tunic', 716, 'Merciless Gladiator\'s Wildhide');

-- Insert Armor Sets for Druid: Merciless Gladiator's Refuge (Restoration) Item Set 709
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 31987, 'Merciless Gladiator\'s Kodohide Gloves', 709, 'Merciless Gladiator\'s Refuge'),
(11, 31988, 'Merciless Gladiator\'s Kodohide Helm', 709, 'Merciless Gladiator\'s Refuge'),
(11, 31989, 'Merciless Gladiator\'s Kodohide Legguards', 709, 'Merciless Gladiator\'s Refuge'),
(11, 31990, 'Merciless Gladiator\'s Kodohide Spaulders', 709, 'Merciless Gladiator\'s Refuge'),
(11, 31991, 'Merciless Gladiator\'s Kodohide Tunic', 709, 'Merciless Gladiator\'s Refuge');

-- Insert Armor Sets for Hunter: Merciless Gladiator's Pursuit Item Set 706
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 31960, 'Merciless Gladiator\'s Chain Armor', 706, 'Merciless Gladiator\'s Pursuit'),
(3, 31961, 'Merciless Gladiator\'s Chain Gauntlets', 706, 'Merciless Gladiator\'s Pursuit'),
(3, 31962, 'Merciless Gladiator\'s Chain Helm', 706, 'Merciless Gladiator\'s Pursuit'),
(3, 31963, 'Merciless Gladiator\'s Chain Leggings', 706, 'Merciless Gladiator\'s Pursuit'),
(3, 31964, 'Merciless Gladiator\'s Chain Spaulders', 706, 'Merciless Gladiator\'s Pursuit');

-- Insert Armor Sets for Mage: Merciless Gladiator's Regalia Item Set 710
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 32047, 'Merciless Gladiator\'s Silk Amice', 710, 'Merciless Gladiator\'s Regalia'),
(8, 32048, 'Merciless Gladiator\'s Silk Cowl', 710, 'Merciless Gladiator\'s Regalia'),
(8, 32049, 'Merciless Gladiator\'s Silk Handguards', 710, 'Merciless Gladiator\'s Regalia'),
(8, 32050, 'Merciless Gladiator\'s Silk Raiment', 710, 'Merciless Gladiator\'s Regalia'),
(8, 32051, 'Merciless Gladiator\'s Silk Trousers', 710, 'Merciless Gladiator\'s Regalia');

-- Insert Armor Sets for Paladin: Merciless Gladiator's Aegis (Protection) Item Set 700
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 31992, 'Merciless Gladiator\'s Lamellar Chestpiece', 700, 'Merciless Gladiator\'s Aegis'),
(2, 31993, 'Merciless Gladiator\'s Lamellar Gauntlets', 700, 'Merciless Gladiator\'s Aegis'),
(2, 31997, 'Merciless Gladiator\'s Lamellar Helm', 700, 'Merciless Gladiator\'s Aegis'),
(2, 31995, 'Merciless Gladiator\'s Lamellar Legguards', 700, 'Merciless Gladiator\'s Aegis'),
(2, 31996, 'Merciless Gladiator\'s Lamellar Shoulders', 700, 'Merciless Gladiator\'s Aegis');

-- Insert Armor Sets for Paladin: Merciless Gladiator's Vindication (Retribution) Item Set 714
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 32039, 'Merciless Gladiator\'s Scaled Chestpiece', 714, 'Merciless Gladiator\'s Vindication'),
(2, 32040, 'Merciless Gladiator\'s Scaled Gauntlets', 714, 'Merciless Gladiator\'s Vindication'),
(2, 32041, 'Merciless Gladiator\'s Scaled Helm', 714, 'Merciless Gladiator\'s Vindication'),
(2, 32042, 'Merciless Gladiator\'s Scaled Legguards', 714, 'Merciless Gladiator\'s Vindication'),
(2, 32043, 'Merciless Gladiator\'s Scaled Shoulders', 714, 'Merciless Gladiator\'s Vindication');

-- Insert Armor Sets for Paladin: Merciless Gladiator's Redemption (Holy) Item Set 708
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 32020, 'Merciless Gladiator\'s Ornamented Chestguard', 708, 'Merciless Gladiator\'s Redemption'),
(2, 32021, 'Merciless Gladiator\'s Ornamented Gloves', 708, 'Merciless Gladiator\'s Redemption'),
(2, 32022, 'Merciless Gladiator\'s Ornamented Headcover', 708, 'Merciless Gladiator\'s Redemption'),
(2, 32023, 'Merciless Gladiator\'s Ornamented Leggings', 708, 'Merciless Gladiator\'s Redemption'),
(2, 32024, 'Merciless Gladiator\'s Ornamented Spaulders', 708, 'Merciless Gladiator\'s Redemption');

-- Insert Armor Sets for Priest: Merciless Gladiator's Raiment (Shadow) Item Set 707
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 32034, 'Merciless Gladiator\'s Satin Gloves', 707, 'Merciless Gladiator\'s Raiment'),
(5, 32035, 'Merciless Gladiator\'s Satin Hood', 707, 'Merciless Gladiator\'s Raiment'),
(5, 32036, 'Merciless Gladiator\'s Satin Leggings', 707, 'Merciless Gladiator\'s Raiment'),
(5, 32037, 'Merciless Gladiator\'s Satin Mantle', 707, 'Merciless Gladiator\'s Raiment'),
(5, 32038, 'Merciless Gladiator\'s Satin Robe', 707, 'Merciless Gladiator\'s Raiment');

-- Insert Armor Sets for Priest: Merciless Gladiator's Investiture (Holy) Item Set 705
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 32015, 'Merciless Gladiator\'s Mooncloth Gloves', 705, 'Merciless Gladiator\'s Investiture'),
(5, 32016, 'Merciless Gladiator\'s Mooncloth Hood', 705, 'Merciless Gladiator\'s Investiture'),
(5, 32017, 'Merciless Gladiator\'s Mooncloth Leggings', 705, 'Merciless Gladiator\'s Investiture'),
(5, 32018, 'Merciless Gladiator\'s Mooncloth Mantle', 705, 'Merciless Gladiator\'s Investiture'),
(5, 32019, 'Merciless Gladiator\'s Mooncloth Robe', 705, 'Merciless Gladiator\'s Investiture');

-- Insert Armor Sets for Rogue: Merciless Gladiator's Vestments Item set 713
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 31998, 'Merciless Gladiator\'s Leather Gloves', 713, 'Merciless Gladiator\'s Vestments'),
(4, 32000, 'Merciless Gladiator\'s Leather Legguards', 713, 'Merciless Gladiator\'s Vestments'),
(4, 31999, 'Merciless Gladiator\'s Leather Helm', 713, 'Merciless Gladiator\'s Vestments'),
(4, 32001, 'Merciless Gladiator\'s Leather Spaulders', 713, 'Merciless Gladiator\'s Vestments'),
(4, 32002, 'Merciless Gladiator\'s Leather Tunic', 713, 'Merciless Gladiator\'s Vestments');

-- Insert Armor Sets for Shaman: Merciless Gladiator's Earthshaker (Enhancement) Item Set 703
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 32004, 'Merciless Gladiator\'s Linked Armor', 703, 'Merciless Gladiator\'s Earthshaker'),
(7, 32005, 'Merciless Gladiator\'s Linked Gauntlets', 703, 'Merciless Gladiator\'s Earthshaker'),
(7, 32006, 'Merciless Gladiator\'s Linked Helm', 703, 'Merciless Gladiator\'s Earthshaker'),
(7, 32007, 'Merciless Gladiator\'s Linked Leggings', 703, 'Merciless Gladiator\'s Earthshaker'),
(7, 32008, 'Merciless Gladiator\'s Linked Spaulders', 703, 'Merciless Gladiator\'s Earthshaker');

-- Insert Armor Sets for Shaman: Merciless Gladiator's Thunderfist (Elemental) Item Set 712
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 32009, 'Merciless Gladiator\'s Mail Armor', 712, 'Merciless Gladiator\'s Thunderfist'),
(7, 32010, 'Merciless Gladiator\'s Mail Gauntlets', 712, 'Merciless Gladiator\'s Thunderfist'),
(7, 32011, 'Merciless Gladiator\'s Mail Helm', 712, 'Merciless Gladiator\'s Thunderfist'),
(7, 32012, 'Merciless Gladiator\'s Mail Leggings', 712, 'Merciless Gladiator\'s Thunderfist'),
(7, 32013, 'Merciless Gladiator\'s Mail Spaulders', 712, 'Merciless Gladiator\'s Thunderfist');

-- Insert Armor Sets for Shaman: Merciless Gladiator's Wartide (Restoration) Item Set 715
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 32029, 'Merciless Gladiator\'s Ringmail Armor', 715, 'Merciless Gladiator\'s Wartide'),
(7, 32030, 'Merciless Gladiator\'s Ringmail Gauntlets', 715, 'Merciless Gladiator\'s Wartide'),
(7, 32031, 'Merciless Gladiator\'s Ringmail Helm', 715, 'Merciless Gladiator\'s Wartide'),
(7, 32032, 'Merciless Gladiator\'s Ringmail Leggings', 715, 'Merciless Gladiator\'s Wartide'),
(7, 32033, 'Merciless Gladiator\'s Ringmail Spaulders', 715, 'Merciless Gladiator\'s Wartide');

-- Insert Armor Sets for Warlock: Merciless Gladiator's Dreadgear (Affliction) Item Set 702
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 31973, 'Merciless Gladiator\'s Dreadweave Gloves', 702, 'Merciless Gladiator\'s Dreadgear'),
(9, 31974, 'Merciless Gladiator\'s Dreadweave Hood', 702, 'Merciless Gladiator\'s Dreadgear'),
(9, 31975, 'Merciless Gladiator\'s Dreadweave Leggings', 702, 'Merciless Gladiator\'s Dreadgear'),
(9, 31976, 'Merciless Gladiator\'s Dreadweave Mantle', 702, 'Merciless Gladiator\'s Dreadgear'),
(9, 31977, 'Merciless Gladiator\'s Dreadweave Robe', 702, 'Merciless Gladiator\'s Dreadgear');

-- Insert Armor Sets for Warlock: Merciless Gladiator's Felshroud (Destruction) Item Set 704
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 31979, 'Merciless Gladiator\'s Felweave Amice', 704, 'Merciless Gladiator\'s Felshroud'),
(9, 31980, 'Merciless Gladiator\'s Felweave Cowl', 704, 'Merciless Gladiator\'s Felshroud'),
(9, 31981, 'Merciless Gladiator\'s Felweave Handguards', 704, 'Merciless Gladiator\'s Felshroud'),
(9, 31982, 'Merciless Gladiator\'s Felweave Raiment', 704, 'Merciless Gladiator\'s Felshroud'),
(9, 31983, 'Merciless Gladiator\'s Felweave Trousers', 704, 'Merciless Gladiator\'s Felshroud');

-- Insert Armor Sets for Warrior: Merciless Gladiator's Battlegear Item Set 701
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 30486, 'Merciless Gladiator\'s Plate Chestpiece', 701, 'Merciless Gladiator\'s Battlegear'),
(1, 30487, 'Merciless Gladiator\'s Plate Gauntlets', 701, 'Merciless Gladiator\'s Battlegear'),
(1, 30488, 'Merciless Gladiator\'s Plate Helm', 701, 'Merciless Gladiator\'s Battlegear'),
(1, 30489, 'Merciless Gladiator\'s Plate Legguards', 701, 'Merciless Gladiator\'s Battlegear'),
(1, 30490, 'Merciless Gladiator\'s Plate Shoulders', 701, 'Merciless Gladiator\'s Battlegear');




-- [[ Season 3 Gear ]]




-- Insert Armor Sets for Druid: Vengeful Gladiator's Sanctuary (Feral) Item Set 721
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 33671, 'Vengeful Gladiator\'s Dragonhide Gloves', 721, 'Vengeful Gladiator\'s Sanctuary'),
(11, 33672, 'Vengeful Gladiator\'s Dragonhide Helm', 721, 'Vengeful Gladiator\'s Sanctuary'),
(11, 33673, 'Vengeful Gladiator\'s Dragonhide Legguards', 721, 'Vengeful Gladiator\'s Sanctuary'),
(11, 33674, 'Vengeful Gladiator\'s Dragonhide Spaulders', 721, 'Vengeful Gladiator\'s Sanctuary'),
(11, 33675, 'Vengeful Gladiator\'s Dragonhide Tunic', 721, 'Vengeful Gladiator\'s Sanctuary');

-- Insert Armor Sets for Druid: Vengeful Gladiator's Wildhide (Balance) Item Set 722
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 33767, 'Vengeful Gladiator\'s Wyrmhide Gloves', 722, 'Vengeful Gladiator\'s Wildhide'),
(11, 33768, 'Vengeful Gladiator\'s Wyrmhide Helm', 722, 'Vengeful Gladiator\'s Wildhide'),
(11, 33669, 'Vengeful Gladiator\'s Wyrmhide Legguards', 722, 'Vengeful Gladiator\'s Wildhide'),
(11, 33670, 'Vengeful Gladiator\'s Wyrmhide Spaulders', 722, 'Vengeful Gladiator\'s Wildhide'),
(11, 33771, 'Vengeful Gladiator\'s Wyrmhide Tunic', 722, 'Vengeful Gladiator\'s Wildhide');

-- Insert Armor Sets for Druid: Vengeful Gladiator's Refuge (Restoration) Item Set 720
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 33690, 'Vengeful Gladiator\'s Kodohide Gloves', 720, 'Vengeful Gladiator\'s Refuge'),
(11, 33691, 'Vengeful Gladiator\'s Kodohide Helm', 720, 'Vengeful Gladiator\'s Refuge'),
(11, 33692, 'Vengeful Gladiator\'s Kodohide Legguards', 720, 'Vengeful Gladiator\'s Refuge'),
(11, 33693, 'Vengeful Gladiator\'s Kodohide Spaulders', 720, 'Vengeful Gladiator\'s Refuge'),
(11, 33694, 'Vengeful Gladiator\'s Kodohide Tunic', 720, 'Vengeful Gladiator\'s Refuge');

-- Insert Armor Sets for Hunter: Vengeful Gladiator's Pursuit Item Set 723
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 33664, 'Vengeful Gladiator\'s Chain Armor', 723, 'Vengeful Gladiator\'s Pursuit'),
(3, 33665, 'Vengeful Gladiator\'s Chain Gauntlets', 723, 'Vengeful Gladiator\'s Pursuit'),
(3, 33666, 'Vengeful Gladiator\'s Chain Helm', 723, 'Vengeful Gladiator\'s Pursuit'),
(3, 33667, 'Vengeful Gladiator\'s Chain Leggings', 723, 'Vengeful Gladiator\'s Pursuit'),
(3, 33668, 'Vengeful Gladiator\'s Chain Spaulders', 723, 'Vengeful Gladiator\'s Pursuit');

-- Insert Armor Sets for Mage: Vengeful Gladiator's Regalia Item Set 724
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 33757, 'Vengeful Gladiator\'s Silk Amice', 724, 'Vengeful Gladiator\'s Regalia'),
(8, 33758, 'Vengeful Gladiator\'s Silk Cowl', 724, 'Vengeful Gladiator\'s Regalia'),
(8, 33759, 'Vengeful Gladiator\'s Silk Handguards', 724, 'Vengeful Gladiator\'s Regalia'),
(8, 33760, 'Vengeful Gladiator\'s Silk Raiment', 724, 'Vengeful Gladiator\'s Regalia'),
(8, 33761, 'Vengeful Gladiator\'s Silk Trousers', 724, 'Vengeful Gladiator\'s Regalia');

-- Insert Armor Sets for Paladin: Vengeful Gladiator's Aegis (Spell Damage) Item Set 727
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 33695, 'Vengeful Gladiator\'s Lamellar Chestpiece', 727, 'Vengeful Gladiator\'s Aegis'),
(2, 33696, 'Vengeful Gladiator\'s Lamellar Gauntlets', 727, 'Vengeful Gladiator\'s Aegis'),
(2, 33697, 'Vengeful Gladiator\'s Lamellar Helm', 727, 'Vengeful Gladiator\'s Aegis'),
(2, 33698, 'Vengeful Gladiator\'s Lamellar Legguards', 727, 'Vengeful Gladiator\'s Aegis'),
(2, 33699, 'Vengeful Gladiator\'s Lamellar Spaulders', 727, 'Vengeful Gladiator\'s Aegis');

-- Insert Armor Sets for Paladin: Vengeful Gladiator's Vindication (Retribution) Item Set 726
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 33749, 'Vengeful Gladiator\'s Scaled Chestpiece', 726, 'Vengeful Gladiator\'s Vindication'),
(2, 33750, 'Vengeful Gladiator\'s Scaled Gauntlets', 726, 'Vengeful Gladiator\'s Vindication'),
(2, 33751, 'Vengeful Gladiator\'s Scaled Helm', 726, 'Vengeful Gladiator\'s Vindication'),
(2, 33752, 'Vengeful Gladiator\'s Scaled Legguards', 726, 'Vengeful Gladiator\'s Vindication'),
(2, 33753, 'Vengeful Gladiator\'s Scaled Spaulders', 726, 'Vengeful Gladiator\'s Vindication');

-- Insert Armor Sets for Paladin: Vengeful Gladiator's Redemption (Holy) Item Set 725
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 33722, 'Vengeful Gladiator\'s Ornamented Chestguard', 725, 'Vengeful Gladiator\'s Redemption'),
(2, 33723, 'Vengeful Gladiator\'s Ornamented Gloves', 725, 'Vengeful Gladiator\'s Redemption'),
(2, 33724, 'Vengeful Gladiator\'s Ornamented Headcover', 725, 'Vengeful Gladiator\'s Redemption'),
(2, 33725, 'Vengeful Gladiator\'s Ornamented Leggings', 725, 'Vengeful Gladiator\'s Redemption'),
(2, 33726, 'Vengeful Gladiator\'s Ornamented Spaulders', 725, 'Vengeful Gladiator\'s Redemption');

-- Insert Armor Sets for Priest: Vengeful Gladiator's Raiment (Shadow) Item Set 729
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 33744, 'Vengeful Gladiator\'s Satin Gloves', 729, 'Vengeful Gladiator\'s Raiment'),
(5, 33745, 'Vengeful Gladiator\'s Satin Hood', 729, 'Vengeful Gladiator\'s Raiment'),
(5, 33746, 'Vengeful Gladiator\'s Satin Leggings', 729, 'Vengeful Gladiator\'s Raiment'),
(5, 33747, 'Vengeful Gladiator\'s Satin Mantle', 729, 'Vengeful Gladiator\'s Raiment'),
(5, 33748, 'Vengeful Gladiator\'s Satin Robe', 729, 'Vengeful Gladiator\'s Raiment');

-- Insert Armor Sets for Priest: Vengeful Gladiator's Investiture (Holy) Item Set 728
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 33717, 'Vengeful Gladiator\'s Mooncloth Gloves', 728, 'Vengeful Gladiator\'s Investiture'),
(5, 33718, 'Vengeful Gladiator\'s Mooncloth Hood', 728, 'Vengeful Gladiator\'s Investiture'),
(5, 33719, 'Vengeful Gladiator\'s Mooncloth Leggings', 728, 'Vengeful Gladiator\'s Investiture'),
(5, 33720, 'Vengeful Gladiator\'s Mooncloth Mantle', 728, 'Vengeful Gladiator\'s Investiture'),
(5, 33721, 'Vengeful Gladiator\'s Mooncloth Robe', 728, 'Vengeful Gladiator\'s Investiture');

-- Insert Armor Sets for Rogue: Vengeful Gladiator's Vestments Item Set 730
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 33700, 'Vengeful Gladiator\'s Leather Gloves', 730, 'Vengeful Gladiator\'s Vestments'),
(4, 33702, 'Vengeful Gladiator\'s Leather Legguards', 730, 'Vengeful Gladiator\'s Vestments'),
(4, 33701, 'Vengeful Gladiator\'s Leather Helm', 730, 'Vengeful Gladiator\'s Vestments'),
(4, 33703, 'Vengeful Gladiator\'s Leather Spaulders', 730, 'Vengeful Gladiator\'s Vestments'),
(4, 33704, 'Vengeful Gladiator\'s Leather Tunic', 730, 'Vengeful Gladiator\'s Vestments');

-- Insert Armor Sets for Shaman: Vengeful Gladiator's Earthshaker (Enhancement) Item Set 732
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 33706, 'Vengeful Gladiator\'s Linked Armor', 732, 'Vengeful Gladiator\'s Earthshaker'),
(7, 33707, 'Vengeful Gladiator\'s Linked Gauntlets', 732, 'Vengeful Gladiator\'s Earthshaker'),
(7, 33708, 'Vengeful Gladiator\'s Linked Helm', 732, 'Vengeful Gladiator\'s Earthshaker'),
(7, 33709, 'Vengeful Gladiator\'s Linked Leggings', 732, 'Vengeful Gladiator\'s Earthshaker'),
(7, 33710, 'Vengeful Gladiator\'s Linked Spaulders', 732, 'Vengeful Gladiator\'s Earthshaker');

-- Insert Armor Sets for Shaman: Vengeful Gladiator's Thunderfist (Elemental) Item Set 733
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 33711, 'Vengeful Gladiator\'s Mail Armor', 733, 'Vengeful Gladiator\'s Thunderfist'),
(7, 33712, 'Vengeful Gladiator\'s Mail Gauntlets', 733, 'Vengeful Gladiator\'s Thunderfist'),
(7, 33713, 'Vengeful Gladiator\'s Mail Helm', 733, 'Vengeful Gladiator\'s Thunderfist'),
(7, 33714, 'Vengeful Gladiator\'s Mail Leggings', 733, 'Vengeful Gladiator\'s Thunderfist'),
(7, 33715, 'Vengeful Gladiator\'s Mail Spaulders', 733, 'Vengeful Gladiator\'s Thunderfist');

-- Insert Armor Sets for Shaman: Vengeful Gladiator's Wartide (Restoration) Item Set 731
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 33738, 'Vengeful Gladiator\'s Ringmail Armor', 731, 'Vengeful Gladiator\'s Wartide'),
(7, 33739, 'Vengeful Gladiator\'s Ringmail Gauntlets', 731, 'Vengeful Gladiator\'s Wartide'),
(7, 33740, 'Vengeful Gladiator\'s Ringmail Helm', 731, 'Vengeful Gladiator\'s Wartide'),
(7, 33741, 'Vengeful Gladiator\'s Ringmail Leggings', 731, 'Vengeful Gladiator\'s Wartide'),
(7, 33742, 'Vengeful Gladiator\'s Ringmail Spaulders', 731, 'Vengeful Gladiator\'s Wartide');

-- Insert Armor Sets for Warlock: Vengeful Gladiator's Dreadgear (Affliction) Item Set 734
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 33676, 'Vengeful Gladiator\'s Dreadweave Gloves', 734, 'Vengeful Gladiator\'s Dreadgear'),
(9, 33677, 'Vengeful Gladiator\'s Dreadweave Hood', 734, 'Vengeful Gladiator\'s Dreadgear'),
(9, 33678, 'Vengeful Gladiator\'s Dreadweave Leggings', 734, 'Vengeful Gladiator\'s Dreadgear'),
(9, 33679, 'Vengeful Gladiator\'s Dreadweave Mantle', 734, 'Vengeful Gladiator\'s Dreadgear'),
(9, 33680, 'Vengeful Gladiator\'s Dreadweave Robe', 734, 'Vengeful Gladiator\'s Dreadgear');

-- Insert Armor Sets for Warlock: Vengeful Gladiator's Felshroud (Crit Gear) Item Set 735
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 33682, 'Vengeful Gladiator\'s Felweave Amice', 735, 'Vengeful Gladiator\'s Felshroud'),
(9, 33683, 'Vengeful Gladiator\'s Felweave Cowl', 735, 'Vengeful Gladiator\'s Felshroud'),
(9, 33684, 'Vengeful Gladiator\'s Felweave Handguards', 735, 'Vengeful Gladiator\'s Felshroud'),
(9, 33685, 'Vengeful Gladiator\'s Felweave Raiment', 735, 'Vengeful Gladiator\'s Felshroud'),
(9, 33686, 'Vengeful Gladiator\'s Felweave Trousers', 735, 'Vengeful Gladiator\'s Felshroud');

-- Insert Armor Sets for Warrior: Vengeful Gladiator's Battlegear Item Set 736
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 33728, 'Vengeful Gladiator\'s Plate Chestpiece', 736, 'Vengeful Gladiator\'s Battlegear'),
(1, 33729, 'Vengeful Gladiator\'s Plate Gauntlets', 736, 'Vengeful Gladiator\'s Battlegear'),
(1, 33730, 'Vengeful Gladiator\'s Plate Helm', 736, 'Vengeful Gladiator\'s Battlegear'),
(1, 33731, 'Vengeful Gladiator\'s Plate Legguards', 736, 'Vengeful Gladiator\'s Battlegear'),
(1, 33732, 'Vengeful Gladiator\'s Plate Shoulders', 736, 'Vengeful Gladiator\'s Battlegear');




-- [[ Season 4 Gear ]]




-- Insert Armor Sets for Death Knight: Brutal Gladiator's Dreadplate Item Set 416
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(6, 40440, 'Brutal Gladiator\'s Dreadplate Chestpiece', 416, 'Brutal Gladiator\'s Dreadplate'),
(6, 40441, 'Brutal Gladiator\'s Dreadplate Gauntlets', 416, 'Brutal Gladiator\'s Dreadplate'),
(6, 40442, 'Brutal Gladiator\'s Dreadplate Helm', 416, 'Brutal Gladiator\'s Dreadplate'),
(6, 40443, 'Brutal Gladiator\'s Dreadplate Legguards', 416, 'Brutal Gladiator\'s Dreadplate'),
(6, 40444, 'Brutal Gladiator\'s Dreadplate Shoulders', 416, 'Brutal Gladiator\'s Dreadplate');

-- Insert Armor Sets for Druid: Brutal Gladiator's Sanctuary (Feral) Item Set 12
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 34998, 'Brutal Gladiator\'s Dragonhide Gloves', 12, 'Brutal Gladiator\'s Sanctuary'),
(11, 34999, 'Brutal Gladiator\'s Dragonhide Helm', 12, 'Brutal Gladiator\'s Sanctuary'),
(11, 35000, 'Brutal Gladiator\'s Dragonhide Legguards', 12, 'Brutal Gladiator\'s Sanctuary'),
(11, 35001, 'Brutal Gladiator\'s Dragonhide Spaulders', 12, 'Brutal Gladiator\'s Sanctuary'),
(11, 35002, 'Brutal Gladiator\'s Dragonhide Tunic', 12, 'Brutal Gladiator\'s Sanctuary');

-- Insert Armor Sets for Druid: Brutal Gladiator's Wildhide (Balance) Item Set 17
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 35111, 'Brutal Gladiator\'s Wyrmhide Gloves', 17, 'Brutal Gladiator\'s Wildhide'),
(11, 35112, 'Brutal Gladiator\'s Wyrmhide Helm', 17, 'Brutal Gladiator\'s Wildhide'),
(11, 35113, 'Brutal Gladiator\'s Wyrmhide Legguards', 17, 'Brutal Gladiator\'s Wildhide'),
(11, 35114, 'Brutal Gladiator\'s Wyrmhide Spaulders', 17, 'Brutal Gladiator\'s Wildhide'),
(11, 35115, 'Brutal Gladiator\'s Wyrmhide Tunic', 17, 'Brutal Gladiator\'s Wildhide');

-- Insert Armor Sets for Druid: Brutal Gladiator's Refuge (Restoration) Item Set 10
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 35022, 'Brutal Gladiator\'s Kodohide Gloves', 10, 'Brutal Gladiator\'s Refuge'),
(11, 35023, 'Brutal Gladiator\'s Kodohide Helm', 10, 'Brutal Gladiator\'s Refuge'),
(11, 35024, 'Brutal Gladiator\'s Kodohide Legguards', 10, 'Brutal Gladiator\'s Refuge'),
(11, 35025, 'Brutal Gladiator\'s Kodohide Spaulders', 10, 'Brutal Gladiator\'s Refuge'),
(11, 35026, 'Brutal Gladiator\'s Kodohide Tunic', 10, 'Brutal Gladiator\'s Refuge');

-- Insert Armor Sets for Hunter: Brutal Gladiator's Pursuit Item Set 7
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 34990, 'Brutal Gladiator\'s Chain Armor', 7, 'Brutal Gladiator\'s Pursuit'),
(3, 34991, 'Brutal Gladiator\'s Chain Gauntlets', 7, 'Brutal Gladiator\'s Pursuit'),
(3, 34992, 'Brutal Gladiator\'s Chain Helm', 7, 'Brutal Gladiator\'s Pursuit'),
(3, 34993, 'Brutal Gladiator\'s Chain Leggings', 7, 'Brutal Gladiator\'s Pursuit'),
(3, 34994, 'Brutal Gladiator\'s Chain Spaulders', 7, 'Brutal Gladiator\'s Pursuit');

-- Insert Armor Sets for Mage: Brutal Gladiator's Regalia Item Set 11
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 35096, 'Brutal Gladiator\'s Silk Amice', 11, 'Brutal Gladiator\'s Regalia'),
(8, 35097, 'Brutal Gladiator\'s Silk Cowl', 11, 'Brutal Gladiator\'s Regalia'),
(8, 35098, 'Brutal Gladiator\'s Silk Handguards', 11, 'Brutal Gladiator\'s Regalia'),
(8, 35099, 'Brutal Gladiator\'s Silk Raiment', 11, 'Brutal Gladiator\'s Regalia'),
(8, 35100, 'Brutal Gladiator\'s Silk Trousers', 11, 'Brutal Gladiator\'s Regalia');

-- Insert Armor Sets for Paladin: Brutal Gladiator's Aegis (Spell Damage) Item Set 1
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 35027, 'Brutal Gladiator\'s Lamellar Chestpiece', 1, 'Brutal Gladiator\'s Aegis'),
(2, 35028, 'Brutal Gladiator\'s Lamellar Gauntlets', 1, 'Brutal Gladiator\'s Aegis'),
(2, 35029, 'Brutal Gladiator\'s Lamellar Helm', 1, 'Brutal Gladiator\'s Aegis'),
(2, 35030, 'Brutal Gladiator\'s Lamellar Legguards', 1, 'Brutal Gladiator\'s Aegis'),
(2, 35031, 'Brutal Gladiator\'s Lamellar Shoulders', 1, 'Brutal Gladiator\'s Aegis');

-- Insert Armor Sets for Paladin: Brutal Gladiator's Vindication (Retribution) Item Set 15
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 35088, 'Brutal Gladiator\'s Scaled Chestpiece', 15, 'Brutal Gladiator\'s Vindication'),
(2, 35089, 'Brutal Gladiator\'s Scaled Gauntlets', 15, 'Brutal Gladiator\'s Vindication'),
(2, 35090, 'Brutal Gladiator\'s Scaled Helm', 15, 'Brutal Gladiator\'s Vindication'),
(2, 35091, 'Brutal Gladiator\'s Scaled Legguards', 15, 'Brutal Gladiator\'s Vindication'),
(2, 35092, 'Brutal Gladiator\'s Scaled Shoulders', 15, 'Brutal Gladiator\'s Vindication');

-- Insert Armor Sets for Paladin: Brutal Gladiator's Redemption (Holy) Item Set 9
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 35059, 'Brutal Gladiator\'s Ornamented Chestguard', 9, 'Brutal Gladiator\'s Redemption'),
(2, 35060, 'Brutal Gladiator\'s Ornamented Gloves', 9, 'Brutal Gladiator\'s Redemption'),
(2, 35061, 'Brutal Gladiator\'s Ornamented Headcover', 9, 'Brutal Gladiator\'s Redemption'),
(2, 35062, 'Brutal Gladiator\'s Ornamented Legplates', 9, 'Brutal Gladiator\'s Redemption'),
(2, 35063, 'Brutal Gladiator\'s Ornamented Spaulders', 9, 'Brutal Gladiator\'s Redemption');

-- Insert Armor Sets for Priest: Brutal Gladiator's Raiment (Shadow) Item Set 8
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 35083, 'Brutal Gladiator\'s Satin Gloves', 8, 'Brutal Gladiator\'s Raiment'),
(5, 35084, 'Brutal Gladiator\'s Satin Hood', 8, 'Brutal Gladiator\'s Raiment'),
(5, 35085, 'Brutal Gladiator\'s Satin Leggings', 8, 'Brutal Gladiator\'s Raiment'),
(5, 35086, 'Brutal Gladiator\'s Satin Mantle', 8, 'Brutal Gladiator\'s Raiment'),
(5, 35087, 'Brutal Gladiator\'s Satin Robe', 8, 'Brutal Gladiator\'s Raiment');

-- Insert Armor Sets for Priest: Brutal Gladiator's Investiture (Holy) Item Set 6
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 35053, 'Brutal Gladiator\'s Mooncloth Gloves', 6, 'Brutal Gladiator\'s Investiture'),
(5, 35054, 'Brutal Gladiator\'s Mooncloth Hood', 6, 'Brutal Gladiator\'s Investiture'),
(5, 35055, 'Brutal Gladiator\'s Mooncloth Leggings', 6, 'Brutal Gladiator\'s Investiture'),
(5, 35056, 'Brutal Gladiator\'s Mooncloth Mantle', 6, 'Brutal Gladiator\'s Investiture'),
(5, 35057, 'Brutal Gladiator\'s Mooncloth Robe', 6, 'Brutal Gladiator\'s Investiture');

-- Insert Armor Sets for Rogue: Brutal Gladiator's Vestments Item Set 14
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 35032, 'Brutal Gladiator\'s Leather Gloves', 14, 'Brutal Gladiator\'s Vestments'),
(4, 35034, 'Brutal Gladiator\'s Leather Legguards', 14, 'Brutal Gladiator\'s Vestments'),
(4, 35033, 'Brutal Gladiator\'s Leather Helm', 14, 'Brutal Gladiator\'s Vestments'),
(4, 35035, 'Brutal Gladiator\'s Leather Spaulders', 14, 'Brutal Gladiator\'s Vestments'),
(4, 35036, 'Brutal Gladiator\'s Leather Tunic', 14, 'Brutal Gladiator\'s Vestments');

-- Insert Armor Sets for Shaman: Brutal Gladiator's Earthshaker (Enhancement) Item Set 4
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 35042, 'Brutal Gladiator\'s Linked Armor', 4, 'Brutal Gladiator\'s Earthshaker'),
(7, 35043, 'Brutal Gladiator\'s Linked Gauntlets', 4, 'Brutal Gladiator\'s Earthshaker'),
(7, 35044, 'Brutal Gladiator\'s Linked Helm', 4, 'Brutal Gladiator\'s Earthshaker'),
(7, 35045, 'Brutal Gladiator\'s Linked Leggings', 4, 'Brutal Gladiator\'s Earthshaker'),
(7, 35046, 'Brutal Gladiator\'s Linked Spaulders', 4, 'Brutal Gladiator\'s Earthshaker');

-- Insert Armor Sets for Shaman: Brutal Gladiator's Thunderfist (Elemental) Item Set 13
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 35048, 'Brutal Gladiator\'s Mail Armor', 13, 'Brutal Gladiator\'s Thunderfist'),
(7, 35049, 'Brutal Gladiator\'s Mail Gauntlets', 13, 'Brutal Gladiator\'s Thunderfist'),
(7, 35050, 'Brutal Gladiator\'s Mail Helm', 13, 'Brutal Gladiator\'s Thunderfist'),
(7, 35051, 'Brutal Gladiator\'s Mail Leggings', 13, 'Brutal Gladiator\'s Thunderfist'),
(7, 35052, 'Brutal Gladiator\'s Mail Spaulders', 13, 'Brutal Gladiator\'s Thunderfist');

-- Insert Armor Sets for Shaman: Brutal Gladiator's Wartide (Restoration) Item Set 16
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 35077, 'Brutal Gladiator\'s Ringmail Armor', 16, 'Brutal Gladiator\'s Wartide'),
(7, 35078, 'Brutal Gladiator\'s Ringmail Gauntlets', 16, 'Brutal Gladiator\'s Wartide'),
(7, 35079, 'Brutal Gladiator\'s Ringmail Helm', 16, 'Brutal Gladiator\'s Wartide'),
(7, 35080, 'Brutal Gladiator\'s Ringmail Leggings', 16, 'Brutal Gladiator\'s Wartide'),
(7, 35081, 'Brutal Gladiator\'s Ringmail Spaulders', 16, 'Brutal Gladiator\'s Wartide');

-- Insert Armor Sets for Warlock: Brutal Gladiator's Dreadgear (Affliction) Item Set 3
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 35003, 'Brutal Gladiator\'s Dreadweave Gloves', 3, 'Brutal Gladiator\'s Dreadgear'),
(9, 35004, 'Brutal Gladiator\'s Dreadweave Hood', 3, 'Brutal Gladiator\'s Dreadgear'),
(9, 35005, 'Brutal Gladiator\'s Dreadweave Leggings', 3, 'Brutal Gladiator\'s Dreadgear'),
(9, 35006, 'Brutal Gladiator\'s Dreadweave Mantle', 3, 'Brutal Gladiator\'s Dreadgear'),
(9, 35007, 'Brutal Gladiator\'s Dreadweave Robe', 3, 'Brutal Gladiator\'s Dreadgear');

-- Insert Armor Sets for Warlock: Brutal Gladiator's Felshroud (Crit Gear) Item Set 5
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 35009, 'Brutal Gladiator\'s Felweave Amice', 5, 'Brutal Gladiator\'s Felshroud'),
(9, 35010, 'Brutal Gladiator\'s Felweave Cowl', 5, 'Brutal Gladiator\'s Felshroud'),
(9, 35011, 'Brutal Gladiator\'s Felweave Handguards', 5, 'Brutal Gladiator\'s Felshroud'),
(9, 35012, 'Brutal Gladiator\'s Felweave Raiment', 5, 'Brutal Gladiator\'s Felshroud'),
(9, 35013, 'Brutal Gladiator\'s Felweave Trousers', 5, 'Brutal Gladiator\'s Felshroud');

-- Insert Armor Sets for Warrior: Brutal Gladiator's Battlegear Item Set 2
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 35066, 'Brutal Gladiator\'s Plate Chestpiece', 2, 'Brutal Gladiator\'s Battlegear'),
(1, 35067, 'Brutal Gladiator\'s Plate Gauntlets', 2, 'Brutal Gladiator\'s Battlegear'),
(1, 35068, 'Brutal Gladiator\'s Plate Helm', 2, 'Brutal Gladiator\'s Battlegear'),
(1, 35069, 'Brutal Gladiator\'s Plate Legguards', 2, 'Brutal Gladiator\'s Battlegear'),
(1, 35070, 'Brutal Gladiator\'s Plate Shoulders', 2, 'Brutal Gladiator\'s Battlegear');




-- [[ Dungeon Set 3 ]]



-- Insert Armor Sets for Druid: Moonglade Raiment Item Set 637
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 28348, 'Moonglade Cowl', 637, 'Moonglade Raiment'),
(11, 27468, 'Moonglade Handwraps', 637, 'Moonglade Raiment'),
(11, 27873, 'Moonglade Pants', 637, 'Moonglade Raiment'),
(11, 28202, 'Moonglade Robe', 637, 'Moonglade Raiment'),
(11, 27737, 'Moonglade Shoulders', 637, 'Moonglade Raiment');

-- Insert Armor Sets for Hunter: Beast Lord Armor Item Set 650
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 28228, 'Beast Lord Cuirass', 650, 'Beast Lord Armor'),
(3, 27474, 'Beast Lord Handguards', 650, 'Beast Lord Armor'),
(3, 28275, 'Beast Lord Helm', 650, 'Beast Lord Armor'),
(3, 27874, 'Beast Lord Leggings', 650, 'Beast Lord Armor'),
(3, 27801, 'Beast Lord Mantle', 650, 'Beast Lord Armor');

-- Insert Armor Sets for Mage: Incanter's Regalia Item Set 647
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 28278, 'Incanter\'s Cowl', 647, 'Incanter\'s Regalia'),
(8, 27508, 'Incanter\'s Gloves', 647, 'Incanter\'s Regalia'),
(8, 27738, 'Incanter\'s Pauldrons', 647, 'Incanter\'s Regalia'),
(8, 28229, 'Incanter\'s Robe', 647, 'Incanter\'s Regalia'),
(8, 27838, 'Incanter\'s Trousers', 647, 'Incanter\'s Regalia');

-- Insert Armor Sets for Paladin: Righteous Armor Item Set 623
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 28203, 'Righteous Breastplate', 623, 'Righteous Armor'),
(2, 27535, 'Righteous Gauntlets', 623, 'Righteous Armor'),
(2, 28285, 'Righteous Helmet', 623, 'Righteous Armor'),
(2, 27839, 'Righteous Legplates', 623, 'Righteous Armor'),
(2, 27739, 'Righteous Spaulders', 623, 'Righteous Armor');

-- Insert Armor Sets for Priest: Hallowed Raiment Item Set 662
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 28413, 'Hallowed Crown', 662, 'Hallowed Raiment'),
(5, 28230, 'Hallowed Garments', 662, 'Hallowed Raiment'),
(5, 27536, 'Hallowed Handwraps', 662, 'Hallowed Raiment'),
(5, 27775, 'Hallowed Pauldrons', 662, 'Hallowed Raiment'),
(5, 27875, 'Hallowed Trousers', 662, 'Hallowed Raiment');

-- Insert Armor Sets for Rogue: Assassination Armor Item Set 620
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 27509, 'Handgrips of Assassination', 620, 'Assassination Armor'),
(4, 28414, 'Helm of Assassination', 620, 'Assassination Armor'),
(4, 27908, 'Leggings of Assassination', 620, 'Assassination Armor'),
(4, 27776, 'Shoulderpads of Assassination', 620, 'Assassination Armor'),
(4, 28204, 'Tunic of Assassination', 620, 'Assassination Armor');

-- Insert Armor Sets for Shaman: Tidefury Raiment Item Set 630
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 28231, 'Tidefury Chestpiece', 630, 'Tidefury Raiment'),
(7, 27510, 'Tidefury Gauntlets', 630, 'Tidefury Raiment'),
(7, 28349, 'Tidefury Helm', 630, 'Tidefury Raiment'),
(7, 27909, 'Tidefury Kilt', 630, 'Tidefury Raiment'),
(7, 27802, 'Tidefury Shoulderguards', 630, 'Tidefury Raiment');

-- Insert Armor Sets for Warlock: Oblivion Raiment Item Set 644
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 27537, 'Gloves of Oblivion', 644, 'Oblivion Raiment'),
(9, 28415, 'Hood of Oblivion', 644, 'Oblivion Raiment'),
(9, 28232, 'Robe of Oblivion', 644, 'Oblivion Raiment'),
(9, 27778, 'Spaulders of Oblivion', 644, 'Oblivion Raiment'),
(9, 27948, 'Trousers of Oblivion', 644, 'Oblivion Raiment');

-- Insert Armor Sets for Warrior: Bold Armor Item Set 653
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 28205, 'Breastplate of the Bold', 653, 'Bold Armor'),
(1, 27538, 'Gauntlets of the Bold', 653, 'Bold Armor'),
(1, 27918, 'Legplates of the Bold', 653, 'Bold Armor'),
(1, 27803, 'Shoulderguards of the Bold', 653, 'Bold Armor'),
(1, 28350, 'Warhelm of the Bold', 653, 'Bold Armor');




-- [[ Tier 4 Set ]]






-- Insert Armor Sets for Druid: Malorne Regalia Item Set 639
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 29093, 'Antlers of Malorne', 639, 'Malorne Regalia'),
(11, 29094, 'Britches of Malorne', 639, 'Malorne Regalia'),
(11, 29091, 'Chestpiece of Malorne', 639, 'Malorne Regalia'),
(11, 29092, 'Gloves of Malorne', 639, 'Malorne Regalia'),
(11, 29095, 'Pauldrons of Malorne', 639, 'Malorne Regalia');

-- Insert Armor Sets for Druid: Malorne Harness Item Set 640
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 29096, 'Breastplate of Malorne', 640, 'Malorne Harness'),
(11, 29097, 'Gauntlets of Malorne', 640, 'Malorne Harness'),
(11, 29099, 'Greaves of Malorne', 640, 'Malorne Harness'),
(11, 29100, 'Mantle of Malorne', 640, 'Malorne Harness'),
(11, 29098, 'Stag-Helm of Malorne', 640, 'Malorne Harness');

-- Insert Armor Sets for Druid: Malorne Raiment Item Set 638
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 29087, 'Chestguard of Malorne', 638, 'Malorne Raiment'),
(11, 29086, 'Crown of Malorne', 638, 'Malorne Raiment'),
(11, 29090, 'Handguards of Malorne', 638, 'Malorne Raiment'),
(11, 29088, 'Legguards of Malorne', 638, 'Malorne Raiment'),
(11, 29089, 'Shoulderguards of Malorne', 638, 'Malorne Raiment');

-- Insert Armor Sets for Hunter: Demon Stalker Armor Set 651
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 29085, 'Demonstalker Gauntlets', 651, 'Demon Stalker Armor'),
(3, 29081, 'Demonstalker Greathelm', 651, 'Demon Stalker Armor'),
(3, 29083, 'Demonstalker Greaves', 651, 'Demon Stalker Armor'),
(3, 29082, 'Demonstalker Harness', 651, 'Demon Stalker Armor'),
(3, 29084, 'Demonstalker Shoulderguards', 651, 'Demon Stalker Armor');

-- Insert Armor Sets for Mage: Aldor Regalia Item Set 648
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 29076, 'Collar of the Aldor', 648, 'Aldor Regalia'),
(8, 29080, 'Gloves of the Aldor', 648, 'Aldor Regalia'),
(8, 29078, 'Legwraps of the Aldor', 648, 'Aldor Regalia'),
(8, 29079, 'Pauldrons of the Aldor', 648, 'Aldor Regalia'),
(8, 29077, 'Vestments of the Aldor', 648, 'Aldor Regalia');

-- Insert Armor Sets for Paladin: Justicar Raiment Item Set 624
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 29062, 'Justicar Chestpiece', 624, 'Justicar Raiment'),
(2, 29061, 'Justicar Diadem', 624, 'Justicar Raiment'),
(2, 29065, 'Justicar Gloves', 624, 'Justicar Raiment'),
(2, 29063, 'Justicar Leggings', 624, 'Justicar Raiment'),
(2, 29064, 'Justicar Pauldrons', 624, 'Justicar Raiment');

-- Insert Armor Sets for Paladin: Justicar Armor Set 625
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 29066, 'Justicar Chestguard', 625, 'Justicar Armor'),
(2, 29068, 'Justicar Faceguard', 625, 'Justicar Armor'),
(2, 29067, 'Justicar Handguards', 625, 'Justicar Armor'),
(2, 29069, 'Justicar Legguards', 625, 'Justicar Armor'),
(2, 29070, 'Justicar Shoulderguards', 625, 'Justicar Armor');

-- Insert Armor Sets for Paladin: Justicar Battlegear Item Set 626
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 29071, 'Justicar Breastplate', 626, 'Justicar Battlegear'),
(2, 29073, 'Justicar Crown', 626, 'Justicar Battlegear'),
(2, 29072, 'Justicar Gauntlets', 626, 'Justicar Battlegear'),
(2, 29074, 'Justicar Greaves', 626, 'Justicar Battlegear'),
(2, 29075, 'Justicar Shoulderplates', 626, 'Justicar Battlegear');

-- Insert Armor Sets for Priest: Incarnate Raiment Item Set 663
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 29055, 'Handwraps of the Incarnate', 663, 'Incarnate Raiment'),
(5, 29049, 'Light-Collar of the Incarnate', 663, 'Incarnate Raiment'),
(5, 29054, 'Light-Mantle of the Incarnate', 663, 'Incarnate Raiment'),
(5, 29050, 'Robes of the Incarnate', 663, 'Incarnate Raiment'),
(5, 29053, 'Trousers of the Incarnate', 663, 'Incarnate Raiment');

-- Insert Armor Sets for Priest: Incarnate Regalia Item Set 664
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 29057, 'Gloves of the Incarnate', 664, 'Incarnate Regalia'),
(5, 29059, 'Leggings of the Incarnate', 664, 'Incarnate Regalia'),
(5, 29056, 'Shroud of the Incarnate', 664, 'Incarnate Regalia'),
(5, 29058, 'Soul-Collar of the Incarnate', 664, 'Incarnate Regalia'),
(5, 29060, 'Soul-Mantle of the Incarnate', 664, 'Incarnate Regalia');

-- Insert Armor Sets for Rogue: Netherblade Item Set 621
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 29046, 'Netherblade Breeches', 621, 'Netherblade'),
(4, 29045, 'Netherblade Chestpiece', 621, 'Netherblade'),
(4, 29044, 'Netherblade Facemask', 621, 'Netherblade'),
(4, 29048, 'Netherblade Gloves', 621, 'Netherblade'),
(4, 29047, 'Netherblade Shoulderpads', 621, 'Netherblade');

-- Insert Armor Sets for Shaman: Cyclone Regalia Item Set 632
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 29033, 'Cyclone Chestguard', 632, 'Cyclone Regalia'),
(7, 29035, 'Cyclone Faceguard', 632, 'Cyclone Regalia'),
(7, 29034, 'Cyclone Handguards', 632, 'Cyclone Regalia'),
(7, 29036, 'Cyclone Legguards', 632, 'Cyclone Regalia'),
(7, 29037, 'Cyclone Shoulderguards', 632, 'Cyclone Regalia');

-- Insert Armor Sets for Shaman: Cyclone Harness Item Set 633
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 29038, 'Cyclone Breastplate', 633, 'Cyclone Harness'),
(7, 29039, 'Cyclone Gauntlets', 633, 'Cyclone Harness'),
(7, 29040, 'Cyclone Helm', 633, 'Cyclone Harness'),
(7, 29043, 'Cyclone Shoulderguards', 633, 'Cyclone Harness'),
(7, 29042, 'Cyclone War-Kilt', 633, 'Cyclone Harness');

-- Insert Armor Sets for Shaman: Cyclone Raiment Item Set 631
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 29032, 'Cyclone Gloves', 631, 'Cyclone Raiment'),
(7, 29029, 'Cyclone Hauberk', 631, 'Cyclone Raiment'),
(7, 29028, 'Cyclone Headdress', 631, 'Cyclone Raiment'),
(7, 29030, 'Cyclone Kilt', 631, 'Cyclone Raiment'),
(7, 29031, 'Cyclone Shoulderpads', 631, 'Cyclone Raiment');

-- Insert Armor Sets for Warlock: Voidheart Raiment Item Set 645
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 28963, 'Voidheart Crown', 645, 'Voidheart Raiment'),
(9, 28968, 'Voidheart Gloves', 645, 'Voidheart Raiment'),
(9, 28966, 'Voidheart Leggings', 645, 'Voidheart Raiment'),
(9, 28967, 'Voidheart Mantle', 645, 'Voidheart Raiment'),
(9, 28964, 'Voidheart Robe', 645, 'Voidheart Raiment');

-- Insert Armor Sets for Warrior: Warbringer Battlegear Item Set 655
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 29021, 'Warbringer Battle-Helm', 655, 'Warbringer Battlegear'),
(1, 29019, 'Warbringer Breastplate', 655, 'Warbringer Battlegear'),
(1, 29020, 'Warbringer Gauntlets', 655, 'Warbringer Battlegear'),
(1, 29022, 'Warbringer Greaves', 655, 'Warbringer Battlegear'),
(1, 29023, 'Warbringer Shoulderplates', 655, 'Warbringer Battlegear');

-- Insert Armor Sets for Warrior: Warbringer Armor Item Set 654
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 29012, 'Warbringer Chestguard', 654, 'Warbringer Armor'),
(1, 29011, 'Warbringer Greathelm', 654, 'Warbringer Armor'),
(1, 29017, 'Warbringer Handguards', 654, 'Warbringer Armor'),
(1, 29015, 'Warbringer Legguards', 654, 'Warbringer Armor'),
(1, 29016, 'Warbringer Shoulderguards', 654, 'Warbringer Armor');




-- [[ Tier 5 Set ]]




-- Insert Armor Sets for Druid: Nordrassil Regalia Item Set 643
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 30231, 'Nordrassil Chestpiece', 643, 'Nordrassil Regalia'),
(11, 30232, 'Nordrassil Gauntlets', 643, 'Nordrassil Regalia'),
(11, 30233, 'Nordrassil Headpiece', 643, 'Nordrassil Regalia'),
(11, 30234, 'Nordrassil Wrath-Kilt', 643, 'Nordrassil Regalia'),
(11, 30235, 'Nordrassil Wrath-Mantle', 643, 'Nordrassil Regalia');

-- Insert Armor Sets for Druid: Nordrassil Harness Item Set 641
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 30222, 'Nordrassil Chestplate', 641, 'Nordrassil Harness'),
(11, 30223, 'Nordrassil Handgrips', 641, 'Nordrassil Harness'),
(11, 30228, 'Nordrassil Headdress', 641, 'Nordrassil Harness'),
(11, 30229, 'Nordrassil Feral-Kilt', 641, 'Nordrassil Harness'),
(11, 30230, 'Nordrassil Feral-Mantle', 641, 'Nordrassil Harness');

-- Insert Armor Sets for Druid: Nordrassil Raiment Item Set 642
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 30216, 'Nordrassil Chestguard', 642, 'Nordrassil Raiment'),
(11, 30217, 'Nordrassil Gloves', 642, 'Nordrassil Raiment'),
(11, 30219, 'Nordrassil Headguard', 642, 'Nordrassil Raiment'),
(11, 30220, 'Nordrassil Life-Kilt', 642, 'Nordrassil Raiment'),
(11, 30221, 'Nordrassil Life-Mantle', 642, 'Nordrassil Raiment');

-- Insert Armor Sets for Hunter: Rift Stalker Armor Item Set 652
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 30139, 'Rift Stalker Hauberk', 652, 'Rift Stalker Armor'),
(3, 30140, 'Rift Stalker Gauntlets', 652, 'Rift Stalker Armor'),
(3, 30141, 'Rift Stalker Helm', 652, 'Rift Stalker Armor'),
(3, 30142, 'Rift Stalker Leggings', 652, 'Rift Stalker Armor'),
(3, 30143, 'Rift Stalker Mantle', 652, 'Rift Stalker Armor');

-- Insert Armor Sets for Mage: Tirisfal Regalia Item Set 649
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 30206, 'Cowl of Tirisfal', 649, 'Tirisfal Regalia'),
(8, 30205, 'Gloves of Tirisfal', 649, 'Tirisfal Regalia'),
(8, 30207, 'Leggings of Tirisfal', 649, 'Tirisfal Regalia'),
(8, 30210, 'Mantle of Tirisfal', 649, 'Tirisfal Regalia'),
(8, 30196, 'Robes of Tirisfal', 649, 'Tirisfal Regalia');

-- Insert Armor Sets for Paladin: Crystalforge Raiment Item Set 627
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 30134, 'Crystalforge Chestpiece', 627, 'Crystalforge Raiment'),
(2, 30135, 'Crystalforge Gloves', 627, 'Crystalforge Raiment'),
(2, 30136, 'Crystalforge Greathelm', 627, 'Crystalforge Raiment'),
(2, 30137, 'Crystalforge Leggings', 627, 'Crystalforge Raiment'),
(2, 30138, 'Crystalforge Pauldrons', 627, 'Crystalforge Raiment');

-- Insert Armor Sets for Paladin: Crystalforge Armor Item Set 628
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 30123, 'Crystalforge Chestguard', 628, 'Crystalforge Armor'),
(2, 30125, 'Crystalforge Faceguard', 628, 'Crystalforge Armor'),
(2, 30124, 'Crystalforge Handguards', 628, 'Crystalforge Armor'),
(2, 30126, 'Crystalforge Legguards', 628, 'Crystalforge Armor'),
(2, 30127, 'Crystalforge Shoulderguards', 628, 'Crystalforge Armor');

-- Insert Armor Sets for Paladin: Crystalforge Battlegear Item Set 629
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 30129, 'Crystalforge Breastplate', 629, 'Crystalforge Battlegear'),
(2, 30130, 'Crystalforge Gauntlets', 629, 'Crystalforge Battlegear'),
(2, 30132, 'Crystalforge Greaves', 629, 'Crystalforge Battlegear'),
(2, 30133, 'Crystalforge Shoulder-Braces', 629, 'Crystalforge Battlegear'),
(2, 30131, 'Crystalforge War-Helm', 629, 'Crystalforge Battlegear');

-- Insert Armor Sets for Priest: Avatar Raiment Item Set 665
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 30153, 'Breeches of the Avatar', 665, 'Avatar Raiment'),
(5, 30152, 'Cowl of the Avatar', 665, 'Avatar Raiment'),
(5, 30151, 'Gloves of the Avatar', 665, 'Avatar Raiment'),
(5, 30154, 'Mantle of the Avatar', 665, 'Avatar Raiment'),
(5, 30150, 'Vestments of the Avatar', 665, 'Avatar Raiment');

-- Insert Armor Sets for Priest: Avatar Regalia Item Set 666
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 30160, 'Handguards of the Avatar', 666, 'Avatar Regalia'),
(5, 30161, 'Hood of the Avatar', 666, 'Avatar Regalia'),
(5, 30162, 'Leggings of the Avatar', 666, 'Avatar Regalia'),
(5, 30159, 'Shroud of the Avatar', 666, 'Avatar Regalia'),
(5, 30163, 'Wings of the Avatar', 666, 'Avatar Regalia');

-- Insert Armor Sets for Rogue: Deathmantle Item Set 622
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 30144, 'Deathmantle Chestguard', 622, 'Deathmantle'),
(4, 30145, 'Deathmantle Handguards', 622, 'Deathmantle'),
(4, 30146, 'Deathmantle Helm', 622, 'Deathmantle'),
(4, 30148, 'Deathmantle Legguards', 622, 'Deathmantle'),
(4, 30149, 'Deathmantle Shoulderpads', 622, 'Deathmantle');

-- Insert Armor Sets for Shaman: Cataclysm Regalia Item Set 635
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 30169, 'Cataclysm Chestpiece', 635, 'Cataclysm Regalia'),
(7, 30170, 'Cataclysm Handgrips', 635, 'Cataclysm Regalia'),
(7, 30171, 'Cataclysm Headpiece', 635, 'Cataclysm Regalia'),
(7, 30172, 'Cataclysm Leggings', 635, 'Cataclysm Regalia'),
(7, 30173, 'Cataclysm Shoulderpads', 635, 'Cataclysm Regalia');

-- Insert Armor Sets for Shaman: Cataclysm Harness Item Set 636
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 30185, 'Cataclysm Chestplate', 636, 'Cataclysm Harness'),
(7, 30189, 'Cataclysm Gauntlets', 636, 'Cataclysm Harness'),
(7, 30190, 'Cataclysm Helm', 636, 'Cataclysm Harness'),
(7, 30192, 'Cataclysm Legplates', 636, 'Cataclysm Harness'),
(7, 30194, 'Cataclysm Shoulderplates', 636, 'Cataclysm Harness');

-- Insert Armor Sets for Shaman: Cataclysm Raiment Item Set 634
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 30164, 'Cataclysm Chestguard', 634, 'Cataclysm Raiment'),
(7, 30165, 'Cataclysm Gloves', 634, 'Cataclysm Raiment'),
(7, 30166, 'Cataclysm Headguard', 634, 'Cataclysm Raiment'),
(7, 30167, 'Cataclysm Legguards', 634, 'Cataclysm Raiment'),
(7, 30168, 'Cataclysm Shoulderguards', 634, 'Cataclysm Raiment');

-- Insert Armor Sets for Warlock: Corruptor Raiment Item Set 646
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 30211, 'Gloves of the Corruptor', 646, 'Corruptor Raiment'),
(9, 30212, 'Hood of the Corruptor', 646, 'Corruptor Raiment'),
(9, 30213, 'Leggings of the Corruptor', 646, 'Corruptor Raiment'),
(9, 30215, 'Mantle of the Corruptor', 646, 'Corruptor Raiment'),
(9, 30214, 'Robe of the Corruptor', 646, 'Corruptor Raiment');

-- Insert Armor Sets for Warrior: Destroyer Battlegear Item Set 657
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 30120, 'Destroyer Battle-Helm', 657, 'Destroyer Battlegear'),
(1, 30118, 'Destroyer Breastplate', 657, 'Destroyer Battlegear'),
(1, 30119, 'Destroyer Gauntlets', 657, 'Destroyer Battlegear'),
(1, 30121, 'Destroyer Greaves', 657, 'Destroyer Battlegear'),
(1, 30122, 'Destroyer Shoulderblades', 657, 'Destroyer Battlegear');

-- Insert Armor Sets for Warrior: Destroyer Armor Item Set 656
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 30113, 'Destroyer Chestguard', 656, 'Destroyer Armor'),
(1, 30115, 'Destroyer Greathelm', 656, 'Destroyer Armor'),
(1, 30114, 'Destroyer Handguards', 656, 'Destroyer Armor'),
(1, 30116, 'Destroyer Legguards', 656, 'Destroyer Armor'),
(1, 30117, 'Destroyer Shoulderguards', 656, 'Destroyer Armor');




-- [[ Tier 6 Set ]]





-- Insert Armor Sets for Druid: Thunderheart Regalia (Balance) Item Set 677
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 31043, 'Thunderheart Vest', 677, 'Thunderheart Regalia'),
(11, 31035, 'Thunderheart Handguards', 677, 'Thunderheart Regalia'),
(11, 31040, 'Thunderheart Headguard', 677, 'Thunderheart Regalia'),
(11, 31046, 'Thunderheart Pants', 677, 'Thunderheart Regalia'),
(11, 31049, 'Thunderheart Shoulderpads', 677, 'Thunderheart Regalia'),
(11, 34572, 'Thunderheart Footwraps', 677, 'Thunderheart Regalia'),
(11, 34446, 'Thunderheart Bands', 677, 'Thunderheart Regalia'),
(11, 34555, 'Thunderheart Cord', 677, 'Thunderheart Regalia');

-- Insert Armor Sets for Druid: Thunderheart Harness (Feral Combat) Item Set 676
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 31042, 'Thunderheart Chestguard', 676, 'Thunderheart Harness'),
(11, 31034, 'Thunderheart Gauntlets', 676, 'Thunderheart Harness'),
(11, 31039, 'Thunderheart Cover', 676, 'Thunderheart Harness'),
(11, 31044, 'Thunderheart Leggings', 676, 'Thunderheart Harness'),
(11, 31048, 'Thunderheart Pauldrons', 676, 'Thunderheart Harness'),
(11, 34556, 'Thunderheart Waistguard', 676, 'Thunderheart Harness'),
(11, 34444, 'Thunderheart Wristguards', 676, 'Thunderheart Harness'),
(11, 34573, 'Thunderheart Treads', 676, 'Thunderheart Harness');

-- Insert Armor Sets for Druid: Thunderheart Raiment (Restoration) Item Set 678
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 31041, 'Thunderheart Tunic', 678, 'Thunderheart Raiment'),
(11, 31032, 'Thunderheart Gloves', 678, 'Thunderheart Raiment'),
(11, 31037, 'Thunderheart Helmet', 678, 'Thunderheart Raiment'),
(11, 31045, 'Thunderheart Legguards', 678, 'Thunderheart Raiment'),
(11, 31047, 'Thunderheart Spaulders', 678, 'Thunderheart Raiment'),
(11, 34571, 'Thunderheart Boots', 678, 'Thunderheart Raiment'),
(11, 34445, 'Thunderheart Bracers', 678, 'Thunderheart Raiment'),
(11, 34554, 'Thunderheart Belt', 678, 'Thunderheart Raiment');

-- Insert Armor Sets for Hunter: Gronnstalker's Armor Item Set 669
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 31004, 'Gronnstalker''s Chestguard', 669, 'Gronnstalker''s Armor'),
(3, 31001, 'Gronnstalker''s Gloves', 669, 'Gronnstalker''s Armor'),
(3, 31003, 'Gronnstalker''s Helmet', 669, 'Gronnstalker''s Armor'),
(3, 31005, 'Gronnstalker''s Leggings', 669, 'Gronnstalker''s Armor'),
(3, 31006, 'Gronnstalker''s Spaulders', 669, 'Gronnstalker''s Armor'),
(3, 34549, 'Gronnstalker''s Belt', 669, 'Gronnstalker''s Armor'),
(3, 34443, 'Gronnstalker''s Bracers', 669, 'Gronnstalker''s Armor'),
(3, 34570, 'Gronnstalker''s Boots', 669, 'Gronnstalker''s Armor');

-- Insert Armor Sets for Mage: Tempest Regalia Item Set 671
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 31056, 'Cowl of the Tempest', 671, 'Tempest Regalia'),
(8, 31055, 'Gloves of the Tempest', 671, 'Tempest Regalia'),
(8, 31058, 'Leggings of the Tempest', 671, 'Tempest Regalia'),
(8, 31059, 'Mantle of the Tempest', 671, 'Tempest Regalia'),
(8, 31057, 'Robes of the Tempest', 671, 'Tempest Regalia'),
(8, 34574, 'Boots of the Tempest', 671, 'Tempest Regalia'),
(8, 34447, 'Bracers of the Tempest', 671, 'Tempest Regalia'),
(8, 34557, 'Belt of the Tempest', 671, 'Tempest Regalia');

-- Insert Armor Sets for Paladin: Lightbringer Raiment (Holy) Item Set 681
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 30992, 'Lightbringer Chestpiece', 681, 'Lightbringer Raiment'),
(2, 30983, 'Lightbringer Gloves', 681, 'Lightbringer Raiment'),
(2, 30988, 'Lightbringer Greathelm', 681, 'Lightbringer Raiment'),
(2, 30994, 'Lightbringer Leggings', 681, 'Lightbringer Raiment'),
(2, 30996, 'Lightbringer Pauldrons', 681, 'Lightbringer Raiment'),
(2, 34432, 'Lightbringer Bracers', 681, 'Lightbringer Raiment'),
(2, 34487, 'Lightbringer Belt', 681, 'Lightbringer Raiment'),
(2, 34559, 'Lightbringer Treads', 681, 'Lightbringer Raiment');

-- Insert Armor Sets for Paladin: Lightbringer Armor (Protection) Item Set 679
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 30991, 'Lightbringer Chestguard', 679, 'Lightbringer Armor'),
(2, 30987, 'Lightbringer Faceguard', 679, 'Lightbringer Armor'),
(2, 30985, 'Lightbringer Handguards', 679, 'Lightbringer Armor'),
(2, 30995, 'Lightbringer Legguards', 679, 'Lightbringer Armor'),
(2, 30998, 'Lightbringer Shoulderguards', 679, 'Lightbringer Armor'),
(2, 34488, 'Lightbringer Waistguard', 679, 'Lightbringer Armor'),
(2, 34433, 'Lightbringer Wristguards', 679, 'Lightbringer Armor'),
(2, 34560, 'Lightbringer Stompers', 679, 'Lightbringer Armor');

-- Insert Armor Sets for Paladin: Lightbringer Battlegear (Retribution) Item Set 680
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 30990, 'Lightbringer Breastplate', 680, 'Lightbringer Battlegear'),
(2, 30982, 'Lightbringer Gauntlets', 680, 'Lightbringer Battlegear'),
(2, 30993, 'Lightbringer Greaves', 680, 'Lightbringer Battlegear'),
(2, 30997, 'Lightbringer Shoulderbraces', 680, 'Lightbringer Battlegear'),
(2, 30989, 'Lightbringer War-Helm', 680, 'Lightbringer Battlegear'),
(2, 34561, 'Lightbringer Boots', 680, 'Lightbringer Battlegear'),
(2, 34431, 'Lightbringer Bands', 680, 'Lightbringer Battlegear'),
(2, 34485, 'Lightbringer Girdle', 680, 'Lightbringer Battlegear');

-- Insert Armor Sets for Priest: Vestments of Absolution (Heal) Item Set 675
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 31068, 'Breeches of Absolution', 675, 'Vestments of Absolution'),
(5, 31063, 'Cowl of Absolution', 675, 'Vestments of Absolution'),
(5, 31060, 'Gloves of Absolution', 675, 'Vestments of Absolution'),
(5, 31069, 'Mantle of Absolution', 675, 'Vestments of Absolution'),
(5, 31066, 'Vestments of Absolution', 675, 'Vestments of Absolution'),
(5, 34562, 'Boots of Absolution', 675, 'Vestments of Absolution'),
(5, 34527, 'Belt of Absolution', 675, 'Vestments of Absolution'),
(5, 34435, 'Cuffs of Absolution', 675, 'Vestments of Absolution');

-- Insert Armor Sets for Priest: Absolution Regalia (Damage) Item Set 674
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(5, 31061, 'Handguards of Absolution', 674, 'Absolution Regalia'),
(5, 31064, 'Hood of Absolution', 674, 'Absolution Regalia'),
(5, 31067, 'Leggings of Absolution', 674, 'Absolution Regalia'),
(5, 31070, 'Shoulderpads of Absolution', 674, 'Absolution Regalia'),
(5, 31065, 'Shroud of Absolution', 674, 'Absolution Regalia'),
(5, 34434, 'Bracers of Absolution', 674, 'Absolution Regalia'),
(5, 34528, 'Cord of Absolution', 674, 'Absolution Regalia'),
(5, 34563, 'Treads of Absolution', 674, 'Absolution Regalia');

-- Insert Armor Sets for Rogue: Slayer's Armor Item Set 668
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(4, 31028, 'Slayer''s Chestguard', 668, 'Slayer''s Armor'),
(4, 31026, 'Slayer''s Handguards', 668, 'Slayer''s Armor'),
(4, 31027, 'Slayer''s Helm', 668, 'Slayer''s Armor'),
(4, 31029, 'Slayer''s Legguards', 668, 'Slayer''s Armor'),
(4, 31030, 'Slayer''s Shoulderpads', 668, 'Slayer''s Armor'),
(4, 34575, 'Slayer''s Boots', 668, 'Slayer''s Armor'),
(4, 34448, 'Slayer''s Bracers', 668, 'Slayer''s Armor'),
(4, 34558, 'Slayer''s Belt', 668, 'Slayer''s Armor');


-- Insert Armor Sets for Shaman: Skyshatter Regalia (Elemental) Item Set 684
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 31017, 'Skyshatter Breastplate', 684, 'Skyshatter Regalia'),
(7, 31008, 'Skyshatter Gauntlets', 684, 'Skyshatter Regalia'),
(7, 31014, 'Skyshatter Headguard', 684, 'Skyshatter Regalia'),
(7, 31020, 'Skyshatter Legguards', 684, 'Skyshatter Regalia'),
(7, 31023, 'Skyshatter Mantle', 684, 'Skyshatter Regalia'),
(7, 34542, 'Skyshatter Cord', 684, 'Skyshatter Regalia'),
(7, 34437, 'Skyshatter Bands', 684, 'Skyshatter Regalia'),
(7, 34566, 'Skyshatter Treads', 684, 'Skyshatter Regalia');

-- Insert Armor Sets for Shaman: Skyshatter Harness (Enhancement) Item Set 682
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 31018, 'Skyshatter Tunic', 682, 'Skyshatter Harness'),
(7, 31011, 'Skyshatter Grips', 682, 'Skyshatter Harness'),
(7, 31015, 'Skyshatter Cover', 682, 'Skyshatter Harness'),
(7, 31021, 'Skyshatter Pants', 682, 'Skyshatter Harness'),
(7, 31024, 'Skyshatter Pauldrons', 682, 'Skyshatter Harness'),
(7, 34567, 'Skyshatter Greaves', 682, 'Skyshatter Harness'),
(7, 34439, 'Skyshatter Wristguards', 682, 'Skyshatter Harness'),
(7, 34545, 'Skyshatter Girdle', 682, 'Skyshatter Harness');

-- Insert Armor Sets for Shaman: Skyshatter Raiment (Restoration) Item Set 683
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(7, 31016, 'Skyshatter Chestguard', 683, 'Skyshatter Raiment'),
(7, 31007, 'Skyshatter Gloves', 683, 'Skyshatter Raiment'),
(7, 31012, 'Skyshatter Helmet', 683, 'Skyshatter Raiment'),
(7, 31019, 'Skyshatter Leggings', 683, 'Skyshatter Raiment'),
(7, 31022, 'Skyshatter Shoulderpads', 683, 'Skyshatter Raiment'),
(7, 34543, 'Skyshatter Belt', 683, 'Skyshatter Raiment'),
(7, 34438, 'Skyshatter Bracers', 683, 'Skyshatter Raiment'),
(7, 34565, 'Skyshatter Boots', 683, 'Skyshatter Raiment');

-- Insert Armor Sets for Warlock: Malefic Raiment Item Set 670
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(9, 31050, 'Gloves of the Malefic', 670, 'Malefic Raiment'),
(9, 31051, 'Hood of the Malefic', 670, 'Malefic Raiment'),
(9, 31053, 'Leggings of the Malefic', 670, 'Malefic Raiment'),
(9, 31054, 'Mantle of the Malefic', 670, 'Malefic Raiment'),
(9, 31052, 'Robe of the Malefic', 670, 'Malefic Raiment'),
(9, 34564, 'Boots of the Malefic', 670, 'Malefic Raiment'),
(9, 34436, 'Bracers of the Malefic', 670, 'Malefic Raiment'),
(9, 34541, 'Belt of the Malefic', 670, 'Malefic Raiment');

-- Insert Armor Sets for Warrior: Onslaught Battlegear (Damage) Item Set 672
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 30972, 'Onslaught Battle-Helm', 672, 'Onslaught Battlegear'),
(1, 30975, 'Onslaught Breastplate', 672, 'Onslaught Battlegear'),
(1, 30969, 'Onslaught Gauntlets', 672, 'Onslaught Battlegear'),
(1, 30977, 'Onslaught Greaves', 672, 'Onslaught Battlegear'),
(1, 30979, 'Onslaught Shoulderblades', 672, 'Onslaught Battlegear'),
(1, 34546, 'Onslaught Belt', 672, 'Onslaught Battlegear'),
(1, 34441, 'Onslaught Bracers', 672, 'Onslaught Battlegear'),
(1, 34569, 'Onslaught Treads', 672, 'Onslaught Battlegear');

-- Insert Armor Sets for Warrior: Onslaught Armor (Tank) Item Set 673
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(1, 30976, 'Onslaught Chestguard', 673, 'Onslaught Armor'),
(1, 30974, 'Onslaught Greathelm', 673, 'Onslaught Armor'),
(1, 30970, 'Onslaught Handguards', 673, 'Onslaught Armor'),
(1, 30978, 'Onslaught Legguards', 673, 'Onslaught Armor'),
(1, 30980, 'Onslaught Shoulderguards', 673, 'Onslaught Armor'),
(1, 34568, 'Onslaught Boots', 673, 'Onslaught Armor'),
(1, 34442, 'Onslaught Wristguards', 673, 'Onslaught Armor'),
(1, 34547, 'Onslaught Waistguard', 673, 'Onslaught Armor');




-- [[ Season 5 Sets ]]




-- Insert Armor Sets for Death Knight: Savage Gladiator's Desecration 768
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(6, 42654, 'Gladiator''s Dreadplate Chestpiece', 768, 'Savage Gladiator''s Desecration'),
(6, 42655, 'Gladiator''s Dreadplate Gauntlets', 768, 'Savage Gladiator''s Desecration'),
(6, 42656, 'Gladiator''s Dreadplate Helm', 768, 'Savage Gladiator''s Desecration'),
(6, 42657, 'Gladiator''s Dreadplate Legguards', 768, 'Savage Gladiator''s Desecration'),
(6, 42658, 'Gladiator''s Dreadplate Shoulders', 768, 'Savage Gladiator''s Desecration');

-- Insert Armor Sets for Death Knight: Hateful Gladiator's Desecration 38
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(6, 40781, 'Hateful Gladiator''s Dreadplate Chestpiece', 38, 'Hateful Gladiator''s Desecration'),
(6, 40803, 'Hateful Gladiator''s Dreadplate Gauntlets', 38, 'Hateful Gladiator''s Desecration'),
(6, 40820, 'Hateful Gladiator''s Dreadplate Helm', 38, 'Hateful Gladiator''s Desecration'),
(6, 40841, 'Hateful Gladiator''s Dreadplate Legguards', 38, 'Hateful Gladiator''s Desecration'),
(6, 40860, 'Hateful Gladiator''s Dreadplate Shoulders', 38, 'Hateful Gladiator''s Desecration');

-- Insert Armor Sets for Death Knight: Deadly Gladiator's Desecration 54
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(6, 40784, 'Deadly Gladiator''s Dreadplate Chestpiece', 54, 'Deadly Gladiator''s Desecration'),
(6, 40806, 'Deadly Gladiator''s Dreadplate Gauntlets', 54, 'Deadly Gladiator''s Desecration'),
(6, 40824, 'Deadly Gladiator''s Dreadplate Helm', 54, 'Deadly Gladiator''s Desecration'),
(6, 40845, 'Deadly Gladiator''s Dreadplate Legguards', 54, 'Deadly Gladiator''s Desecration'),
(6, 40863, 'Deadly Gladiator''s Dreadplate Shoulders', 54, 'Deadly Gladiator''s Desecration');

-- Insert Armor Sets for Druid: Savage Gladiator's Wildhide (Balance) 774
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 42685, 'Gladiator''s Wyrmhide Gloves', 774, 'Savage Gladiator''s Wildhide'),
(11, 42686, 'Gladiator''s Wyrmhide Helm', 774, 'Savage Gladiator''s Wildhide'),
(11, 42687, 'Gladiator''s Wyrmhide Legguards', 774, 'Savage Gladiator''s Wildhide'),
(11, 42688, 'Gladiator''s Wyrmhide Spaulders', 774, 'Savage Gladiator''s Wildhide'),
(11, 42689, 'Gladiator''s Wyrmhide Robes', 774, 'Savage Gladiator''s Wildhide');

-- Insert Armor Sets for Druid: Hateful Gladiator's Wildhide (Balance) 52
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 41291, 'Hateful Gladiator''s Wyrmhide Gloves', 52, 'Hateful Gladiator''s Wildhide'),
(11, 41325, 'Hateful Gladiator''s Wyrmhide Helm', 52, 'Hateful Gladiator''s Wildhide'),
(11, 41302, 'Hateful Gladiator''s Wyrmhide Legguards', 52, 'Hateful Gladiator''s Wildhide'),
(11, 41279, 'Hateful Gladiator''s Wyrmhide Spaulders', 52, 'Hateful Gladiator''s Wildhide'),
(11, 41314, 'Hateful Gladiator''s Wyrmhide Robes', 52, 'Hateful Gladiator''s Wildhide');

-- Insert Armor Sets for Druid: Deadly Gladiator's Wildhide (Balance) 68
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 41292, 'Deadly Gladiator''s Wyrmhide Gloves', 68, 'Deadly Gladiator''s Wildhide'),
(11, 41326, 'Deadly Gladiator''s Wyrmhide Helm', 68, 'Deadly Gladiator''s Wildhide'),
(11, 41303, 'Deadly Gladiator''s Wyrmhide Legguards', 68, 'Deadly Gladiator''s Wildhide'),
(11, 41280, 'Deadly Gladiator''s Wyrmhide Spaulders', 68, 'Deadly Gladiator''s Wildhide'),
(11, 41315, 'Deadly Gladiator''s Wyrmhide Robes', 68, 'Deadly Gladiator''s Wildhide');

-- Insert Armor Sets for Druid: Savage Gladiator's Sanctuary (Feral) 776
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 41770, 'Savage Gladiator''s Dragonhide Gloves', 776, 'Savage Gladiator''s Sanctuary'),
(11, 41675, 'Savage Gladiator''s Dragonhide Helm', 776, 'Savage Gladiator''s Sanctuary'),
(11, 41664, 'Savage Gladiator''s Dragonhide Legguards', 776, 'Savage Gladiator''s Sanctuary'),
(11, 41712, 'Savage Gladiator''s Dragonhide Spaulders', 776, 'Savage Gladiator''s Sanctuary'),
(11, 41658, 'Savage Gladiator''s Dragonhide Robes', 776, 'Savage Gladiator''s Sanctuary');

-- Insert Armor Sets for Druid: Hateful Gladiator's Sanctuary (Feral) 47
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 41771, 'Hateful Gladiator''s Dragonhide Gloves', 47, 'Hateful Gladiator''s Sanctuary'),
(11, 41676, 'Hateful Gladiator''s Dragonhide Helm', 47, 'Hateful Gladiator''s Sanctuary'),
(11, 41665, 'Hateful Gladiator''s Dragonhide Legguards', 47, 'Hateful Gladiator''s Sanctuary'),
(11, 41713, 'Hateful Gladiator''s Dragonhide Spaulders', 47, 'Hateful Gladiator''s Sanctuary'),
(11, 41659, 'Hateful Gladiator''s Dragonhide Robes', 47, 'Hateful Gladiator''s Sanctuary');

-- Insert Armor Sets for Druid: Deadly Gladiator's Sanctuary (Feral) 63
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 41772, 'Deadly Gladiator''s Dragonhide Gloves', 63, 'Deadly Gladiator''s Sanctuary'),
(11, 41677, 'Deadly Gladiator''s Dragonhide Helm', 63, 'Deadly Gladiator''s Sanctuary'),
(11, 41666, 'Deadly Gladiator''s Dragonhide Legguards', 63, 'Deadly Gladiator''s Sanctuary'),
(11, 41714, 'Deadly Gladiator''s Dragonhide Spaulders', 63, 'Deadly Gladiator''s Sanctuary'),
(11, 41660, 'Deadly Gladiator''s Dragonhide Robes', 63, 'Deadly Gladiator''s Sanctuary');

-- Insert Armor Sets for Druid: Savage Gladiator's Refuge (Restoration) 774
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 41268, 'Savage Gladiator''s Kodohide Gloves', 774, 'Savage Gladiator''s Refuge'),
(11, 41269, 'Savage Gladiator''s Kodohide Helm', 774, 'Savage Gladiator''s Refuge'),
(11, 41270, 'Savage Gladiator''s Kodohide Legguards', 774, 'Savage Gladiator''s Refuge'),
(11, 41271, 'Savage Gladiator''s Kodohide Spaulders', 774, 'Savage Gladiator''s Refuge'),
(11, 41272, 'Savage Gladiator''s Kodohide Robes', 774, 'Savage Gladiator''s Refuge');

-- Insert Armor Sets for Druid: Hateful Gladiator's Refuge (Restoration) 45
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 41284, 'Hateful Gladiator''s Kodohide Gloves', 45, 'Hateful Gladiator''s Refuge'),
(11, 41319, 'Hateful Gladiator''s Kodohide Helm', 45, 'Hateful Gladiator''s Refuge'),
(11, 41296, 'Hateful Gladiator''s Kodohide Legguards', 45, 'Hateful Gladiator''s Refuge'),
(11, 41273, 'Hateful Gladiator''s Kodohide Spaulders', 45, 'Hateful Gladiator''s Refuge'),
(11, 41308, 'Hateful Gladiator''s Kodohide Robes', 45, 'Hateful Gladiator''s Refuge');

-- Insert Armor Sets for Druid: Deadly Gladiator's Refuge (Restoration) 61
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(11, 41286, 'Deadly Gladiator''s Kodohide Gloves', 61, 'Deadly Gladiator''s Refuge'),
(11, 41320, 'Deadly Gladiator''s Kodohide Helm', 61, 'Deadly Gladiator''s Refuge'),
(11, 41297, 'Deadly Gladiator''s Kodohide Legguards', 61, 'Deadly Gladiator''s Refuge'),
(11, 41274, 'Deadly Gladiator''s Kodohide Spaulders', 61, 'Deadly Gladiator''s Refuge'),
(11, 41309, 'Deadly Gladiator''s Kodohide Robes', 61, 'Deadly Gladiator''s Refuge');

-- Insert Armor Sets for Hunter: Savage Gladiator's Pursuit 771
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 41084, 'Savage Gladiator''s Chain Armor', 771, 'Savage Gladiator''s Pursuit'),
(3, 41140, 'Savage Gladiator''s Chain Gauntlets', 771, 'Savage Gladiator''s Pursuit'),
(3, 41154, 'Savage Gladiator''s Chain Helm', 771, 'Savage Gladiator''s Pursuit'),
(3, 41202, 'Savage Gladiator''s Chain Leggings', 771, 'Savage Gladiator''s Pursuit'),
(3, 41214, 'Savage Gladiator''s Chain Spaulders', 771, 'Savage Gladiator''s Pursuit');

-- Insert Armor Sets for Hunter: Hateful Gladiator's Pursuit 42
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 41085, 'Hateful Gladiator''s Chain Armor', 42, 'Hateful Gladiator''s Pursuit'),
(3, 41141, 'Hateful Gladiator''s Chain Gauntlets', 42, 'Hateful Gladiator''s Pursuit'),
(3, 41155, 'Hateful Gladiator''s Chain Helm', 42, 'Hateful Gladiator''s Pursuit'),
(3, 41203, 'Hateful Gladiator''s Chain Leggings', 42, 'Hateful Gladiator''s Pursuit'),
(3, 41215, 'Hateful Gladiator''s Chain Spaulders', 42, 'Hateful Gladiator''s Pursuit');

-- Insert Armor Sets for Hunter: Deadly Gladiator's Pursuit 58
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(3, 41086, 'Deadly Gladiator''s Chain Armor', 58, 'Deadly Gladiator''s Pursuit'),
(3, 41142, 'Deadly Gladiator''s Chain Gauntlets', 58, 'Deadly Gladiator''s Pursuit'),
(3, 41156, 'Deadly Gladiator''s Chain Helm', 58, 'Deadly Gladiator''s Pursuit'),
(3, 41204, 'Deadly Gladiator''s Chain Leggings', 58, 'Deadly Gladiator''s Pursuit'),
(3, 41216, 'Deadly Gladiator''s Chain Spaulders', 58, 'Deadly Gladiator''s Pursuit');

-- Insert Armor Sets for Mage: Savage Gladiator's Regalia 775
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 41962, 'Savage Gladiator''s Silk Amice', 775, 'Savage Gladiator''s Regalia'),
(8, 41943, 'Savage Gladiator''s Silk Cowl', 775, 'Savage Gladiator''s Regalia'),
(8, 41968, 'Savage Gladiator''s Silk Handguards', 775, 'Savage Gladiator''s Regalia'),
(8, 41949, 'Savage Gladiator''s Silk Raiment', 775, 'Savage Gladiator''s Regalia'),
(8, 41956, 'Savage Gladiator''s Silk Trousers', 775, 'Savage Gladiator''s Regalia');

-- Insert Armor Sets for Mage: Hateful Gladiator's Regalia 46
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 41963, 'Hateful Gladiator''s Silk Amice', 46, 'Hateful Gladiator''s Regalia'),
(8, 41944, 'Hateful Gladiator''s Silk Cowl', 46, 'Hateful Gladiator''s Regalia'),
(8, 41969, 'Hateful Gladiator''s Silk Handguards', 46, 'Hateful Gladiator''s Regalia'),
(8, 41950, 'Hateful Gladiator''s Silk Raiment', 46, 'Hateful Gladiator''s Regalia'),
(8, 41957, 'Hateful Gladiator''s Silk Trousers', 46, 'Hateful Gladiator''s Regalia');

-- Insert Armor Sets for Mage: Deadly Gladiator's Regalia 62
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(8, 41964, 'Deadly Gladiator''s Silk Amice', 62, 'Deadly Gladiator''s Regalia'),
(8, 41945, 'Deadly Gladiator''s Silk Cowl', 62, 'Deadly Gladiator''s Regalia'),
(8, 41970, 'Deadly Gladiator''s Silk Handguards', 62, 'Deadly Gladiator''s Regalia'),
(8, 41951, 'Deadly Gladiator''s Silk Raiment', 62, 'Deadly Gladiator''s Regalia'),
(8, 41958, 'Deadly Gladiator''s Silk Trousers', 62, 'Deadly Gladiator''s Regalia');

-- Insert Armor Sets for Paladin: Savage Gladiator's Redemption (Holy) 773
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 40898, 'Savage Gladiator''s Ornamented Chestguard', 773, 'Savage Gladiator''s Redemption'),
(2, 40918, 'Savage Gladiator''s Ornamented Gloves', 773, 'Savage Gladiator''s Redemption'),
(2, 40930, 'Savage Gladiator''s Ornamented Headcover', 773, 'Savage Gladiator''s Redemption'),
(2, 40936, 'Savage Gladiator''s Ornamented Legplates', 773, 'Savage Gladiator''s Redemption'),
(2, 40960, 'Savage Gladiator''s Ornamented Spaulders', 773, 'Savage Gladiator''s Redemption');

-- Insert Armor Sets for Paladin: Hateful Gladiator's Redemption (Holy) 44
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 40904, 'Hateful Gladiator''s Ornamented Chestguard', 44, 'Hateful Gladiator''s Redemption'),
(2, 40925, 'Hateful Gladiator''s Ornamented Gloves', 44, 'Hateful Gladiator''s Redemption'),
(2, 40931, 'Hateful Gladiator''s Ornamented Headcover', 44, 'Hateful Gladiator''s Redemption'),
(2, 40937, 'Hateful Gladiator''s Ornamented Legplates', 44, 'Hateful Gladiator''s Redemption'),
(2, 40961, 'Hateful Gladiator''s Ornamented Spaulders', 44, 'Hateful Gladiator''s Redemption');

-- Insert Armor Sets for Paladin: Deadly Gladiator's Redemption (Holy) 60
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `name`, `item_set_id`, `set_name`) VALUES
(2, 40905, 'Deadly Gladiator''s Ornamented Chestguard', 60, 'Deadly Gladiator''s Redemption'),
(2, 40926, 'Deadly Gladiator''s Ornamented Gloves', 60, 'Deadly Gladiator''s Redemption'),
(2, 40932, 'Deadly Gladiator''s Ornamented Headcover', 60, 'Deadly Gladiator''s Redemption'),
(2, 40938, 'Deadly Gladiator''s Ornamented Legplates', 60, 'Deadly Gladiator''s Redemption'),
(2, 40962, 'Deadly Gladiator''s Ornamented Spaulders', 60, 'Deadly Gladiator''s Redemption');

-- Insert Armor Sets for Paladin: Savage Gladiator's Vindication (Retribution) Item Set 766
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 42630, 766, 'Savage Gladiator\'s Scaled Chestpiece', 'Savage Gladiator\'s Vindication'),
(2, 42631, 766, 'Savage Gladiator\'s Scaled Gauntlets', 'Savage Gladiator\'s Vindication'),
(2, 42632, 766, 'Savage Gladiator\'s Scaled Helm', 'Savage Gladiator\'s Vindication'),
(2, 42633, 766, 'Savage Gladiator\'s Scaled Legguards', 'Savage Gladiator\'s Vindication'),
(2, 42634, 766, 'Savage Gladiator\'s Scaled Shoulders', 'Savage Gladiator\'s Vindication');

-- Insert Armor Sets for Paladin: Hateful Gladiator's Vindication (Retribution) Item Set 50
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 40782, 50, 'Hateful Gladiator\'s Scaled Chestpiece', 'Hateful Gladiator\'s Vindication'),
(2, 40802, 50, 'Hateful Gladiator\'s Scaled Gauntlets', 'Hateful Gladiator\'s Vindication'),
(2, 40821, 50, 'Hateful Gladiator\'s Scaled Helm', 'Hateful Gladiator\'s Vindication'),
(2, 40842, 50, 'Hateful Gladiator\'s Scaled Legguards', 'Hateful Gladiator\'s Vindication'),
(2, 40861, 50, 'Hateful Gladiator\'s Scaled Shoulders', 'Hateful Gladiator\'s Vindication');

-- Insert Armor Sets for Paladin: Deadly Gladiator's Vindication (Retribution) Item Set 66
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 40785, 66, 'Deadly Gladiator\'s Scaled Chestpiece', 'Deadly Gladiator\'s Vindication'),
(2, 40805, 66, 'Deadly Gladiator\'s Scaled Gauntlets', 'Deadly Gladiator\'s Vindication'),
(2, 40825, 66, 'Deadly Gladiator\'s Scaled Helm', 'Deadly Gladiator\'s Vindication'),
(2, 40846, 66, 'Deadly Gladiator\'s Scaled Legguards', 'Deadly Gladiator\'s Vindication'),
(2, 40864, 66, 'Deadly Gladiator\'s Scaled Shoulders', 'Deadly Gladiator\'s Vindication');

-- Insert Armor Sets for Priest: Savage Gladiator's Investiture (Holy) Item Set 777
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 42703, 777, 'Gladiator\'s Mooncloth Gloves', 'Savage Gladiator\'s Investiture'),
(5, 42704, 777, 'Gladiator\'s Mooncloth Hood', 'Savage Gladiator\'s Investiture'),
(5, 42705, 777, 'Gladiator\'s Mooncloth Leggings', 'Savage Gladiator\'s Investiture'),
(5, 42706, 777, 'Gladiator\'s Mooncloth Mantle', 'Savage Gladiator\'s Investiture'),
(5, 42707, 777, 'Gladiator\'s Mooncloth Robe', 'Savage Gladiator\'s Investiture');

-- Insert Armor Sets for Priest: Hateful Gladiator's Investiture (Holy) Item Set 41
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 41872, 41, 'Hateful Gladiator\'s Mooncloth Gloves', 'Hateful Gladiator\'s Investiture'),
(5, 41852, 41, 'Hateful Gladiator\'s Mooncloth Hood', 'Hateful Gladiator\'s Investiture'),
(5, 41862, 41, 'Hateful Gladiator\'s Mooncloth Leggings', 'Hateful Gladiator\'s Investiture'),
(5, 41867, 41, 'Hateful Gladiator\'s Mooncloth Mantle', 'Hateful Gladiator\'s Investiture'),
(5, 41857, 41, 'Hateful Gladiator\'s Mooncloth Robe', 'Hateful Gladiator\'s Investiture');

-- Insert Armor Sets for Priest: Deadly Gladiator's Investiture (Holy) Item Set 57
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 41873, 57, 'Deadly Gladiator\'s Mooncloth Gloves', 'Deadly Gladiator\'s Investiture'),
(5, 41853, 57, 'Deadly Gladiator\'s Mooncloth Hood', 'Deadly Gladiator\'s Investiture'),
(5, 41863, 57, 'Deadly Gladiator\'s Mooncloth Leggings', 'Deadly Gladiator\'s Investiture'),
(5, 41868, 57, 'Deadly Gladiator\'s Mooncloth Mantle', 'Deadly Gladiator\'s Investiture'),
(5, 41858, 57, 'Deadly Gladiator\'s Mooncloth Robe', 'Deadly Gladiator\'s Investiture');

-- Insert Armor Sets for Priest: Savage Gladiator's Raiment (Shadow) Item Set 772
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 41937, 772, 'Savage Gladiator\'s Satin Gloves', 'Savage Gladiator\'s Raiment'),
(5, 41912, 772, 'Savage Gladiator\'s Satin Hood', 'Savage Gladiator\'s Raiment'),
(5, 41924, 772, 'Savage Gladiator\'s Satin Leggings', 'Savage Gladiator\'s Raiment'),
(5, 41930, 772, 'Savage Gladiator\'s Satin Mantle', 'Savage Gladiator\'s Raiment'),
(5, 41918, 772, 'Savage Gladiator\'s Satin Robe', 'Savage Gladiator\'s Raiment');

-- Insert Armor Sets for Priest: Hateful Gladiator's Raiment (Shadow) Item Set 43
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 41938, 43, 'Hateful Gladiator\'s Satin Gloves', 'Hateful Gladiator\'s Raiment'),
(5, 41913, 43, 'Hateful Gladiator\'s Satin Hood', 'Hateful Gladiator\'s Raiment'),
(5, 41925, 43, 'Hateful Gladiator\'s Satin Leggings', 'Hateful Gladiator\'s Raiment'),
(5, 41931, 43, 'Hateful Gladiator\'s Satin Mantle', 'Hateful Gladiator\'s Raiment'),
(5, 41919, 43, 'Hateful Gladiator\'s Satin Robe', 'Hateful Gladiator\'s Raiment');

-- Insert Armor Sets for Priest: Deadly Gladiator's Raiment (Shadow) Item Set 59
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 41939, 59, 'Deadly Gladiator\'s Satin Gloves', 'Deadly Gladiator\'s Raiment'),
(5, 41914, 59, 'Deadly Gladiator\'s Satin Hood', 'Deadly Gladiator\'s Raiment'),
(5, 41926, 59, 'Deadly Gladiator\'s Satin Leggings', 'Deadly Gladiator\'s Raiment'),
(5, 41933, 59, 'Deadly Gladiator\'s Satin Mantle', 'Deadly Gladiator\'s Raiment'),
(5, 41920, 59, 'Deadly Gladiator\'s Satin Robe', 'Deadly Gladiator\'s Raiment');

-- Insert Armor Sets for Rogue: Savage Gladiator's Vestments Item Set 778
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 41643, 778, 'Savage Gladiator\'s Leather Gloves', 'Savage Gladiator\'s Vestments'),
(4, 41644, 778, 'Savage Gladiator\'s Leather Helm', 'Savage Gladiator\'s Vestments'),
(4, 41645, 778, 'Savage Gladiator\'s Leather Legguards', 'Savage Gladiator\'s Vestments'),
(4, 41646, 778, 'Savage Gladiator\'s Leather Spaulders', 'Savage Gladiator\'s Vestments'),
(4, 41647, 778, 'Savage Gladiator\'s Leather Tunic', 'Savage Gladiator\'s Vestments');

-- Insert Armor Sets for Rogue: Hateful Gladiator's Vestments Item Set 49
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 41765, 49, 'Hateful Gladiator\'s Leather Gloves', 'Hateful Gladiator\'s Vestments'),
(4, 41670, 49, 'Hateful Gladiator\'s Leather Helm', 'Hateful Gladiator\'s Vestments'),
(4, 41653, 49, 'Hateful Gladiator\'s Leather Legguards', 'Hateful Gladiator\'s Vestments'),
(4, 41681, 49, 'Hateful Gladiator\'s Leather Spaulders', 'Hateful Gladiator\'s Vestments'),
(4, 41648, 49, 'Hateful Gladiator\'s Leather Tunic', 'Hateful Gladiator\'s Vestments');

-- Insert Armor Sets for Rogue: Deadly Gladiator's Vestments Item Set 65
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 41766, 65, 'Deadly Gladiator\'s Leather Gloves', 'Deadly Gladiator\'s Vestments'),
(4, 41671, 65, 'Deadly Gladiator\'s Leather Helm', 'Deadly Gladiator\'s Vestments'),
(4, 41654, 65, 'Deadly Gladiator\'s Leather Legguards', 'Deadly Gladiator\'s Vestments'),
(4, 41682, 65, 'Deadly Gladiator\'s Leather Spaulders', 'Deadly Gladiator\'s Vestments'),
(4, 41649, 65, 'Deadly Gladiator\'s Leather Tunic', 'Deadly Gladiator\'s Vestments');

-- Insert Armor Sets for Shaman: Savage Gladiator's Thunderfist (Elemental) Item Set 777
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 40987, 777, 'Savage Gladiator\'s Mail Armor', 'Savage Gladiator\'s Thunderfist'),
(7, 41004, 777, 'Savage Gladiator\'s Mail Gauntlets', 'Savage Gladiator\'s Thunderfist'),
(7, 41016, 777, 'Savage Gladiator\'s Mail Helm', 'Savage Gladiator\'s Thunderfist'),
(7, 41030, 777, 'Savage Gladiator\'s Mail Leggings', 'Savage Gladiator\'s Thunderfist'),
(7, 41041, 777, 'Savage Gladiator\'s Mail Spaulders', 'Savage Gladiator\'s Thunderfist');

-- Insert Armor Sets for Shaman: Hateful Gladiator's Thunderfist (Elemental) Item Set 48
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 40989, 48, 'Hateful Gladiator\'s Mail Armor', 'Hateful Gladiator\'s Thunderfist'),
(7, 41005, 48, 'Hateful Gladiator\'s Mail Gauntlets', 'Hateful Gladiator\'s Thunderfist'),
(7, 41017, 48, 'Hateful Gladiator\'s Mail Helm', 'Hateful Gladiator\'s Thunderfist'),
(7, 41031, 48, 'Hateful Gladiator\'s Mail Leggings', 'Hateful Gladiator\'s Thunderfist'),
(7, 41042, 48, 'Hateful Gladiator\'s Mail Spaulders', 'Hateful Gladiator\'s Thunderfist');

-- Insert Armor Sets for Shaman: Deadly Gladiator's Thunderfist (Elemental) Item Set 64
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 40991, 64, 'Deadly Gladiator\'s Mail Armor', 'Deadly Gladiator\'s Thunderfist'),
(7, 41006, 64, 'Deadly Gladiator\'s Mail Gauntlets', 'Deadly Gladiator\'s Thunderfist'),
(7, 41018, 64, 'Deadly Gladiator\'s Mail Helm', 'Deadly Gladiator\'s Thunderfist'),
(7, 41032, 64, 'Deadly Gladiator\'s Mail Leggings', 'Deadly Gladiator\'s Thunderfist'),
(7, 41043, 64, 'Deadly Gladiator\'s Mail Spaulders', 'Deadly Gladiator\'s Thunderfist');

-- Insert Armor Sets for Shaman: Savage Gladiator's Earthshaker (Enhancement) Item Set 768
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 41078, 768, 'Savage Gladiator\'s Linked Armor', 'Savage Gladiator\'s Earthshaker'),
(7, 41134, 768, 'Savage Gladiator\'s Linked Gauntlets', 'Savage Gladiator\'s Earthshaker'),
(7, 41148, 768, 'Savage Gladiator\'s Linked Helm', 'Savage Gladiator\'s Earthshaker'),
(7, 41160, 768, 'Savage Gladiator\'s Linked Leggings', 'Savage Gladiator\'s Earthshaker'),
(7, 41208, 768, 'Savage Gladiator\'s Linked Spaulders', 'Savage Gladiator\'s Earthshaker');

-- Insert Armor Sets for Shaman: Hateful Gladiator's Earthshaker (Enhancement) Item Set 39
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 41079, 39, 'Hateful Gladiator\'s Linked Armor', 'Hateful Gladiator\'s Earthshaker'),
(7, 41135, 39, 'Hateful Gladiator\'s Linked Gauntlets', 'Hateful Gladiator\'s Earthshaker'),
(7, 41149, 39, 'Hateful Gladiator\'s Linked Helm', 'Hateful Gladiator\'s Earthshaker'),
(7, 41162, 39, 'Hateful Gladiator\'s Linked Leggings', 'Hateful Gladiator\'s Earthshaker'),
(7, 41209, 39, 'Hateful Gladiator\'s Linked Spaulders', 'Hateful Gladiator\'s Earthshaker');

-- Insert Armor Sets for Shaman: Deadly Gladiator's Earthshaker (Enhancement) Item Set 55
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 41080, 55, 'Deadly Gladiator\'s Linked Armor', 'Deadly Gladiator\'s Earthshaker'),
(7, 41136, 55, 'Deadly Gladiator\'s Linked Gauntlets', 'Deadly Gladiator\'s Earthshaker'),
(7, 41150, 55, 'Deadly Gladiator\'s Linked Helm', 'Deadly Gladiator\'s Earthshaker'),
(7, 41198, 55, 'Deadly Gladiator\'s Linked Leggings', 'Deadly Gladiator\'s Earthshaker'),
(7, 41210, 55, 'Deadly Gladiator\'s Linked Spaulders', 'Deadly Gladiator\'s Earthshaker');

-- Insert Armor Sets for Shaman: Savage Gladiator's Wartide (Restoration) Item Set 780
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 40986, 780, 'Savage Gladiator\'s Ringmail Armor', 'Savage Gladiator\'s Wartide'),
(7, 40998, 780, 'Savage Gladiator\'s Ringmail Gauntlets', 'Savage Gladiator\'s Wartide'),
(7, 41010, 780, 'Savage Gladiator\'s Ringmail Helm', 'Savage Gladiator\'s Wartide'),
(7, 41023, 780, 'Savage Gladiator\'s Ringmail Leggings', 'Savage Gladiator\'s Wartide'),
(7, 41024, 780, 'Savage Gladiator\'s Ringmail Spaulders', 'Savage Gladiator\'s Wartide');

-- Insert Armor Sets for Shaman: Hateful Gladiator's Wartide (Restoration) Item Set 51
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 40988, 51, 'Hateful Gladiator\'s Ringmail Armor', 'Hateful Gladiator\'s Wartide'),
(7, 40999, 51, 'Hateful Gladiator\'s Ringmail Gauntlets', 'Hateful Gladiator\'s Wartide'),
(7, 41011, 51, 'Hateful Gladiator\'s Ringmail Helm', 'Hateful Gladiator\'s Wartide'),
(7, 41025, 51, 'Hateful Gladiator\'s Ringmail Leggings', 'Hateful Gladiator\'s Wartide'),
(7, 41036, 51, 'Hateful Gladiator\'s Ringmail Spaulders', 'Hateful Gladiator\'s Wartide');

-- Insert Armor Sets for Shaman: Deadly Gladiator's Wartide (Restoration) Item Set 67
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 40990, 67, 'Deadly Gladiator\'s Ringmail Armor', 'Deadly Gladiator\'s Wartide'),
(7, 41000, 67, 'Deadly Gladiator\'s Ringmail Gauntlets', 'Deadly Gladiator\'s Wartide'),
(7, 41012, 67, 'Deadly Gladiator\'s Ringmail Helm', 'Deadly Gladiator\'s Wartide'),
(7, 41026, 67, 'Deadly Gladiator\'s Ringmail Leggings', 'Deadly Gladiator\'s Wartide'),
(7, 41037, 67, 'Deadly Gladiator\'s Ringmail Spaulders', 'Deadly Gladiator\'s Wartide');

-- Insert Armor Sets for Warlock: Savage Gladiator's Felshroud Item Set 769
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 42008, 769, 'Savage Gladiator\'s Felweave Amice', 'Savage Gladiator\'s Felshroud'),
(9, 41990, 769, 'Savage Gladiator\'s Felweave Cowl', 'Savage Gladiator\'s Felshroud'),
(9, 42014, 769, 'Savage Gladiator\'s Felweave Handguards', 'Savage Gladiator\'s Felshroud'),
(9, 41996, 769, 'Savage Gladiator\'s Felweave Raiment', 'Savage Gladiator\'s Felshroud'),
(9, 42002, 769, 'Savage Gladiator\'s Felweave Trousers', 'Savage Gladiator\'s Felshroud');

-- Insert Armor Sets for Warlock: Hateful Gladiator's Felshroud Item Set 40
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 42009, 40, 'Hateful Gladiator\'s Felweave Amice', 'Hateful Gladiator\'s Felshroud'),
(9, 41991, 40, 'Hateful Gladiator\'s Felweave Cowl', 'Hateful Gladiator\'s Felshroud'),
(9, 42015, 40, 'Hateful Gladiator\'s Felweave Handguards', 'Hateful Gladiator\'s Felshroud'),
(9, 42001, 40, 'Hateful Gladiator\'s Felweave Raiment', 'Hateful Gladiator\'s Felshroud'),
(9, 42003, 40, 'Hateful Gladiator\'s Felweave Trousers', 'Hateful Gladiator\'s Felshroud');

-- Insert Armor Sets for Warlock: Deadly Gladiator's Felshroud Item Set 56
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 42010, 56, 'Deadly Gladiator\'s Felweave Amice', 'Deadly Gladiator\'s Felshroud'),
(9, 41992, 56, 'Deadly Gladiator\'s Felweave Cowl', 'Deadly Gladiator\'s Felshroud'),
(9, 42016, 56, 'Deadly Gladiator\'s Felweave Handguards', 'Deadly Gladiator\'s Felshroud'),
(9, 41997, 56, 'Deadly Gladiator\'s Felweave Raiment', 'Deadly Gladiator\'s Felshroud'),
(9, 42004, 56, 'Deadly Gladiator\'s Felweave Trousers', 'Deadly Gladiator\'s Felshroud');

-- Insert Armor Sets for Warrior: Savage Gladiator's Battlegear Item Set 766
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 40778, 766, 'Savage Gladiator\'s Plate Chestpiece', 'Savage Gladiator\'s Battlegear'),
(1, 40797, 766, 'Savage Gladiator\'s Plate Gauntlets', 'Savage Gladiator\'s Battlegear'),
(1, 40816, 766, 'Savage Gladiator\'s Plate Helm', 'Savage Gladiator\'s Battlegear'),
(1, 40836, 766, 'Savage Gladiator\'s Plate Legguards', 'Savage Gladiator\'s Battlegear'),
(1, 40856, 766, 'Savage Gladiator\'s Plate Shoulders', 'Savage Gladiator\'s Battlegear');

-- Insert Armor Sets for Warrior: Hateful Gladiator's Battlegear Item Set 37
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 40783, 37, 'Hateful Gladiator\'s Plate Chestpiece', 'Hateful Gladiator\'s Battlegear'),
(1, 40801, 37, 'Hateful Gladiator\'s Plate Gauntlets', 'Hateful Gladiator\'s Battlegear'),
(1, 40819, 37, 'Hateful Gladiator\'s Plate Helm', 'Hateful Gladiator\'s Battlegear'),
(1, 40840, 37, 'Hateful Gladiator\'s Plate Legguards', 'Hateful Gladiator\'s Battlegear'),
(1, 40859, 37, 'Hateful Gladiator\'s Plate Shoulders', 'Hateful Gladiator\'s Battlegear');

-- Insert Armor Sets for Warrior: Deadly Gladiator's Battlegear Item Set 53
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 40786, 53, 'Deadly Gladiator\'s Plate Chestpiece', 'Deadly Gladiator\'s Battlegear'),
(1, 40804, 53, 'Deadly Gladiator\'s Plate Gauntlets', 'Deadly Gladiator\'s Battlegear'),
(1, 40823, 53, 'Deadly Gladiator\'s Plate Helm', 'Deadly Gladiator\'s Battlegear'),
(1, 40844, 53, 'Deadly Gladiator\'s Plate Legguards', 'Deadly Gladiator\'s Battlegear'),
(1, 40862, 53, 'Deadly Gladiator\'s Plate Shoulders', 'Deadly Gladiator\'s Battlegear');




-- [[ Season 6 Sets ]]




-- Insert Armor Sets for Druid: Furious Gladiator's Sanctuary (Feral) Item Set 98
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 41773, 98, 'Furious Gladiator\'s Dragonhide Gloves', 'Furious Gladiator\'s Sanctuary'),
(11, 41678, 98, 'Furious Gladiator\'s Dragonhide Helm', 'Furious Gladiator\'s Sanctuary'),
(11, 41667, 98, 'Furious Gladiator\'s Dragonhide Legguards', 'Furious Gladiator\'s Sanctuary'),
(11, 41715, 98, 'Furious Gladiator\'s Dragonhide Spaulders', 'Furious Gladiator\'s Sanctuary'),
(11, 41661, 98, 'Furious Gladiator\'s Dragonhide Robes', 'Furious Gladiator\'s Sanctuary');

-- Insert Armor Sets for Druid: Furious Gladiator's Wildhide (Balance) Item Set 103
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 41293, 103, 'Furious Gladiator\'s Wyrmhide Gloves', 'Furious Gladiator\'s Wildhide'),
(11, 41327, 103, 'Furious Gladiator\'s Wyrmhide Helm', 'Furious Gladiator\'s Wildhide'),
(11, 41304, 103, 'Furious Gladiator\'s Wyrmhide Legguards', 'Furious Gladiator\'s Wildhide'),
(11, 41281, 103, 'Furious Gladiator\'s Wyrmhide Spaulders', 'Furious Gladiator\'s Wildhide'),
(11, 41316, 103, 'Furious Gladiator\'s Wyrmhide Robes', 'Furious Gladiator\'s Wildhide');

-- Insert Armor Sets for Druid: Furious Gladiator's Refuge (Restoration) Item Set 96
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 41287, 96, 'Furious Gladiator\'s Kodohide Gloves', 'Furious Gladiator\'s Refuge'),
(11, 41321, 96, 'Furious Gladiator\'s Kodohide Helm', 'Furious Gladiator\'s Refuge'),
(11, 41298, 96, 'Furious Gladiator\'s Kodohide Legguards', 'Furious Gladiator\'s Refuge'),
(11, 41275, 96, 'Furious Gladiator\'s Kodohide Spaulders', 'Furious Gladiator\'s Refuge'),
(11, 41310, 96, 'Furious Gladiator\'s Kodohide Robes', 'Furious Gladiator\'s Refuge');

-- Insert Armor Sets for Hunter: Furious Gladiator's Pursuit Item Set 93
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(3, 41087, 93, 'Furious Gladiator\'s Chain Armor', 'Furious Gladiator\'s Pursuit'),
(3, 41143, 93, 'Furious Gladiator\'s Chain Gauntlets', 'Furious Gladiator\'s Pursuit'),
(3, 41157, 93, 'Furious Gladiator\'s Chain Helm', 'Furious Gladiator\'s Pursuit'),
(3, 41205, 93, 'Furious Gladiator\'s Chain Leggings', 'Furious Gladiator\'s Pursuit'),
(3, 41217, 93, 'Furious Gladiator\'s Chain Spaulders', 'Furious Gladiator\'s Pursuit');

-- Insert Armor Sets for Mage: Furious Gladiator's Regalia Item Set 97
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 41965, 97, 'Furious Gladiator\'s Silk Amice', 'Furious Gladiator\'s Regalia'),
(8, 41946, 97, 'Furious Gladiator\'s Silk Cowl', 'Furious Gladiator\'s Regalia'),
(8, 41971, 97, 'Furious Gladiator\'s Silk Handguards', 'Furious Gladiator\'s Regalia'),
(8, 41953, 97, 'Furious Gladiator\'s Silk Raiment', 'Furious Gladiator\'s Regalia'),
(8, 41959, 97, 'Furious Gladiator\'s Silk Trousers', 'Furious Gladiator\'s Regalia');

-- Insert Armor Sets for Paladin: Furious Gladiator's Vindication (Retribution) Item Set 101
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 40788, 101, 'Furious Gladiator\'s Scaled Chestpiece', 'Furious Gladiator\'s Vindication'),
(2, 40808, 101, 'Furious Gladiator\'s Scaled Gauntlets', 'Furious Gladiator\'s Vindication'),
(2, 40828, 101, 'Furious Gladiator\'s Scaled Helm', 'Furious Gladiator\'s Vindication'),
(2, 40849, 101, 'Furious Gladiator\'s Scaled Legguards', 'Furious Gladiator\'s Vindication'),
(2, 40869, 101, 'Furious Gladiator\'s Scaled Shoulders', 'Furious Gladiator\'s Vindication');

-- Insert Armor Sets for Paladin: Furious Gladiator's Redemption (Holy) Item Set 95
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 40907, 95, 'Furious Gladiator\'s Ornamented Chestguard', 'Furious Gladiator\'s Redemption'),
(2, 40927, 95, 'Furious Gladiator\'s Ornamented Gloves', 'Furious Gladiator\'s Redemption'),
(2, 40933, 95, 'Furious Gladiator\'s Ornamented Headcover', 'Furious Gladiator\'s Redemption'),
(2, 40939, 95, 'Furious Gladiator\'s Ornamented Legplates', 'Furious Gladiator\'s Redemption'),
(2, 40963, 95, 'Furious Gladiator\'s Ornamented Spaulders', 'Furious Gladiator\'s Redemption');

-- Insert Armor Sets for Priest: Furious Gladiator's Raiment (Shadow) Item Set 94
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 41940, 94, 'Furious Gladiator\'s Satin Gloves', 'Furious Gladiator\'s Raiment'),
(5, 41915, 94, 'Furious Gladiator\'s Satin Hood', 'Furious Gladiator\'s Raiment'),
(5, 41927, 94, 'Furious Gladiator\'s Satin Leggings', 'Furious Gladiator\'s Raiment'),
(5, 41934, 94, 'Furious Gladiator\'s Satin Mantle', 'Furious Gladiator\'s Raiment'),
(5, 41921, 94, 'Furious Gladiator\'s Satin Robe', 'Furious Gladiator\'s Raiment');

-- Insert Armor Sets for Priest: Furious Gladiator's Investiture (Holy) Item Set 92
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 41874, 92, 'Furious Gladiator\'s Mooncloth Gloves', 'Furious Gladiator\'s Investiture'),
(5, 41854, 92, 'Furious Gladiator\'s Mooncloth Hood', 'Furious Gladiator\'s Investiture'),
(5, 41864, 92, 'Furious Gladiator\'s Mooncloth Leggings', 'Furious Gladiator\'s Investiture'),
(5, 41869, 92, 'Furious Gladiator\'s Mooncloth Mantle', 'Furious Gladiator\'s Investiture'),
(5, 41859, 92, 'Furious Gladiator\'s Mooncloth Robe', 'Furious Gladiator\'s Investiture');

-- Insert Armor Sets for Rogue: Furious Gladiator's Vestments Item Set 100
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 41767, 100, 'Furious Gladiator\'s Leather Gloves', 'Furious Gladiator\'s Vestments'),
(4, 41672, 100, 'Furious Gladiator\'s Leather Helm', 'Furious Gladiator\'s Vestments'),
(4, 41655, 100, 'Furious Gladiator\'s Leather Legguards', 'Furious Gladiator\'s Vestments'),
(4, 41683, 100, 'Furious Gladiator\'s Leather Spaulders', 'Furious Gladiator\'s Vestments'),
(4, 41650, 100, 'Furious Gladiator\'s Leather Tunic', 'Furious Gladiator\'s Vestments');

-- Insert Armor Sets for Shaman: Furious Gladiator's Earthshaker Item Set 90
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 41081, 90, 'Furious Gladiator\'s Linked Armor', 'Furious Gladiator\'s Earthshaker'),
(7, 41137, 90, 'Furious Gladiator\'s Linked Gauntlets', 'Furious Gladiator\'s Earthshaker'),
(7, 41151, 90, 'Furious Gladiator\'s Linked Helm', 'Furious Gladiator\'s Earthshaker'),
(7, 41199, 90, 'Furious Gladiator\'s Linked Leggings', 'Furious Gladiator\'s Earthshaker'),
(7, 41211, 90, 'Furious Gladiator\'s Linked Spaulders', 'Furious Gladiator\'s Earthshaker');

-- Insert Armor Sets for Shaman: Furious Gladiator's Thunderfist Item Set 99
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 40993, 99, 'Furious Gladiator\'s Mail Armor', 'Furious Gladiator\'s Thunderfist'),
(7, 41007, 99, 'Furious Gladiator\'s Mail Gauntlets', 'Furious Gladiator\'s Thunderfist'),
(7, 41019, 99, 'Furious Gladiator\'s Mail Helm', 'Furious Gladiator\'s Thunderfist'),
(7, 41033, 99, 'Furious Gladiator\'s Mail Leggings', 'Furious Gladiator\'s Thunderfist'),
(7, 41044, 99, 'Furious Gladiator\'s Mail Spaulders', 'Furious Gladiator\'s Thunderfist');

-- Insert Armor Sets for Shaman: Furious Gladiator's Wartide Item Set 102
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 40992, 102, 'Furious Gladiator\'s Ringmail Armor', 'Furious Gladiator\'s Wartide'),
(7, 41001, 102, 'Furious Gladiator\'s Ringmail Gauntlets', 'Furious Gladiator\'s Wartide'),
(7, 41013, 102, 'Furious Gladiator\'s Ringmail Helm', 'Furious Gladiator\'s Wartide'),
(7, 41027, 102, 'Furious Gladiator\'s Ringmail Leggings', 'Furious Gladiator\'s Wartide'),
(7, 41038, 102, 'Furious Gladiator\'s Ringmail Spaulders', 'Furious Gladiator\'s Wartide');

-- Insert Armor Sets for Warlock: Furious Gladiator's Felshroud Item Set 91
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 42011, 91, 'Furious Gladiator\'s Felweave Amice', 'Furious Gladiator\'s Felshroud'),
(9, 41993, 91, 'Furious Gladiator\'s Felweave Cowl', 'Furious Gladiator\'s Felshroud'),
(9, 42017, 91, 'Furious Gladiator\'s Felweave Handguards', 'Furious Gladiator\'s Felshroud'),
(9, 41998, 91, 'Furious Gladiator\'s Felweave Raiment', 'Furious Gladiator\'s Felshroud'),
(9, 42005, 91, 'Furious Gladiator\'s Felweave Trousers', 'Furious Gladiator\'s Felshroud');

-- Insert Armor Sets for Warrior: Furious Gladiator's Battlegear Item Set 88
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 40789, 88, 'Furious Gladiator\'s Plate Chestpiece', 'Furious Gladiator\'s Battlegear'),
(1, 40807, 88, 'Furious Gladiator\'s Plate Gauntlets', 'Furious Gladiator\'s Battlegear'),
(1, 40826, 88, 'Furious Gladiator\'s Plate Helm', 'Furious Gladiator\'s Battlegear'),
(1, 40847, 88, 'Furious Gladiator\'s Plate Legguards', 'Furious Gladiator\'s Battlegear'),
(1, 40866, 88, 'Furious Gladiator\'s Plate Shoulders', 'Furious Gladiator\'s Battlegear');





-- [[ Season 7 Sets ]]





-- Insert Armor Sets for Druid: Relentless Gladiator's Sanctuary (Feral) Item Set 222
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 41774, 222, 'Relentless Gladiator\'s Dragonhide Gloves', 'Relentless Gladiator\'s Sanctuary'),
(11, 41679, 222, 'Relentless Gladiator\'s Dragonhide Helm', 'Relentless Gladiator\'s Sanctuary'),
(11, 41668, 222, 'Relentless Gladiator\'s Dragonhide Legguards', 'Relentless Gladiator\'s Sanctuary'),
(11, 41716, 222, 'Relentless Gladiator\'s Dragonhide Spaulders', 'Relentless Gladiator\'s Sanctuary'),
(11, 41662, 222, 'Relentless Gladiator\'s Dragonhide Robes', 'Relentless Gladiator\'s Sanctuary');

-- Insert Armor Sets for Druid: Relentless Gladiator's Wildhide (Balance) Item Set 221
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 41294, 221, 'Relentless Gladiator\'s Wyrmhide Gloves', 'Relentless Gladiator\'s Wildhide'),
(11, 41328, 221, 'Relentless Gladiator\'s Wyrmhide Helm', 'Relentless Gladiator\'s Wildhide'),
(11, 41305, 221, 'Relentless Gladiator\'s Wyrmhide Legguards', 'Relentless Gladiator\'s Wildhide'),
(11, 41282, 221, 'Relentless Gladiator\'s Wyrmhide Spaulders', 'Relentless Gladiator\'s Wildhide'),
(11, 41317, 221, 'Relentless Gladiator\'s Wyrmhide Robes', 'Relentless Gladiator\'s Wildhide');

-- Insert Armor Sets for Druid: Relentless Gladiator's Refuge (Restoration) Item Set 2203
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 41288, 2203, 'Relentless Gladiator\'s Kodohide Gloves', 'Relentless Gladiator\'s Refuge'),
(11, 41322, 2203, 'Relentless Gladiator\'s Kodohide Helm', 'Relentless Gladiator\'s Refuge'),
(11, 41299, 2203, 'Relentless Gladiator\'s Kodohide Legguards', 'Relentless Gladiator\'s Refuge'),
(11, 41276, 2203, 'Relentless Gladiator\'s Kodohide Spaulders', 'Relentless Gladiator\'s Refuge'),
(11, 41311, 2203, 'Relentless Gladiator\'s Kodohide Robes', 'Relentless Gladiator\'s Refuge');

-- Insert Armor Sets for Hunter: Relentless Gladiator's Pursuit Item Set 219
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(3, 41088, 219, 'Relentless Gladiator\'s Chain Armor', 'Relentless Gladiator\'s Pursuit'),
(3, 41144, 219, 'Relentless Gladiator\'s Chain Gauntlets', 'Relentless Gladiator\'s Pursuit'),
(3, 41158, 219, 'Relentless Gladiator\'s Chain Helm', 'Relentless Gladiator\'s Pursuit'),
(3, 41206, 219, 'Relentless Gladiator\'s Chain Leggings', 'Relentless Gladiator\'s Pursuit'),
(3, 41218, 219, 'Relentless Gladiator\'s Chain Spaulders', 'Relentless Gladiator\'s Pursuit');

-- Insert Armor Sets for Mage: Relentless Gladiator's Regalia Item Set 226
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 41966, 226, 'Relentless Gladiator\'s Silk Amice', 'Relentless Gladiator\'s Regalia'),
(8, 41947, 226, 'Relentless Gladiator\'s Silk Cowl', 'Relentless Gladiator\'s Regalia'),
(8, 41972, 226, 'Relentless Gladiator\'s Silk Handguards', 'Relentless Gladiator\'s Regalia'),
(8, 41954, 226, 'Relentless Gladiator\'s Silk Raiment', 'Relentless Gladiator\'s Regalia'),
(8, 41960, 226, 'Relentless Gladiator\'s Silk Trousers', 'Relentless Gladiator\'s Regalia');

-- Insert Armor Sets for Paladin: Relentless Gladiator's Vindication (Retribution) Item Set 213
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 40792, 213, 'Relentless Gladiator\'s Scaled Chestpiece', 'Relentless Gladiator\'s Vindication'),
(2, 40812, 213, 'Relentless Gladiator\'s Scaled Gauntlets', 'Relentless Gladiator\'s Vindication'),
(2, 40831, 213, 'Relentless Gladiator\'s Scaled Helm', 'Relentless Gladiator\'s Vindication'),
(2, 40852, 213, 'Relentless Gladiator\'s Scaled Legguards', 'Relentless Gladiator\'s Vindication'),
(2, 40872, 213, 'Relentless Gladiator\'s Scaled Shoulders', 'Relentless Gladiator\'s Vindication');

-- Insert Armor Sets for Paladin: Relentless Gladiator's Redemption (Holy) Item Set 214
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 40910, 214, 'Relentless Gladiator\'s Ornamented Chestguard', 'Relentless Gladiator\'s Redemption'),
(2, 40928, 214, 'Relentless Gladiator\'s Ornamented Gloves', 'Relentless Gladiator\'s Redemption'),
(2, 40934, 214, 'Relentless Gladiator\'s Ornamented Headcover', 'Relentless Gladiator\'s Redemption'),
(2, 40940, 214, 'Relentless Gladiator\'s Ornamented Legplates', 'Relentless Gladiator\'s Redemption'),
(2, 40964, 214, 'Relentless Gladiator\'s Ornamented Spaulders', 'Relentless Gladiator\'s Redemption');

-- Insert Armor Sets for Priest: Relentless Gladiator's Raiment (Shadow) Item Set 225
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 41941, 225, 'Relentless Gladiator\'s Satin Gloves', 'Relentless Gladiator\'s Raiment'),
(5, 41916, 225, 'Relentless Gladiator\'s Satin Hood', 'Relentless Gladiator\'s Raiment'),
(5, 41928, 225, 'Relentless Gladiator\'s Satin Leggings', 'Relentless Gladiator\'s Raiment'),
(5, 41935, 225, 'Relentless Gladiator\'s Satin Mantle', 'Relentless Gladiator\'s Raiment'),
(5, 41922, 225, 'Relentless Gladiator\'s Satin Robe', 'Relentless Gladiator\'s Raiment');

-- Insert Armor Sets for Priest: Relentless Gladiator's Investiture (Holy) Item Set 224
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 41875, 224, 'Relentless Gladiator\'s Mooncloth Gloves', 'Relentless Gladiator\'s Investiture'),
(5, 41855, 224, 'Relentless Gladiator\'s Mooncloth Hood', 'Relentless Gladiator\'s Investiture'),
(5, 41865, 224, 'Relentless Gladiator\'s Mooncloth Leggings', 'Relentless Gladiator\'s Investiture'),
(5, 41870, 224, 'Relentless Gladiator\'s Mooncloth Mantle', 'Relentless Gladiator\'s Investiture'),
(5, 41860, 224, 'Relentless Gladiator\'s Mooncloth Robe', 'Relentless Gladiator\'s Investiture');

-- Insert Armor Sets for Rogue: Relentless Gladiator's Vestments Item Set 223
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 41768, 223, 'Relentless Gladiator\'s Leather Gloves', 'Relentless Gladiator\'s Vestments'),
(4, 41673, 223, 'Relentless Gladiator\'s Leather Helm', 'Relentless Gladiator\'s Vestments'),
(4, 41656, 223, 'Relentless Gladiator\'s Leather Legguards', 'Relentless Gladiator\'s Vestments'),
(4, 41684, 223, 'Relentless Gladiator\'s Leather Spaulders', 'Relentless Gladiator\'s Vestments'),
(4, 41651, 223, 'Relentless Gladiator\'s Leather Tunic', 'Relentless Gladiator\'s Vestments');

-- Insert Armor Sets for Shaman: Relentless Gladiator's Earthshaker Item Set 217
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 41082, 217, 'Relentless Gladiator\'s Linked Armor', 'Relentless Gladiator\'s Earthshaker'),
(7, 41138, 217, 'Relentless Gladiator\'s Linked Gauntlets', 'Relentless Gladiator\'s Earthshaker'),
(7, 41152, 217, 'Relentless Gladiator\'s Linked Helm', 'Relentless Gladiator\'s Earthshaker'),
(7, 41200, 217, 'Relentless Gladiator\'s Linked Leggings', 'Relentless Gladiator\'s Earthshaker'),
(7, 41212, 217, 'Relentless Gladiator\'s Linked Spaulders', 'Relentless Gladiator\'s Earthshaker');

-- Insert Armor Sets for Shaman: Relentless Gladiator's Thunderfist Item Set 216
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 40995, 216, 'Relentless Gladiator\'s Mail Armor', 'Relentless Gladiator\'s Thunderfist'),
(7, 41008, 216, 'Relentless Gladiator\'s Mail Gauntlets', 'Relentless Gladiator\'s Thunderfist'),
(7, 41020, 216, 'Relentless Gladiator\'s Mail Helm', 'Relentless Gladiator\'s Thunderfist'),
(7, 41034, 216, 'Relentless Gladiator\'s Mail Leggings', 'Relentless Gladiator\'s Thunderfist'),
(7, 41045, 216, 'Relentless Gladiator\'s Mail Spaulders', 'Relentless Gladiator\'s Thunderfist');

-- Insert Armor Sets for Shaman: Relentless Gladiator's Wartide Item Set 218
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 40994, 218, 'Relentless Gladiator\'s Ringmail Armor', 'Relentless Gladiator\'s Wartide'),
(7, 41002, 218, 'Relentless Gladiator\'s Ringmail Gauntlets', 'Relentless Gladiator\'s Wartide'),
(7, 41014, 218, 'Relentless Gladiator\'s Ringmail Helm', 'Relentless Gladiator\'s Wartide'),
(7, 41028, 218, 'Relentless Gladiator\'s Ringmail Leggings', 'Relentless Gladiator\'s Wartide'),
(7, 41039, 218, 'Relentless Gladiator\'s Ringmail Spaulders', 'Relentless Gladiator\'s Wartide');

-- Insert Armor Sets for Warlock: Relentless Gladiator's Felshroud Item Set 227
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 42012, 227, 'Relentless Gladiator\'s Felweave Amice', 'Relentless Gladiator\'s Felshroud'),
(9, 41994, 227, 'Relentless Gladiator\'s Felweave Cowl', 'Relentless Gladiator\'s Felshroud'),
(9, 42018, 227, 'Relentless Gladiator\'s Felweave Handguards', 'Relentless Gladiator\'s Felshroud'),
(9, 41999, 227, 'Relentless Gladiator\'s Felweave Raiment', 'Relentless Gladiator\'s Felshroud'),
(9, 42006, 227, 'Relentless Gladiator\'s Felweave Trousers', 'Relentless Gladiator\'s Felshroud');

-- Insert Armor Sets for Warrior: Relentless Gladiator's Battlegear Item Set 212
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 40790, 212, 'Relentless Gladiator\'s Plate Chestpiece', 'Relentless Gladiator\'s Battlegear'),
(1, 40810, 212, 'Relentless Gladiator\'s Plate Gauntlets', 'Relentless Gladiator\'s Battlegear'),
(1, 40829, 212, 'Relentless Gladiator\'s Plate Helm', 'Relentless Gladiator\'s Battlegear'),
(1, 40850, 212, 'Relentless Gladiator\'s Plate Legguards', 'Relentless Gladiator\'s Battlegear'),
(1, 40870, 212, 'Relentless Gladiator\'s Plate Shoulders', 'Relentless Gladiator\'s Battlegear');





-- [[ Season 8 Sets ]]





-- Insert Armor Sets for Druid: Wrathful Gladiator's Sanctuary (Feral) Item Set 276
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 51426, 276, 'Wrathful Gladiator\'s Dragonhide Gloves', 'Wrathful Gladiator\'s Sanctuary'),
(11, 51427, 276, 'Wrathful Gladiator\'s Dragonhide Helm', 'Wrathful Gladiator\'s Sanctuary'),
(11, 51428, 276, 'Wrathful Gladiator\'s Dragonhide Legguards', 'Wrathful Gladiator\'s Sanctuary'),
(11, 51430, 276, 'Wrathful Gladiator\'s Dragonhide Spaulders', 'Wrathful Gladiator\'s Sanctuary'),
(11, 51425, 276, 'Wrathful Gladiator\'s Dragonhide Robes', 'Wrathful Gladiator\'s Sanctuary');

-- Insert Armor Sets for Druid: Wrathful Gladiator's Wildhide (Balance) Item Set 275
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 51434, 275, 'Wrathful Gladiator\'s Wyrmhide Gloves', 'Wrathful Gladiator\'s Wildhide'),
(11, 51435, 275, 'Wrathful Gladiator\'s Wyrmhide Helm', 'Wrathful Gladiator\'s Wildhide'),
(11, 51436, 275, 'Wrathful Gladiator\'s Wyrmhide Legguards', 'Wrathful Gladiator\'s Wildhide'),
(11, 51438, 275, 'Wrathful Gladiator\'s Wyrmhide Spaulders', 'Wrathful Gladiator\'s Wildhide'),
(11, 51433, 275, 'Wrathful Gladiator\'s Wyrmhide Robes', 'Wrathful Gladiator\'s Wildhide');

-- Insert Armor Sets for Druid: Wrathful Gladiator's Refuge (Restoration) Item Set 274
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 51420, 274, 'Wrathful Gladiator\'s Kodohide Gloves', 'Wrathful Gladiator\'s Refuge'),
(11, 51421, 274, 'Wrathful Gladiator\'s Kodohide Helm', 'Wrathful Gladiator\'s Refuge'),
(11, 51422, 274, 'Wrathful Gladiator\'s Kodohide Legguards', 'Wrathful Gladiator\'s Refuge'),
(11, 51424, 274, 'Wrathful Gladiator\'s Kodohide Spaulders', 'Wrathful Gladiator\'s Refuge'),
(11, 51419, 274, 'Wrathful Gladiator\'s Kodohide Robes', 'Wrathful Gladiator\'s Refuge');

-- Insert Armor Sets for Hunter: Wrathful Gladiator's Pursuit Item Set 273
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(3, 51458, 273, 'Wrathful Gladiator\'s Chain Armor', 'Wrathful Gladiator\'s Pursuit'),
(3, 51459, 273, 'Wrathful Gladiator\'s Chain Gauntlets', 'Wrathful Gladiator\'s Pursuit'),
(3, 51460, 273, 'Wrathful Gladiator\'s Chain Helm', 'Wrathful Gladiator\'s Pursuit'),
(3, 51461, 273, 'Wrathful Gladiator\'s Chain Leggings', 'Wrathful Gladiator\'s Pursuit'),
(3, 51462, 273, 'Wrathful Gladiator\'s Chain Spaulders', 'Wrathful Gladiator\'s Pursuit');

-- Insert Armor Sets for Mage: Wrathful Gladiator's Regalia Item Set 280
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 51467, 280, 'Wrathful Gladiator\'s Silk Amice', 'Wrathful Gladiator\'s Regalia'),
(8, 51465, 280, 'Wrathful Gladiator\'s Silk Cowl', 'Wrathful Gladiator\'s Regalia'),
(8, 51464, 280, 'Wrathful Gladiator\'s Silk Handguards', 'Wrathful Gladiator\'s Regalia'),
(8, 51463, 280, 'Wrathful Gladiator\'s Silk Raiment', 'Wrathful Gladiator\'s Regalia'),
(8, 51466, 280, 'Wrathful Gladiator\'s Silk Trousers', 'Wrathful Gladiator\'s Regalia');

-- Insert Armor Sets for Paladin: Wrathful Gladiator's Vindication (Retribution) Item Set 267
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 51474, 267, 'Wrathful Gladiator\'s Scaled Chestpiece', 'Wrathful Gladiator\'s Vindication'),
(2, 51475, 267, 'Wrathful Gladiator\'s Scaled Gauntlets', 'Wrathful Gladiator\'s Vindication'),
(2, 51476, 267, 'Wrathful Gladiator\'s Scaled Helm', 'Wrathful Gladiator\'s Vindication'),
(2, 51477, 267, 'Wrathful Gladiator\'s Scaled Legguards', 'Wrathful Gladiator\'s Vindication'),
(2, 51479, 267, 'Wrathful Gladiator\'s Scaled Shoulders', 'Wrathful Gladiator\'s Vindication');

-- Insert Armor Sets for Paladin: Wrathful Gladiator's Redemption (Holy) Item Set 268
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 51468, 268, 'Wrathful Gladiator\'s Ornamented Chestguard', 'Wrathful Gladiator\'s Redemption'),
(2, 51469, 268, 'Wrathful Gladiator\'s Ornamented Gloves', 'Wrathful Gladiator\'s Redemption'),
(2, 51470, 268, 'Wrathful Gladiator\'s Ornamented Headcover', 'Wrathful Gladiator\'s Redemption'),
(2, 51471, 268, 'Wrathful Gladiator\'s Ornamented Legplates', 'Wrathful Gladiator\'s Redemption'),
(2, 51473, 268, 'Wrathful Gladiator\'s Ornamented Spaulders', 'Wrathful Gladiator\'s Redemption');

-- Insert Armor Sets for Priest: Wrathful Gladiator's Raiment (Shadow) Item Set 279
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 51488, 279, 'Wrathful Gladiator\'s Satin Gloves', 'Wrathful Gladiator\'s Raiment'),
(5, 51489, 279, 'Wrathful Gladiator\'s Satin Hood', 'Wrathful Gladiator\'s Raiment'),
(5, 51490, 279, 'Wrathful Gladiator\'s Satin Leggings', 'Wrathful Gladiator\'s Raiment'),
(5, 51491, 279, 'Wrathful Gladiator\'s Satin Mantle', 'Wrathful Gladiator\'s Raiment'),
(5, 51487, 279, 'Wrathful Gladiator\'s Satin Robe', 'Wrathful Gladiator\'s Raiment');

-- Insert Armor Sets for Priest: Wrathful Gladiator's Investiture (Holy) Item Set 278
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 51483, 278, 'Wrathful Gladiator\'s Mooncloth Gloves', 'Wrathful Gladiator\'s Investiture'),
(5, 51484, 278, 'Wrathful Gladiator\'s Mooncloth Hood', 'Wrathful Gladiator\'s Investiture'),
(5, 51485, 278, 'Wrathful Gladiator\'s Mooncloth Leggings', 'Wrathful Gladiator\'s Investiture'),
(5, 51486, 278, 'Wrathful Gladiator\'s Mooncloth Mantle', 'Wrathful Gladiator\'s Investiture'),
(5, 51482, 278, 'Wrathful Gladiator\'s Mooncloth Robe', 'Wrathful Gladiator\'s Investiture');

-- Insert Armor Sets for Rogue: Wrathful Gladiator's Vestments Item Set 277
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 51493, 277, 'Wrathful Gladiator\'s Leather Gloves', 'Wrathful Gladiator\'s Vestments'),
(4, 51494, 277, 'Wrathful Gladiator\'s Leather Helm', 'Wrathful Gladiator\'s Vestments'),
(4, 51495, 277, 'Wrathful Gladiator\'s Leather Legguards', 'Wrathful Gladiator\'s Vestments'),
(4, 51496, 277, 'Wrathful Gladiator\'s Leather Spaulders', 'Wrathful Gladiator\'s Vestments'),
(4, 51492, 277, 'Wrathful Gladiator\'s Leather Tunic', 'Wrathful Gladiator\'s Vestments');

-- Insert Armor Sets for Shaman: Wrathful Gladiator's Earthshaker Item Set 271
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 51503, 271, 'Wrathful Gladiator\'s Linked Armor', 'Wrathful Gladiator\'s Earthshaker'),
(7, 51504, 271, 'Wrathful Gladiator\'s Linked Gauntlets', 'Wrathful Gladiator\'s Earthshaker'),
(7, 51505, 271, 'Wrathful Gladiator\'s Linked Helm', 'Wrathful Gladiator\'s Earthshaker'),
(7, 51506, 271, 'Wrathful Gladiator\'s Linked Leggings', 'Wrathful Gladiator\'s Earthshaker'),
(7, 51508, 271, 'Wrathful Gladiator\'s Linked Spaulders', 'Wrathful Gladiator\'s Earthshaker');

-- Insert Armor Sets for Shaman: Wrathful Gladiator's Thunderfist Item Set 270
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 51509, 270, 'Wrathful Gladiator\'s Mail Armor', 'Wrathful Gladiator\'s Thunderfist'),
(7, 51510, 270, 'Wrathful Gladiator\'s Mail Gauntlets', 'Wrathful Gladiator\'s Thunderfist'),
(7, 51511, 270, 'Wrathful Gladiator\'s Mail Helm', 'Wrathful Gladiator\'s Thunderfist'),
(7, 51512, 270, 'Wrathful Gladiator\'s Mail Leggings', 'Wrathful Gladiator\'s Thunderfist'),
(7, 51514, 270, 'Wrathful Gladiator\'s Mail Spaulders', 'Wrathful Gladiator\'s Thunderfist');

-- Insert Armor Sets for Shaman: Wrathful Gladiator's Wartide Item Set 272
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 51497, 272, 'Wrathful Gladiator\'s Ringmail Armor', 'Wrathful Gladiator\'s Wartide'),
(7, 51498, 272, 'Wrathful Gladiator\'s Ringmail Gauntlets', 'Wrathful Gladiator\'s Wartide'),
(7, 51499, 272, 'Wrathful Gladiator\'s Ringmail Helm', 'Wrathful Gladiator\'s Wartide'),
(7, 51500, 272, 'Wrathful Gladiator\'s Ringmail Leggings', 'Wrathful Gladiator\'s Wartide'),
(7, 51502, 272, 'Wrathful Gladiator\'s Ringmail Spaulders', 'Wrathful Gladiator\'s Wartide');

-- Insert Armor Sets for Warlock: Wrathful Gladiator's Felshroud Item Set 281
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 51540, 281, 'Wrathful Gladiator\'s Felweave Amice', 'Wrathful Gladiator\'s Felshroud'),
(9, 51538, 281, 'Wrathful Gladiator\'s Felweave Cowl', 'Wrathful Gladiator\'s Felshroud'),
(9, 51537, 281, 'Wrathful Gladiator\'s Felweave Handguards', 'Wrathful Gladiator\'s Felshroud'),
(9, 51536, 281, 'Wrathful Gladiator\'s Felweave Raiment', 'Wrathful Gladiator\'s Felshroud'),
(9, 51539, 281, 'Wrathful Gladiator\'s Felweave Trousers', 'Wrathful Gladiator\'s Felshroud');

-- Insert Armor Sets for Warrior: Wrathful Gladiator's Battlegear Item Set 266
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 51541, 266, 'Wrathful Gladiator\'s Plate Chestpiece', 'Wrathful Gladiator\'s Battlegear'),
(1, 51542, 266, 'Wrathful Gladiator\'s Plate Gauntlets', 'Wrathful Gladiator\'s Battlegear'),
(1, 51543, 266, 'Wrathful Gladiator\'s Plate Helm', 'Wrathful Gladiator\'s Battlegear'),
(1, 51544, 266, 'Wrathful Gladiator\'s Plate Legguards', 'Wrathful Gladiator\'s Battlegear'),
(1, 51545, 266, 'Wrathful Gladiator\'s Plate Shoulders', 'Wrathful Gladiator\'s Battlegear');





-- [[ Tier 7 Sets ]]





-- Insert Armor Sets for Death Knight: Scourgeborne Battlegear Item Set 792
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 43809, 792, 'Scourgeborne Battleplate', 'Scourgeborne Battlegear'),
(6, 43813, 792, 'Scourgeborne Gauntlets', 'Scourgeborne Battlegear'),
(6, 43815, 792, 'Scourgeborne Helmet', 'Scourgeborne Battlegear'),
(6, 43817, 792, 'Scourgeborne Legplates', 'Scourgeborne Battlegear'),
(6, 43819, 792, 'Scourgeborne Shoulderplates', 'Scourgeborne Battlegear');

-- Insert Armor Sets for Death Knight: Valorous Scourgeborne Battlegear Item Set 23
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 40550, 23, 'Valorous Scourgeborne Battleplate', 'Valorous Scourgeborne Battlegear'),
(6, 40552, 23, 'Valorous Scourgeborne Gauntlets', 'Valorous Scourgeborne Battlegear'),
(6, 40554, 23, 'Valorous Scourgeborne Helmet', 'Valorous Scourgeborne Battlegear'),
(6, 40556, 23, 'Valorous Scourgeborne Legplates', 'Valorous Scourgeborne Battlegear'),
(6, 40557, 23, 'Valorous Scourgeborne Shoulderplates', 'Valorous Scourgeborne Battlegear');

-- Insert Armor Sets for Death Knight: Heroes' Scourgeborne Plate Item Set 753
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 39623, 753, 'Heroes\' Scourgeborne Chestguard', 'Heroes\' Scourgeborne Plate'),
(6, 39625, 753, 'Heroes\' Scourgeborne Faceguard', 'Heroes\' Scourgeborne Plate'),
(6, 39624, 753, 'Heroes\' Scourgeborne Handguards', 'Heroes\' Scourgeborne Plate'),
(6, 39626, 753, 'Heroes\' Scourgeborne Legguards', 'Heroes\' Scourgeborne Plate'),
(6, 39627, 753, 'Heroes\' Scourgeborne Pauldrons', 'Heroes\' Scourgeborne Plate');

-- Insert Armor Sets for Death Knight: Valorous Scourgeborne Plate Item Set 24
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 40559, 24, 'Valorous Scourgeborne Chestguard', 'Valorous Scourgeborne Plate'),
(6, 40565, 24, 'Valorous Scourgeborne Faceguard', 'Valorous Scourgeborne Plate'),
(6, 40563, 24, 'Valorous Scourgeborne Handguards', 'Valorous Scourgeborne Plate'),
(6, 40567, 24, 'Valorous Scourgeborne Legguards', 'Valorous Scourgeborne Plate'),
(6, 40568, 24, 'Valorous Scourgeborne Pauldrons', 'Valorous Scourgeborne Plate');

-- Insert Armor Sets for Druid: Heroes' Dreamwalker Garb Item Set 760
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 39545, 760, 'Heroes\' Dreamwalker Cover', 'Heroes\' Dreamwalker Garb'),
(11, 39544, 760, 'Heroes\' Dreamwalker Gloves', 'Heroes\' Dreamwalker Garb'),
(11, 39548, 760, 'Heroes\' Dreamwalker Mantle', 'Heroes\' Dreamwalker Garb'),
(11, 39546, 760, 'Heroes\' Dreamwalker Trousers', 'Heroes\' Dreamwalker Garb'),
(11, 39547, 760, 'Heroes\' Dreamwalker Vestments', 'Heroes\' Dreamwalker Garb');

-- Insert Armor Sets for Druid: Valorous Dreamwalker Garb Item Set 30
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 40467, 30, 'Valorous Dreamwalker Cover', 'Valorous Dreamwalker Garb'),
(11, 40466, 30, 'Valorous Dreamwalker Gloves', 'Valorous Dreamwalker Garb'),
(11, 40470, 30, 'Valorous Dreamwalker Mantle', 'Valorous Dreamwalker Garb'),
(11, 40468, 30, 'Valorous Dreamwalker Trousers', 'Valorous Dreamwalker Garb'),
(11, 40469, 30, 'Valorous Dreamwalker Vestments', 'Valorous Dreamwalker Garb');

-- Insert Armor Sets for Druid: Heroes' Dreamwalker Battlegear Item Set 758
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 39557, 758, 'Heroes\' Dreamwalker Handgrips', 'Heroes\' Dreamwalker Battlegear'),
(11, 39553, 758, 'Heroes\' Dreamwalker Headguard', 'Heroes\' Dreamwalker Battlegear'),
(11, 39555, 758, 'Heroes\' Dreamwalker Legguards', 'Heroes\' Dreamwalker Battlegear'),
(11, 39554, 758, 'Heroes\' Dreamwalker Raiments', 'Heroes\' Dreamwalker Battlegear'),
(11, 39556, 758, 'Heroes\' Dreamwalker Shoulderpads', 'Heroes\' Dreamwalker Battlegear');

-- Insert Armor Sets for Druid: Valorous Dreamwalker Battlegear Item Set 28
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 40472, 28, 'Valorous Dreamwalker Handgrips', 'Valorous Dreamwalker Battlegear'),
(11, 40473, 28, 'Valorous Dreamwalker Headguard', 'Valorous Dreamwalker Battlegear'),
(11, 40493, 28, 'Valorous Dreamwalker Legguards', 'Valorous Dreamwalker Battlegear'),
(11, 40471, 28, 'Valorous Dreamwalker Raiments', 'Valorous Dreamwalker Battlegear'),
(11, 40494, 28, 'Valorous Dreamwalker Shoulderpads', 'Valorous Dreamwalker Battlegear');

-- Insert Armor Sets for Druid: Heroes' Dreamwalker Regalia Item Set 759
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 39543, 759, 'Heroes\' Dreamwalker Handguards', 'Heroes\' Dreamwalker Regalia'),
(11, 39531, 759, 'Heroes\' Dreamwalker Headpiece', 'Heroes\' Dreamwalker Regalia'),
(11, 39539, 759, 'Heroes\' Dreamwalker Leggings', 'Heroes\' Dreamwalker Regalia'),
(11, 39542, 759, 'Heroes\' Dreamwalker Spaulders', 'Heroes\' Dreamwalker Regalia'),
(11, 39538, 759, 'Heroes\' Dreamwalker Robe', 'Heroes\' Dreamwalker Regalia');

-- Insert Armor Sets for Druid: Valorous Dreamwalker Regalia Item Set 29
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 40460, 29, 'Valorous Dreamwalker Handguards', 'Valorous Dreamwalker Regalia'),
(11, 40461, 29, 'Valorous Dreamwalker Headpiece', 'Valorous Dreamwalker Regalia'),
(11, 40462, 29, 'Valorous Dreamwalker Leggings', 'Valorous Dreamwalker Regalia'),
(11, 40465, 29, 'Valorous Dreamwalker Spaulders', 'Valorous Dreamwalker Regalia'),
(11, 40463, 29, 'Valorous Dreamwalker Robe', 'Valorous Dreamwalker Regalia');

-- Insert Armor Sets for Hunter: Heroes' Cryptstalker Battlegear Item Set 754
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(3, 39582, 754, 'Heroes\' Cryptstalker Handguards', 'Heroes\' Cryptstalker Battlegear'),
(3, 39578, 754, 'Heroes\' Cryptstalker Headpiece', 'Heroes\' Cryptstalker Battlegear'),
(3, 39580, 754, 'Heroes\' Cryptstalker Legguards', 'Heroes\' Cryptstalker Battlegear'),
(3, 39581, 754, 'Heroes\' Cryptstalker Spaulders', 'Heroes\' Cryptstalker Battlegear'),
(3, 39579, 754, 'Heroes\' Cryptstalker Tunic', 'Heroes\' Cryptstalker Battlegear');

-- Insert Armor Sets for Hunter: Valorous Cryptstalker Battlegear Item Set 25
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(3, 40504, 25, 'Valorous Cryptstalker Handguards', 'Valorous Cryptstalker Battlegear'),
(3, 40505, 25, 'Valorous Cryptstalker Headpiece', 'Valorous Cryptstalker Battlegear'),
(3, 40506, 25, 'Valorous Cryptstalker Legguards', 'Valorous Cryptstalker Battlegear'),
(3, 40507, 25, 'Valorous Cryptstalker Spaulders', 'Valorous Cryptstalker Battlegear'),
(3, 40503, 25, 'Valorous Cryptstalker Tunic', 'Valorous Cryptstalker Battlegear');

-- Insert Armor Sets for Mage: Heroes' Frostfire Garb Item Set 763
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 39491, 763, 'Heroes\' Frostfire Circlet', 'Heroes\' Frostfire Garb'),
(8, 39495, 763, 'Heroes\' Frostfire Gloves', 'Heroes\' Frostfire Garb'),
(8, 39493, 763, 'Heroes\' Frostfire Leggings', 'Heroes\' Frostfire Garb'),
(8, 39492, 763, 'Heroes\' Frostfire Robe', 'Heroes\' Frostfire Garb'),
(8, 39494, 763, 'Heroes\' Frostfire Shoulderpads', 'Heroes\' Frostfire Garb');

-- Insert Armor Sets for Mage: Valorous Frostfire Garb Item Set 33
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 40416, 33, 'Valorous Frostfire Circlet', 'Valorous Frostfire Garb'),
(8, 40415, 33, 'Valorous Frostfire Gloves', 'Valorous Frostfire Garb'),
(8, 40417, 33, 'Valorous Frostfire Leggings', 'Valorous Frostfire Garb'),
(8, 40418, 33, 'Valorous Frostfire Robe', 'Valorous Frostfire Garb'),
(8, 40419, 33, 'Valorous Frostfire Shoulderpads', 'Valorous Frostfire Garb');

-- Insert Armor Sets for Paladin: Heroes' Redemption Regalia Item Set 750
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 39632, 750, 'Heroes\' Redemption Gloves', 'Heroes\' Redemption Regalia'),
(2, 39630, 750, 'Heroes\' Redemption Greaves', 'Heroes\' Redemption Regalia'),
(2, 39628, 750, 'Heroes\' Redemption Headpiece', 'Heroes\' Redemption Regalia'),
(2, 39631, 750, 'Heroes\' Redemption Spaulders', 'Heroes\' Redemption Regalia'),
(2, 39629, 750, 'Heroes\' Redemption Tunic', 'Heroes\' Redemption Regalia');

-- Insert Armor Sets for Paladin: Valorous Redemption Regalia Item Set 21
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 40570, 21, 'Valorous Redemption Gloves', 'Valorous Redemption Regalia'),
(2, 40572, 21, 'Valorous Redemption Greaves', 'Valorous Redemption Regalia'),
(2, 40571, 21, 'Valorous Redemption Headpiece', 'Valorous Redemption Regalia'),
(2, 40573, 21, 'Valorous Redemption Spaulders', 'Valorous Redemption Regalia'),
(2, 40569, 21, 'Valorous Redemption Tunic', 'Valorous Redemption Regalia');

-- Insert Armor Sets for Paladin: Heroes' Redemption Plate Item Set 751
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 39638, 751, 'Heroes\' Redemption Breastplate', 'Heroes\' Redemption Plate'),
(2, 39640, 751, 'Heroes\' Redemption Faceguard', 'Heroes\' Redemption Plate'),
(2, 39639, 751, 'Heroes\' Redemption Handguards', 'Heroes\' Redemption Plate'),
(2, 39641, 751, 'Heroes\' Redemption Legguards', 'Heroes\' Redemption Plate'),
(2, 39642, 751, 'Heroes\' Redemption Shoulderguards', 'Heroes\' Redemption Plate');

-- Insert Armor Sets for Paladin: Valorous Redemption Plate Item Set 22
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 40579, 22, 'Valorous Redemption Breastplate', 'Valorous Redemption Plate'),
(2, 40581, 22, 'Valorous Redemption Faceguard', 'Valorous Redemption Plate'),
(2, 40580, 22, 'Valorous Redemption Handguards', 'Valorous Redemption Plate'),
(2, 40583, 22, 'Valorous Redemption Legguards', 'Valorous Redemption Plate'),
(2, 40584, 22, 'Valorous Redemption Shoulderguards', 'Valorous Redemption Plate');

-- Insert Armor Sets for Paladin: Heroes' Redemption Battlegear Item Set 749
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 39633, 749, 'Heroes\' Redemption Chestpiece', 'Heroes\' Redemption Battlegear'),
(2, 39634, 749, 'Heroes\' Redemption Gauntlets', 'Heroes\' Redemption Battlegear'),
(2, 39635, 749, 'Heroes\' Redemption Helm', 'Heroes\' Redemption Battlegear'),
(2, 39636, 749, 'Heroes\' Redemption Legplates', 'Heroes\' Redemption Battlegear'),
(2, 39637, 749, 'Heroes\' Redemption Shoulderplates', 'Heroes\' Redemption Battlegear');

-- Insert Armor Sets for Paladin: Valorous Redemption Battlegear Item Set 20
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 40574, 20, 'Valorous Redemption Chestpiece', 'Valorous Redemption Battlegear'),
(2, 40575, 20, 'Valorous Redemption Gauntlets', 'Valorous Redemption Battlegear'),
(2, 40576, 20, 'Valorous Redemption Helm', 'Valorous Redemption Battlegear'),
(2, 40577, 20, 'Valorous Redemption Legplates', 'Valorous Redemption Battlegear'),
(2, 40578, 20, 'Valorous Redemption Shoulderplates', 'Valorous Redemption Battlegear');

-- Insert Armor Sets for Priest: Heroes' Regalia of Faith Item Set 764
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 39514, 764, 'Heroes\' Crown of Faith', 'Heroes\' Regalia of Faith'),
(5, 39519, 764, 'Heroes\' Gloves of Faith', 'Heroes\' Regalia of Faith'),
(5, 39517, 764, 'Heroes\' Leggings of Faith', 'Heroes\' Regalia of Faith'),
(5, 39515, 764, 'Heroes\' Robe of Faith', 'Heroes\' Regalia of Faith'),
(5, 39518, 764, 'Heroes\' Shoulderpads of Faith', 'Heroes\' Regalia of Faith');

-- Insert Armor Sets for Priest: Valorous Regalia of Faith Item Set 34
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 40447, 34, 'Valorous Crown of Faith', 'Valorous Regalia of Faith'),
(5, 40445, 34, 'Valorous Gloves of Faith', 'Valorous Regalia of Faith'),
(5, 40448, 34, 'Valorous Leggings of Faith', 'Valorous Regalia of Faith'),
(5, 40449, 34, 'Valorous Robe of Faith', 'Valorous Regalia of Faith'),
(5, 40450, 34, 'Valorous Shoulderpads of Faith', 'Valorous Regalia of Faith');

-- Insert Armor Sets for Priest: Heroes' Garb of Faith Item Set 765
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 39521, 765, 'Heroes\' Circlet of Faith', 'Heroes\' Garb of Faith'),
(5, 39530, 765, 'Heroes\' Handwraps of Faith', 'Heroes\' Garb of Faith'),
(5, 39529, 765, 'Heroes\' Mantle of Faith', 'Heroes\' Garb of Faith'),
(5, 39528, 765, 'Heroes\' Pants of Faith', 'Heroes\' Garb of Faith'),
(5, 39523, 765, 'Heroes\' Raiments of Faith', 'Heroes\' Garb of Faith');

-- Insert Armor Sets for Priest: Valorous Garb of Faith Item Set 35
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 40456, 35, 'Valorous Circlet of Faith', 'Valorous Garb of Faith'),
(5, 40454, 35, 'Valorous Handwraps of Faith', 'Valorous Garb of Faith'),
(5, 40459, 35, 'Valorous Mantle of Faith', 'Valorous Garb of Faith'),
(5, 40457, 35, 'Valorous Pants of Faith', 'Valorous Garb of Faith'),
(5, 40458, 35, 'Valorous Raiments of Faith', 'Valorous Garb of Faith');

-- Insert Armor Sets for Rogue: Heroes' Bonescythe Battlegear Item Set 761
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 39558, 761, 'Heroes\' Bonescythe Breastplate', 'Heroes\' Bonescythe Battlegear'),
(4, 39560, 761, 'Heroes\' Bonescythe Gauntlets', 'Heroes\' Bonescythe Battlegear'),
(4, 39561, 761, 'Heroes\' Bonescythe Helmet', 'Heroes\' Bonescythe Battlegear'),
(4, 39564, 761, 'Heroes\' Bonescythe Legplates', 'Heroes\' Bonescythe Battlegear'),
(4, 39565, 761, 'Heroes\' Bonescythe Pauldrons', 'Heroes\' Bonescythe Battlegear');

-- Insert Armor Sets for Rogue: Valorous Bonescythe Battlegear Item Set 31
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 40495, 31, 'Valorous Bonescythe Breastplate', 'Valorous Bonescythe Battlegear'),
(4, 40496, 31, 'Valorous Bonescythe Gauntlets', 'Valorous Bonescythe Battlegear'),
(4, 40499, 31, 'Valorous Bonescythe Helmet', 'Valorous Bonescythe Battlegear'),
(4, 40500, 31, 'Valorous Bonescythe Legplates', 'Valorous Bonescythe Battlegear'),
(4, 40502, 31, 'Valorous Bonescythe Pauldrons', 'Valorous Bonescythe Battlegear');

-- Insert Armor Sets for Shaman: Heroes' Earthshatter Garb Item Set 756
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 39593, 756, 'Heroes\' Earthshatter Gloves', 'Heroes\' Earthshatter Garb'),
(7, 39592, 756, 'Heroes\' Earthshatter Hauberk', 'Heroes\' Earthshatter Garb'),
(7, 39594, 756, 'Heroes\' Earthshatter Helm', 'Heroes\' Earthshatter Garb'),
(7, 39595, 756, 'Heroes\' Earthshatter Kilt', 'Heroes\' Earthshatter Garb'),
(7, 39596, 756, 'Heroes\' Earthshatter Shoulderpads', 'Heroes\' Earthshatter Garb');

-- Insert Armor Sets for Shaman: Valorous Earthshatter Garb Item Set 26
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 40515, 26, 'Valorous Earthshatter Gloves', 'Valorous Earthshatter Garb'),
(7, 40514, 26, 'Valorous Earthshatter Hauberk', 'Valorous Earthshatter Garb'),
(7, 40516, 26, 'Valorous Earthshatter Helm', 'Valorous Earthshatter Garb'),
(7, 40517, 26, 'Valorous Earthshatter Kilt', 'Valorous Earthshatter Garb'),
(7, 40518, 26, 'Valorous Earthshatter Shoulderpads', 'Valorous Earthshatter Garb');

-- Insert Armor Sets for Shaman: Heroes' Earthshatter Battlegear Item Set 755
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 39597, 755, 'Heroes\' Earthshatter Chestguard', 'Heroes\' Earthshatter Battlegear'),
(7, 39602, 755, 'Heroes\' Earthshatter Faceguard', 'Heroes\' Earthshatter Battlegear'),
(7, 39601, 755, 'Heroes\' Earthshatter Grips', 'Heroes\' Earthshatter Battlegear'),
(7, 39604, 755, 'Heroes\' Earthshatter Shoulderguards', 'Heroes\' Earthshatter Battlegear'),
(7, 39603, 755, 'Heroes\' Earthshatter War-Kilt', 'Heroes\' Earthshatter Battlegear');

-- Insert Armor Sets for Shaman: Valorous Earthshatter Battlegear Item Set 36
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 40523, 36, 'Valorous Earthshatter Chestguard', 'Valorous Earthshatter Battlegear'),
(7, 40521, 36, 'Valorous Earthshatter Faceguard', 'Valorous Earthshatter Battlegear'),
(7, 40520, 36, 'Valorous Earthshatter Grips', 'Valorous Earthshatter Battlegear'),
(7, 40524, 36, 'Valorous Earthshatter Shoulderguards', 'Valorous Earthshatter Battlegear'),
(7, 40522, 36, 'Valorous Earthshatter War-Kilt', 'Valorous Earthshatter Battlegear');

-- Insert Armor Sets for Shaman: Heroes' Earthshatter Regalia Item Set 757
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 39591, 757, 'Heroes\' Earthshatter Handguards', 'Heroes\' Earthshatter Regalia'),
(7, 39583, 757, 'Heroes\' Earthshatter Headpiece', 'Heroes\' Earthshatter Regalia'),
(7, 39589, 757, 'Heroes\' Earthshatter Legguards', 'Heroes\' Earthshatter Regalia'),
(7, 39590, 757, 'Heroes\' Earthshatter Spaulders', 'Heroes\' Earthshatter Regalia'),
(7, 39588, 757, 'Heroes\' Earthshatter Tunic', 'Heroes\' Earthshatter Regalia');

-- Insert Armor Sets for Shaman: Valorous Earthshatter Regalia Item Set 27
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 40509, 27, 'Valorous Earthshatter Handguards', 'Valorous Earthshatter Regalia'),
(7, 40510, 27, 'Valorous Earthshatter Headpiece', 'Valorous Earthshatter Regalia'),
(7, 40512, 27, 'Valorous Earthshatter Legguards', 'Valorous Earthshatter Regalia'),
(7, 40513, 27, 'Valorous Earthshatter Spaulders', 'Valorous Earthshatter Regalia'),
(7, 40508, 27, 'Valorous Earthshatter Tunic', 'Valorous Earthshatter Regalia');

-- Insert Armor Sets for Warlock: Heroes' Plagueheart Garb Item Set 762
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 39496, 762, 'Heroes\' Plagueheart Circlet', 'Heroes\' Plagueheart Garb'),
(9, 39500, 762, 'Heroes\' Plagueheart Gloves', 'Heroes\' Plagueheart Garb'),
(9, 39498, 762, 'Heroes\' Plagueheart Leggings', 'Heroes\' Plagueheart Garb'),
(9, 39497, 762, 'Heroes\' Plagueheart Robe', 'Heroes\' Plagueheart Garb'),
(9, 39499, 762, 'Heroes\' Plagueheart Shoulderpads', 'Heroes\' Plagueheart Garb');

-- Insert Armor Sets for Warlock: Valorous Plagueheart Garb Item Set 32
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 40421, 32, 'Valorous Plagueheart Circlet', 'Valorous Plagueheart Garb'),
(9, 40420, 32, 'Valorous Plagueheart Gloves', 'Valorous Plagueheart Garb'),
(9, 40422, 32, 'Valorous Plagueheart Leggings', 'Valorous Plagueheart Garb'),
(9, 40423, 32, 'Valorous Plagueheart Robe', 'Valorous Plagueheart Garb'),
(9, 40424, 32, 'Valorous Plagueheart Shoulderpads', 'Valorous Plagueheart Garb');

-- Insert Armor Sets for Warrior: Heroes' Dreadnaught Battlegear Item Set 748
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 39606, 748, 'Heroes\' Dreadnaught Battleplate', 'Heroes\' Dreadnaught Battlegear'),
(1, 39605, 748, 'Heroes\' Dreadnaught Helmet', 'Heroes\' Dreadnaught Battlegear'),
(1, 39607, 748, 'Heroes\' Dreadnaught Legplates', 'Heroes\' Dreadnaught Battlegear'),
(1, 39609, 748, 'Heroes\' Dreadnaught Gauntlets', 'Heroes\' Dreadnaught Battlegear'),
(1, 39608, 748, 'Heroes\' Dreadnaught Shoulderplates', 'Heroes\' Dreadnaught Battlegear');

-- Insert Armor Sets for Warrior: Valorous Dreadnaught Battlegear Item Set 19
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 40525, 19, 'Valorous Dreadnaught Battleplate', 'Valorous Dreadnaught Battlegear'),
(1, 40528, 19, 'Valorous Dreadnaught Helmet', 'Valorous Dreadnaught Battlegear'),
(1, 40529, 19, 'Valorous Dreadnaught Legplates', 'Valorous Dreadnaught Battlegear'),
(1, 40527, 19, 'Valorous Dreadnaught Gauntlets', 'Valorous Dreadnaught Battlegear'),
(1, 40530, 19, 'Valorous Dreadnaught Shoulderplates', 'Valorous Dreadnaught Battlegear');

-- Insert Armor Sets for Warrior: Heroes' Dreadnaught Plate Item Set 747
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 39611, 747, 'Heroes\' Dreadnaught Breastplate', 'Heroes\' Dreadnaught Plate'),
(1, 39610, 747, 'Heroes\' Dreadnaught Greathelm', 'Heroes\' Dreadnaught Plate'),
(1, 39622, 747, 'Heroes\' Dreadnaught Handguards', 'Heroes\' Dreadnaught Plate'),
(1, 39612, 747, 'Heroes\' Dreadnaught Legguards', 'Heroes\' Dreadnaught Plate'),
(1, 39613, 747, 'Heroes\' Dreadnaught Pauldrons', 'Heroes\' Dreadnaught Plate');

-- Insert Armor Sets for Warrior: Valorous Dreadnaught Plate Item Set 18
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 40544, 18, 'Valorous Dreadnaught Breastplate', 'Valorous Dreadnaught Plate'),
(1, 40546, 18, 'Valorous Dreadnaught Greathelm', 'Valorous Dreadnaught Plate'),
(1, 40545, 18, 'Valorous Dreadnaught Handguards', 'Valorous Dreadnaught Plate'),
(1, 40547, 18, 'Valorous Dreadnaught Legguards', 'Valorous Dreadnaught Plate'),
(1, 40548, 18, 'Valorous Dreadnaught Pauldrons', 'Valorous Dreadnaught Plate');





-- [[ Tier 8 Sets ]]




-- Insert Armor Sets for Valorous Darkruned Battlegear Item Set 796
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 45340, 796, 'Valorous Darkruned Battleplate', 'Valorous Darkruned Battlegear'),
(6, 45341, 796, 'Valorous Darkruned Gauntlets', 'Valorous Darkruned Battlegear'),
(6, 45342, 796, 'Valorous Darkruned Helmet', 'Valorous Darkruned Battlegear'),
(6, 45343, 796, 'Valorous Darkruned Legplates', 'Valorous Darkruned Battlegear'),
(6, 45344, 796, 'Valorous Darkruned Shoulderplates', 'Valorous Darkruned Battlegear');

-- Insert Armor Sets for Conqueror's Darkruned Battlegear Item Set 83
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 46111, 83, 'Conqueror\'s Darkruned Battleplate', 'Conqueror\'s Darkruned Battlegear'),
(6, 46113, 83, 'Conqueror\'s Darkruned Gauntlets', 'Conqueror\'s Darkruned Battlegear'),
(6, 46115, 83, 'Conqueror\'s Darkruned Helmet', 'Conqueror\'s Darkruned Battlegear'),
(6, 46116, 83, 'Conqueror\'s Darkruned Legplates', 'Conqueror\'s Darkruned Battlegear'),
(6, 46117, 83, 'Conqueror\'s Darkruned Shoulderplates', 'Conqueror\'s Darkruned Battlegear');

-- Insert Armor Sets for Valorous Darkruned Plate Item Set 797
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 45335, 797, 'Valorous Darkruned Chestguard', 'Valorous Darkruned Plate'),
(6, 45336, 797, 'Valorous Darkruned Faceguard', 'Valorous Darkruned Plate'),
(6, 45337, 797, 'Valorous Darkruned Handguards', 'Valorous Darkruned Plate'),
(6, 45338, 797, 'Valorous Darkruned Legguards', 'Valorous Darkruned Plate'),
(6, 45339, 797, 'Valorous Darkruned Pauldrons', 'Valorous Darkruned Plate');

-- Insert Armor Sets for Conqueror's Darkruned Plate Item Set 84
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 46118, 84, 'Conqueror\'s Darkruned Chestguard', 'Conqueror\'s Darkruned Plate'),
(6, 46120, 84, 'Conqueror\'s Darkruned Faceguard', 'Conqueror\'s Darkruned Plate'),
(6, 46119, 84, 'Conqueror\'s Darkruned Handguards', 'Conqueror\'s Darkruned Plate'),
(6, 46121, 84, 'Conqueror\'s Darkruned Legguards', 'Conqueror\'s Darkruned Plate'),
(6, 46122, 84, 'Conqueror\'s Darkruned Pauldrons', 'Conqueror\'s Darkruned Plate');

-- Insert Armor Sets for Valorous Nightsong Battlegear Item Set 827
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 45355, 827, 'Valorous Nightsong Handgrips', 'Valorous Nightsong Battlegear'),
(11, 45356, 827, 'Valorous Nightsong Headguard', 'Valorous Nightsong Battlegear'),
(11, 45357, 827, 'Valorous Nightsong Legguards', 'Valorous Nightsong Battlegear'),
(11, 45358, 827, 'Valorous Nightsong Raiments', 'Valorous Nightsong Battlegear'),
(11, 45359, 827, 'Valorous Nightsong Shoulderpads', 'Valorous Nightsong Battlegear');

-- Insert Armor Sets for Conqueror's Nightsong Battlegear Item Set 76
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 46158, 76, 'Conqueror\'s Nightsong Handgrips', 'Conqueror\'s Nightsong Battlegear'),
(11, 46161, 76, 'Conqueror\'s Nightsong Headguard', 'Conqueror\'s Nightsong Battlegear'),
(11, 46160, 76, 'Conqueror\'s Nightsong Legguards', 'Conqueror\'s Nightsong Battlegear'),
(11, 46159, 76, 'Conqueror\'s Nightsong Raiments', 'Conqueror\'s Nightsong Battlegear'),
(11, 46157, 76, 'Conqueror\'s Nightsong Shoulderpads', 'Conqueror\'s Nightsong Battlegear');

-- Insert Armor Sets for Valorous Nightsong Regalia Item Set 791
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 45345, 791, 'Valorous Nightsong Handguards', 'Valorous Nightsong Regalia'),
(11, 45346, 791, 'Valorous Nightsong Headpiece', 'Valorous Nightsong Regalia'),
(11, 45347, 791, 'Valorous Nightsong Leggings', 'Valorous Nightsong Regalia'),
(11, 45348, 791, 'Valorous Nightsong Robe', 'Valorous Nightsong Regalia'),
(11, 45349, 791, 'Valorous Nightsong Spaulders', 'Valorous Nightsong Regalia');

-- Insert Armor Sets for Conqueror's Nightsong Regalia Item Set 827
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 46260, 827, 'Conqueror\'s Nightsong Handguards', 'Conqueror\'s Nightsong Regalia'),
(11, 46262, 827, 'Conqueror\'s Nightsong Headpiece', 'Conqueror\'s Nightsong Regalia'),
(11, 46265, 827, 'Conqueror\'s Nightsong Leggings', 'Conqueror\'s Nightsong Regalia'),
(11, 46267, 827, 'Conqueror\'s Nightsong Robe', 'Conqueror\'s Nightsong Regalia'),
(11, 46269, 827, 'Conqueror\'s Nightsong Spaulders', 'Conqueror\'s Nightsong Regalia');

-- Insert Armor Sets for Valorous Scourgestalker Battlegear Item Set 800
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(3, 45360, 800, 'Valorous Scourgestalker Handguards', 'Valorous Scourgestalker Battlegear'),
(3, 45361, 800, 'Valorous Scourgestalker Headpiece', 'Valorous Scourgestalker Battlegear'),
(3, 45362, 800, 'Valorous Scourgestalker Legguards', 'Valorous Scourgestalker Battlegear'),
(3, 45363, 800, 'Valorous Scourgestalker Spaulders', 'Valorous Scourgestalker Battlegear'),
(3, 45364, 800, 'Valorous Scourgestalker Tunic', 'Valorous Scourgestalker Battlegear');

-- Insert Armor Sets for Conqueror's Scourgestalker Battlegear Item Set 87
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(3, 46142, 87, 'Conqueror\'s Scourgestalker Handguards', 'Conqueror\'s Scourgestalker Battlegear'),
(3, 46143, 87, 'Conqueror\'s Scourgestalker Headpiece', 'Conqueror\'s Scourgestalker Battlegear'),
(3, 46144, 87, 'Conqueror\'s Scourgestalker Legguards', 'Conqueror\'s Scourgestalker Battlegear'),
(3, 46145, 87, 'Conqueror\'s Scourgestalker Spaulders', 'Conqueror\'s Scourgestalker Battlegear'),
(3, 46141, 87, 'Conqueror\'s Scourgestalker Tunic', 'Conqueror\'s Scourgestalker Battlegear');

-- Insert Armor Sets for Valorous Kirin Tor Garb Item Set 798
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 45365, 798, 'Valorous Kirin Tor Hood', 'Valorous Kirin Tor Garb'),
(8, 45367, 798, 'Valorous Kirin Tor Leggings', 'Valorous Kirin Tor Garb'),
(8, 45369, 798, 'Valorous Kirin Tor Shoulderpads', 'Valorous Kirin Tor Garb'),
(8, 45368, 798, 'Valorous Kirin Tor Tunic', 'Valorous Kirin Tor Garb'),
(8, 46131, 798, 'Valorous Kirin Tor Gauntlets', 'Valorous Kirin Tor Garb');

-- Insert Armor Sets for Conqueror's Kirin Tor Garb Item Set 85
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 46132, 85, 'Conqueror\'s Kirin Tor Gauntlets', 'Conqueror\'s Kirin Tor Garb'),
(8, 46129, 85, 'Conqueror\'s Kirin Tor Hood', 'Conqueror\'s Kirin Tor Garb'),
(8, 46133, 85, 'Conqueror\'s Kirin Tor Leggings', 'Conqueror\'s Kirin Tor Garb'),
(8, 46134, 85, 'Conqueror\'s Kirin Tor Shoulderpads', 'Conqueror\'s Kirin Tor Garb'),
(8, 46130, 85, 'Conqueror\'s Kirin Tor Tunic', 'Conqueror\'s Kirin Tor Garb');

-- Insert Armor Sets for Valorous Aegis Regalia Item Set 784
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 45370, 784, 'Valorous Aegis Gloves', 'Valorous Aegis Regalia'),
(2, 45371, 784, 'Valorous Aegis Greaves', 'Valorous Aegis Regalia'),
(2, 45372, 784, 'Valorous Aegis Headpiece', 'Valorous Aegis Regalia'),
(2, 45373, 784, 'Valorous Aegis Spaulders', 'Valorous Aegis Regalia'),
(2, 45374, 784, 'Valorous Aegis Tunic', 'Valorous Aegis Regalia');

-- Insert Armor Sets for Conqueror's Aegis Regalia Item Set 71
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 46179, 71, 'Conqueror\'s Aegis Gloves', 'Conqueror\'s Aegis Regalia'),
(2, 46181, 71, 'Conqueror\'s Aegis Greaves', 'Conqueror\'s Aegis Regalia'),
(2, 46180, 71, 'Conqueror\'s Aegis Headpiece', 'Conqueror\'s Aegis Regalia'),
(2, 46182, 71, 'Conqueror\'s Aegis Spaulders', 'Conqueror\'s Aegis Regalia'),
(2, 46178, 71, 'Conqueror\'s Aegis Tunic', 'Conqueror\'s Aegis Regalia');

-- Insert Armor Sets for Valorous Aegis Plate Item Set 783
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 45381, 783, 'Valorous Aegis Breastplate', 'Valorous Aegis Plate'),
(2, 45382, 783, 'Valorous Aegis Faceguard', 'Valorous Aegis Plate'),
(2, 45383, 783, 'Valorous Aegis Handguards', 'Valorous Aegis Plate'),
(2, 45384, 783, 'Valorous Aegis Legguards', 'Valorous Aegis Plate'),
(2, 45385, 783, 'Valorous Aegis Shoulderguards', 'Valorous Aegis Plate');

-- Insert Armor Sets for Conqueror's Aegis Plate Item Set 70
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 46173, 70, 'Conqueror\'s Aegis Breastplate', 'Conqueror\'s Aegis Plate'),
(2, 46175, 70, 'Conqueror\'s Aegis Faceguard', 'Conqueror\'s Aegis Plate'),
(2, 46174, 70, 'Conqueror\'s Aegis Handguards', 'Conqueror\'s Aegis Plate'),
(2, 46176, 70, 'Conqueror\'s Aegis Legguards', 'Conqueror\'s Aegis Plate'),
(2, 46177, 70, 'Conqueror\'s Aegis Shoulderguards', 'Conqueror\'s Aegis Plate');

-- Insert Armor Sets for Valorous Aegis Battlegear Item Set 782
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 45375, 782, 'Valorous Aegis Battleplate', 'Valorous Aegis Battlegear'),
(2, 45376, 782, 'Valorous Aegis Gauntlets', 'Valorous Aegis Battlegear'),
(2, 45377, 782, 'Valorous Aegis Helm', 'Valorous Aegis Battlegear'),
(2, 45379, 782, 'Valorous Aegis Legplates', 'Valorous Aegis Battlegear'),
(2, 45380, 782, 'Valorous Aegis Shoulderplates', 'Valorous Aegis Battlegear');

-- Insert Armor Sets for Conqueror's Aegis Battlegear Item Set 69
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 46154, 69, 'Conqueror\'s Aegis Battleplate', 'Conqueror\'s Aegis Battlegear'),
(2, 46155, 69, 'Conqueror\'s Aegis Gauntlets', 'Conqueror\'s Aegis Battlegear'),
(2, 46156, 69, 'Conqueror\'s Aegis Helm', 'Conqueror\'s Aegis Battlegear'),
(2, 46153, 69, 'Conqueror\'s Aegis Legplates', 'Conqueror\'s Aegis Battlegear'),
(2, 46152, 69, 'Conqueror\'s Aegis Shoulderplates', 'Conqueror\'s Aegis Battlegear');

-- Insert Armor Sets for Valorous Sanctification Regalia Item Set 795
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 45386, 795, 'Valorous Cowl of Sanctification', 'Valorous Sanctification Regalia'),
(5, 45387, 795, 'Valorous Gloves of Sanctification', 'Valorous Sanctification Regalia'),
(5, 45388, 795, 'Valorous Leggings of Sanctification', 'Valorous Sanctification Regalia'),
(5, 45389, 795, 'Valorous Robe of Sanctification', 'Valorous Sanctification Regalia'),
(5, 45390, 795, 'Valorous Shoulderpads of Sanctification', 'Valorous Sanctification Regalia');

-- Insert Armor Sets for Conqueror's Sanctification Regalia Item Set 82
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 46197, 82, 'Conqueror\'s Cowl of Sanctification', 'Conqueror\'s Sanctification Regalia'),
(5, 46188, 82, 'Conqueror\'s Gloves of Sanctification', 'Conqueror\'s Sanctification Regalia'),
(5, 46195, 82, 'Conqueror\'s Leggings of Sanctification', 'Conqueror\'s Sanctification Regalia'),
(5, 46193, 82, 'Conqueror\'s Robe of Sanctification', 'Conqueror\'s Sanctification Regalia'),
(5, 46190, 82, 'Conqueror\'s Shoulderpads of Sanctification', 'Conqueror\'s Sanctification Regalia');

-- Insert Armor Sets for Valorous Sanctification Garb Item Set 794
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 45391, 794, 'Valorous Circlet of Sanctification', 'Valorous Sanctification Garb'),
(5, 45392, 794, 'Valorous Handwraps of Sanctification', 'Valorous Sanctification Garb'),
(5, 45393, 794, 'Valorous Mantle of Sanctification', 'Valorous Sanctification Garb'),
(5, 45394, 794, 'Valorous Pants of Sanctification', 'Valorous Sanctification Garb'),
(5, 45395, 794, 'Valorous Raiments of Sanctification', 'Valorous Sanctification Garb');

-- Insert Armor Sets for Conqueror's Sanctification Garb Item Set 81
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 46172, 81, 'Conqueror\'s Circlet of Sanctification', 'Conqueror\'s Sanctification Garb'),
(5, 46163, 81, 'Conqueror\'s Handwraps of Sanctification', 'Conqueror\'s Sanctification Garb'),
(5, 46165, 81, 'Conqueror\'s Mantle of Sanctification', 'Conqueror\'s Sanctification Garb'),
(5, 46170, 81, 'Conqueror\'s Pants of Sanctification', 'Conqueror\'s Sanctification Garb'),
(5, 46168, 81, 'Conqueror\'s Raiments of Sanctification', 'Conqueror\'s Sanctification Garb');

-- Insert Armor Sets for Valorous Terrorblade Battlegear Item Set 788
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 45396, 788, 'Valorous Terrorblade Breastplate', 'Valorous Terrorblade Battlegear'),
(4, 45397, 788, 'Valorous Terrorblade Gauntlets', 'Valorous Terrorblade Battlegear'),
(4, 45398, 788, 'Valorous Terrorblade Helmet', 'Valorous Terrorblade Battlegear'),
(4, 45399, 788, 'Valorous Terrorblade Legplates', 'Valorous Terrorblade Battlegear'),
(4, 45400, 788, 'Valorous Terrorblade Pauldrons', 'Valorous Terrorblade Battlegear');

-- Insert Armor Sets for Conqueror's Terrorblade Battlegear Item Set 75
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 46123, 75, 'Conqueror\'s Terrorblade Breastplate', 'Conqueror\'s Terrorblade Battlegear'),
(4, 46124, 75, 'Conqueror\'s Terrorblade Gauntlets', 'Conqueror\'s Terrorblade Battlegear'),
(4, 46125, 75, 'Conqueror\'s Terrorblade Helmet', 'Conqueror\'s Terrorblade Battlegear'),
(4, 46126, 75, 'Conqueror\'s Terrorblade Legplates', 'Conqueror\'s Terrorblade Battlegear'),
(4, 46127, 75, 'Conqueror\'s Terrorblade Pauldrons', 'Conqueror\'s Terrorblade Battlegear');

-- Insert Armor Sets for Valorous Worldbreaker Garb Item Set 786
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 45406, 786, 'Valorous Worldbreaker Gloves', 'Valorous Worldbreaker Garb'),
(7, 45411, 786, 'Valorous Worldbreaker Hauberk', 'Valorous Worldbreaker Garb'),
(7, 45408, 786, 'Valorous Worldbreaker Helm', 'Valorous Worldbreaker Garb'),
(7, 45409, 786, 'Valorous Worldbreaker Kilt', 'Valorous Worldbreaker Garb'),
(7, 45410, 786, 'Valorous Worldbreaker Shoulderpads', 'Valorous Worldbreaker Garb');

-- Insert Armor Sets for Conqueror's Worldbreaker Garb Item Set 73
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 46207, 73, 'Conqueror\'s Worldbreaker Gloves', 'Conqueror\'s Worldbreaker Garb'),
(7, 46206, 73, 'Conqueror\'s Worldbreaker Hauberk', 'Conqueror\'s Worldbreaker Garb'),
(7, 46209, 73, 'Conqueror\'s Worldbreaker Helm', 'Conqueror\'s Worldbreaker Garb'),
(7, 46210, 73, 'Conqueror\'s Worldbreaker Kilt', 'Conqueror\'s Worldbreaker Garb'),
(7, 46211, 73, 'Conqueror\'s Worldbreaker Shoulderpads', 'Conqueror\'s Worldbreaker Garb');

-- Insert Armor Sets for Valorous Worldbreaker Battlegear Item Set 785
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 45413, 785, 'Valorous Worldbreaker Chestguard', 'Valorous Worldbreaker Battlegear'),
(7, 45412, 785, 'Valorous Worldbreaker Faceguard', 'Valorous Worldbreaker Battlegear'),
(7, 45414, 785, 'Valorous Worldbreaker Grips', 'Valorous Worldbreaker Battlegear'),
(7, 45415, 785, 'Valorous Worldbreaker Shoulderguards', 'Valorous Worldbreaker Battlegear'),
(7, 45416, 785, 'Valorous Worldbreaker War-Kilt', 'Valorous Worldbreaker Battlegear');

-- Insert Armor Sets for Conqueror's Worldbreaker Battlegear Item Set 72
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 46205, 72, 'Conqueror\'s Worldbreaker Chestguard', 'Conqueror\'s Worldbreaker Battlegear'),
(7, 46212, 72, 'Conqueror\'s Worldbreaker Faceguard', 'Conqueror\'s Worldbreaker Battlegear'),
(7, 46200, 72, 'Conqueror\'s Worldbreaker Grips', 'Conqueror\'s Worldbreaker Battlegear'),
(7, 46203, 72, 'Conqueror\'s Worldbreaker Shoulderguards', 'Conqueror\'s Worldbreaker Battlegear'),
(7, 46208, 72, 'Conqueror\'s Worldbreaker War-Kilt', 'Conqueror\'s Worldbreaker Battlegear');

-- Insert Armor Sets for Valorous Worldbreaker Regalia Item Set 787
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 45401, 787, 'Valorous Worldbreaker Handguards', 'Valorous Worldbreaker Regalia'),
(7, 45402, 787, 'Valorous Worldbreaker Headpiece', 'Valorous Worldbreaker Regalia'),
(7, 45403, 787, 'Valorous Worldbreaker Legguards', 'Valorous Worldbreaker Regalia'),
(7, 45404, 787, 'Valorous Worldbreaker Spaulders', 'Valorous Worldbreaker Regalia'),
(7, 45405, 787, 'Valorous Worldbreaker Tunic', 'Valorous Worldbreaker Regalia');

-- Insert Armor Sets for Conqueror's Worldbreaker Regalia Item Set 74
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 46199, 74, 'Conqueror\'s Worldbreaker Handguards', 'Conqueror\'s Worldbreaker Regalia'),
(7, 46201, 74, 'Conqueror\'s Worldbreaker Headpiece', 'Conqueror\'s Worldbreaker Regalia'),
(7, 46202, 74, 'Conqueror\'s Worldbreaker Legguards', 'Conqueror\'s Worldbreaker Regalia'),
(7, 46204, 74, 'Conqueror\'s Worldbreaker Spaulders', 'Conqueror\'s Worldbreaker Regalia'),
(7, 46198, 74, 'Conqueror\'s Worldbreaker Tunic', 'Conqueror\'s Worldbreaker Regalia');

-- Insert Armor Sets for Valorous Deathbringer Garb Item Set 799
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 45417, 799, 'Valorous Deathbringer Hood', 'Valorous Deathbringer Garb'),
(9, 45419, 799, 'Valorous Deathbringer Gloves', 'Valorous Deathbringer Garb'),
(9, 45420, 799, 'Valorous Deathbringer Leggings', 'Valorous Deathbringer Garb'),
(9, 45421, 799, 'Valorous Deathbringer Robe', 'Valorous Deathbringer Garb'),
(9, 45422, 799, 'Valorous Deathbringer Shoulderpads', 'Valorous Deathbringer Garb');

-- Insert Armor Sets for Conqueror's Deathbringer Garb Item Set 86
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 46135, 86, 'Conqueror\'s Deathbringer Gloves', 'Conqueror\'s Deathbringer Garb'),
(9, 46140, 86, 'Conqueror\'s Deathbringer Hood', 'Conqueror\'s Deathbringer Garb'),
(9, 46139, 86, 'Conqueror\'s Deathbringer Leggings', 'Conqueror\'s Deathbringer Garb'),
(9, 46137, 86, 'Conqueror\'s Deathbringer Robe', 'Conqueror\'s Deathbringer Garb'),
(9, 46136, 86, 'Conqueror\'s Deathbringer Shoulderpads', 'Conqueror\'s Deathbringer Garb');

-- Insert Armor Sets for Valorous Siegebreaker Battlegear Item Set 792
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 45429, 792, 'Valorous Siegebreaker Battleplate', 'Valorous Siegebreaker Battlegear'),
(1, 45430, 792, 'Valorous Siegebreaker Gauntlets', 'Valorous Siegebreaker Battlegear'),
(1, 45431, 792, 'Valorous Siegebreaker Helmet', 'Valorous Siegebreaker Battlegear'),
(1, 45432, 792, 'Valorous Siegebreaker Legplates', 'Valorous Siegebreaker Battlegear'),
(1, 45433, 792, 'Valorous Siegebreaker Shoulderplates', 'Valorous Siegebreaker Battlegear');

-- Insert Armor Sets for Conqueror's Siegebreaker Battlegear Item Set 79
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 46146, 79, 'Conqueror\'s Siegebreaker Battleplate', 'Conqueror\'s Siegebreaker Battlegear'),
(1, 46148, 79, 'Conqueror\'s Siegebreaker Gauntlets', 'Conqueror\'s Siegebreaker Battlegear'),
(1, 46151, 79, 'Conqueror\'s Siegebreaker Helmet', 'Conqueror\'s Siegebreaker Battlegear'),
(1, 46150, 79, 'Conqueror\'s Siegebreaker Legplates', 'Conqueror\'s Siegebreaker Battlegear'),
(1, 46149, 79, 'Conqueror\'s Siegebreaker Shoulderplates', 'Conqueror\'s Siegebreaker Battlegear');

-- Insert Armor Sets for Valorous Siegebreaker Plate Item Set 793
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 45424, 793, 'Valorous Siegebreaker Breastplate', 'Valorous Siegebreaker Plate'),
(1, 45425, 793, 'Valorous Siegebreaker Greathelm', 'Valorous Siegebreaker Plate'),
(1, 45426, 793, 'Valorous Siegebreaker Handguards', 'Valorous Siegebreaker Plate'),
(1, 45427, 793, 'Valorous Siegebreaker Legguards', 'Valorous Siegebreaker Plate'),
(1, 45248, 793, 'Valorous Siegebreaker Pauldrons', 'Valorous Siegebreaker Plate');

-- Insert Armor Sets for Conqueror's Siegebreaker Plate Item Set 80
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 46162, 80, 'Conqueror\'s Siegebreaker Breastplate', 'Conqueror\'s Siegebreaker Plate'),
(1, 46166, 80, 'Conqueror\'s Siegebreaker Greathelm', 'Conqueror\'s Siegebreaker Plate'),
(1, 46164, 80, 'Conqueror\'s Siegebreaker Handguards', 'Conqueror\'s Siegebreaker Plate'),
(1, 46169, 80, 'Conqueror\'s Siegebreaker Legguards', 'Conqueror\'s Siegebreaker Plate'),
(1, 46167, 80, 'Conqueror\'s Siegebreaker Pauldrons', 'Conqueror\'s Siegebreaker Plate');





-- [[ Tier 9 Sets ]]



-- Insert Armor Sets for Conqueror's Thassarian's Battlegear Item Set 871
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 48472, 871, 'Thassarian\'s Helmet of Conquest', 'Conqueror\'s Thassarian\'s Battlegear'),
(6, 48474, 871, 'Thassarian\'s Battleplate of Conquest', 'Conqueror\'s Thassarian\'s Battlegear'),
(6, 48476, 871, 'Thassarian\'s Legplates of Conquest', 'Conqueror\'s Thassarian\'s Battlegear'),
(6, 48478, 871, 'Thassarian\'s Shoulderplates of Conquest', 'Conqueror\'s Thassarian\'s Battlegear'),
(6, 48480, 871, 'Thassarian\'s Gauntlets of Conquest', 'Conqueror\'s Thassarian\'s Battlegear');

-- Insert Armor Sets for Triumphant Thassarian's Battlegear Item Set 164
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 48481, 164, 'Thassarian\'s Battleplate of Triumph', 'Triumphant Thassarian\'s Battlegear'),
(6, 48482, 164, 'Thassarian\'s Gauntlets of Triumph', 'Triumphant Thassarian\'s Battlegear'),
(6, 48483, 164, 'Thassarian\'s Helmet of Triumph', 'Triumphant Thassarian\'s Battlegear'),
(6, 48484, 164, 'Thassarian\'s Legplates of Triumph', 'Triumphant Thassarian\'s Battlegear'),
(6, 48485, 164, 'Thassarian\'s Shoulderplates of Triumph', 'Triumphant Thassarian\'s Battlegear');

-- Insert Armor Sets for Thassarian's Plate Item Set 831
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 48531, 831, 'Thassarian\'s Chestguard of Conquest', 'Thassarian\'s Plate'),
(6, 48529, 831, 'Thassarian\'s Faceguard of Conquest', 'Thassarian\'s Plate'),
(6, 48537, 831, 'Thassarian\'s Handguards of Conquest', 'Thassarian\'s Plate'),
(6, 48533, 831, 'Thassarian\'s Legguards of Conquest', 'Thassarian\'s Plate'),
(6, 48535, 831, 'Thassarian\'s Pauldrons of Conquest', 'Thassarian\'s Plate');

-- Insert Armor Sets for Triumphant Thassarian's Plate Item Set 166
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 48538, 166, 'Thassarian\'s Chestguard of Triumph', 'Triumphant Thassarian\'s Plate'),
(6, 48540, 166, 'Thassarian\'s Faceguard of Triumph', 'Triumphant Thassarian\'s Plate'),
(6, 48539, 166, 'Thassarian\'s Handguards of Triumph', 'Triumphant Thassarian\'s Plate'),
(6, 48541, 166, 'Thassarian\'s Legguards of Triumph', 'Triumphant Thassarian\'s Plate'),
(6, 48542, 166, 'Thassarian\'s Pauldrons of Triumph', 'Triumphant Thassarian\'s Plate');

-- Insert Armor Sets for Koltira's Battlegear Item Set 872
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 48880, 872, 'Koltira\'s Battleplate', 'Koltira\'s Battlegear'),
(6, 48881, 872, 'Koltira\'s Gauntlets', 'Koltira\'s Battlegear'),
(6, 48882, 872, 'Koltira\'s Helmet', 'Koltira\'s Battlegear'),
(6, 48883, 872, 'Koltira\'s Legplates', 'Koltira\'s Battlegear'),
(6, 48884, 872, 'Koltira\'s Shoulderplates', 'Koltira\'s Battlegear');

-- Insert Armor Sets for Triumphant Koltira's Battlegear Item Set 165
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 48500, 165, 'Koltira\'s Battleplate of Triumph', 'Triumphant Koltira\'s Battlegear'),
(6, 48499, 165, 'Koltira\'s Gauntlets of Triumph', 'Triumphant Koltira\'s Battlegear'),
(6, 48498, 165, 'Koltira\'s Helmet of Triumph', 'Triumphant Koltira\'s Battlegear'),
(6, 48497, 165, 'Koltira\'s Legplates of Triumph', 'Triumphant Koltira\'s Battlegear'),
(6, 48496, 165, 'Koltira\'s Shoulderplates of Triumph', 'Triumphant Koltira\'s Battlegear');

-- Insert Armor Sets for Koltira's Plate Item Set 874
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 48890, 874, 'Koltira\'s Chestguard', 'Koltira\'s Plate'),
(6, 48891, 874, 'Koltira\'s Faceguard', 'Koltira\'s Plate'),
(6, 48892, 874, 'Koltira\'s Handguards', 'Koltira\'s Plate'),
(6, 48893, 874, 'Koltira\'s Legguards', 'Koltira\'s Plate'),
(6, 48894, 874, 'Koltira\'s Pauldrons', 'Koltira\'s Plate');

-- Insert Armor Sets for Triumphant Koltira's Plate Item Set 167
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 48557, 167, 'Koltira\'s Chestguard of Triumph', 'Triumphant Koltira\'s Plate'),
(6, 48555, 167, 'Koltira\'s Faceguard of Triumph', 'Triumphant Koltira\'s Plate'),
(6, 48556, 167, 'Koltira\'s Handguards of Triumph', 'Triumphant Koltira\'s Plate'),
(6, 48554, 167, 'Koltira\'s Legguards of Triumph', 'Triumphant Koltira\'s Plate'),
(6, 48553, 167, 'Koltira\'s Pauldrons of Triumph', 'Triumphant Koltira\'s Plate');

-- Insert Armor Sets for Malfurion's Garb of Conquest Item Set 851
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 48102, 851, 'Malfurion\'s Headpiece of Conquest', 'Malfurion\'s Garb of Conquest'),
(11, 48129, 851, 'Malfurion\'s Robe of Conquest', 'Malfurion\'s Garb of Conquest'),
(11, 48130, 851, 'Malfurion\'s Leggings of Conquest', 'Malfurion\'s Garb of Conquest'),
(11, 48131, 851, 'Malfurion\'s Spaulders of Conquest', 'Malfurion\'s Garb of Conquest'),
(11, 48132, 851, 'Malfurion\'s Handguards of Conquest', 'Malfurion\'s Garb of Conquest');

-- Insert Armor Sets for Triumphant Malfurion's Garb Item Set 182
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 48142, 182, 'Malfurion\'s Handguards of Triumph', 'Triumphant Malfurion\'s Garb'),
(11, 48141, 182, 'Malfurion\'s Headpiece of Triumph', 'Triumphant Malfurion\'s Garb'),
(11, 48140, 182, 'Malfurion\'s Leggings of Triumph', 'Triumphant Malfurion\'s Garb'),
(11, 48139, 182, 'Malfurion\'s Robe of Triumph', 'Triumphant Malfurion\'s Garb'),
(11, 48138, 182, 'Malfurion\'s Spaulders of Triumph', 'Triumphant Malfurion\'s Garb');

-- Insert Armor Sets for Malfurion's Battlegear Item Set 813
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 48213, 813, 'Malfurion\'s Handgrips of Conquest', 'Malfurion\'s Battlegear'),
(11, 48214, 813, 'Malfurion\'s Headguard of Conquest', 'Malfurion\'s Battlegear'),
(11, 48215, 813, 'Malfurion\'s Legguards of Conquest', 'Malfurion\'s Battlegear'),
(11, 48216, 813, 'Malfurion\'s Raiments of Conquest', 'Malfurion\'s Battlegear'),
(11, 48217, 813, 'Malfurion\'s Shoulderpads of Conquest', 'Malfurion\'s Battlegear');

-- Insert Armor Sets for Triumphant Malfurion's Battlegear Item Set 148
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 48212, 148, 'Malfurion\'s Handgrips of Triumph', 'Triumphant Malfurion\'s Battlegear'),
(11, 48211, 148, 'Malfurion\'s Headguard of Triumph', 'Triumphant Malfurion\'s Battlegear'),
(11, 48210, 148, 'Malfurion\'s Legguards of Triumph', 'Triumphant Malfurion\'s Battlegear'),
(11, 48209, 148, 'Malfurion\'s Raiments of Triumph', 'Triumphant Malfurion\'s Battlegear'),
(11, 48208, 148, 'Malfurion\'s Shoulderpads of Triumph', 'Triumphant Malfurion\'s Battlegear');

-- Insert Armor Sets for Runetotem's Garb Item Set 852
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 48769, 852, 'Runetotem\'s Handguards', 'Runetotem\'s Garb'),
(11, 48770, 852, 'Runetotem\'s Headpiece', 'Runetotem\'s Garb'),
(11, 48771, 852, 'Runetotem\'s Leggings', 'Runetotem\'s Garb'),
(11, 48772, 852, 'Runetotem\'s Robe', 'Runetotem\'s Garb'),
(11, 48773, 852, 'Runetotem\'s Spaulders', 'Runetotem\'s Garb');

-- Insert Armor Sets for Triumphant Runetotem's Garb Item Set 145
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 48152, 145, 'Runetotem\'s Handguards of Triumph', 'Triumphant Runetotem\'s Garb'),
(11, 48151, 145, 'Runetotem\'s Headpiece of Triumph', 'Triumphant Runetotem\'s Garb'),
(11, 48150, 145, 'Runetotem\'s Leggings of Triumph', 'Triumphant Runetotem\'s Garb'),
(11, 48149, 145, 'Runetotem\'s Robe of Triumph', 'Triumphant Runetotem\'s Garb'),
(11, 48148, 145, 'Runetotem\'s Spaulders of Triumph', 'Triumphant Runetotem\'s Garb');

-- Insert Armor Sets for Runetotem's Battlegear Item Set 856
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 48794, 856, 'Runetotem\'s Handgrips', 'Runetotem\'s Battlegear'),
(11, 48795, 856, 'Runetotem\'s Headguard', 'Runetotem\'s Battlegear'),
(11, 48796, 856, 'Runetotem\'s Legguards', 'Runetotem\'s Battlegear'),
(11, 48797, 856, 'Runetotem\'s Raiments', 'Runetotem\'s Battlegear'),
(11, 48798, 856, 'Runetotem\'s Shoulderpads', 'Runetotem\'s Battlegear');

-- Insert Armor Sets for Triumphant Runetotem's Battlegear Item Set 149
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 48193, 149, 'Runetotem\'s Handgrips of Triumph', 'Triumphant Runetotem\'s Battlegear'),
(11, 48194, 149, 'Runetotem\'s Headguard of Triumph', 'Triumphant Runetotem\'s Battlegear'),
(11, 48195, 149, 'Runetotem\'s Legguards of Triumph', 'Triumphant Runetotem\'s Battlegear'),
(11, 48196, 149, 'Runetotem\'s Raiments of Triumph', 'Triumphant Runetotem\'s Battlegear'),
(11, 48197, 149, 'Runetotem\'s Shoulderpads of Triumph', 'Triumphant Runetotem\'s Battlegear');

-- Insert Armor Sets for Runetotem's Regalia Item Set 854
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 48781, 854, 'Runetotem\'s Cover', 'Runetotem\'s Regalia'),
(11, 48782, 854, 'Runetotem\'s Gloves', 'Runetotem\'s Regalia'),
(11, 48783, 854, 'Runetotem\'s Mantle', 'Runetotem\'s Regalia'),
(11, 48784, 854, 'Runetotem\'s Trousers', 'Runetotem\'s Regalia'),
(11, 48785, 854, 'Runetotem\'s Vestments', 'Runetotem\'s Regalia');

-- Insert Armor Sets for Triumphant Runetotem's Regalia Item Set 147
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 48181, 147, 'Runetotem\'s Cover of Triumph', 'Triumphant Runetotem\'s Regalia'),
(11, 48182, 147, 'Runetotem\'s Gloves of Triumph', 'Triumphant Runetotem\'s Regalia'),
(11, 48178, 147, 'Runetotem\'s Mantle of Triumph', 'Triumphant Runetotem\'s Regalia'),
(11, 48180, 147, 'Runetotem\'s Trousers of Triumph', 'Triumphant Runetotem\'s Regalia'),
(11, 48179, 147, 'Runetotem\'s Vestments of Triumph', 'Triumphant Runetotem\'s Regalia');

-- Insert Armor Sets for Windrunner's Battlegear Item Set 859
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(3, 48819, 859, 'Windrunner\'s Handguards', 'Windrunner\'s Battlegear'),
(3, 48820, 859, 'Windrunner\'s Headpiece', 'Windrunner\'s Battlegear'),
(3, 48821, 859, 'Windrunner\'s Legguards', 'Windrunner\'s Battlegear'),
(3, 48822, 859, 'Windrunner\'s Spaulders', 'Windrunner\'s Battlegear'),
(3, 48823, 859, 'Windrunner\'s Tunic', 'Windrunner\'s Battlegear');

-- Insert Armor Sets for Triumphant Windrunner's Battlegear Item Set 152
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(3, 48256, 152, 'Windrunner\'s Handguards of Triumph', 'Triumphant Windrunner\'s Battlegear'),
(3, 48257, 152, 'Windrunner\'s Headpiece of Triumph', 'Triumphant Windrunner\'s Battlegear'),
(3, 48258, 152, 'Windrunner\'s Legguards of Triumph', 'Triumphant Windrunner\'s Battlegear'),
(3, 48259, 152, 'Windrunner\'s Spaulders of Triumph', 'Triumphant Windrunner\'s Battlegear'),
(3, 48255, 152, 'Windrunner\'s Tunic of Triumph', 'Triumphant Windrunner\'s Battlegear');

-- Insert Armor Sets for Windrunner's Pursuit Item Set 860
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(3, 48814, 860, 'Windrunner\'s Handguards', 'Windrunner\'s Pursuit'),
(3, 48815, 860, 'Windrunner\'s Headpiece', 'Windrunner\'s Pursuit'),
(3, 48816, 860, 'Windrunner\'s Legguards', 'Windrunner\'s Pursuit'),
(3, 48817, 860, 'Windrunner\'s Spaulders', 'Windrunner\'s Pursuit'),
(3, 48818, 860, 'Windrunner\'s Tunic', 'Windrunner\'s Pursuit');

-- Insert Armor Sets for Triumphant Windrunner's Pursuit Item Set 153
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(3, 48273, 153, 'Windrunner\'s Handguards of Triumph', 'Triumphant Windrunner\'s Pursuit'),
(3, 48272, 153, 'Windrunner\'s Headpiece of Triumph', 'Triumphant Windrunner\'s Pursuit'),
(3, 48271, 153, 'Windrunner\'s Legguards of Triumph', 'Triumphant Windrunner\'s Pursuit'),
(3, 48270, 153, 'Windrunner\'s Spaulders of Triumph', 'Triumphant Windrunner\'s Pursuit'),
(3, 48274, 153, 'Windrunner\'s Tunic of Triumph', 'Triumphant Windrunner\'s Pursuit');

-- Insert Armor Sets for Khadgar's Regalia Item Set 843
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 48725, 843, 'Khadgar\'s Gauntlets', 'Khadgar\'s Regalia'),
(8, 48726, 843, 'Khadgar\'s Hood', 'Khadgar\'s Regalia'),
(8, 48727, 843, 'Khadgar\'s Leggings', 'Khadgar\'s Regalia'),
(8, 48728, 843, 'Khadgar\'s Robe', 'Khadgar\'s Regalia'),
(8, 48729, 843, 'Khadgar\'s Shoulderpads', 'Khadgar\'s Regalia');

-- Insert Armor Sets for Triumphant Khadgar's Regalia Item Set 136
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 47753, 136, 'Khadgar\'s Gauntlets of Triumph', 'Triumphant Khadgar\'s Regalia'),
(8, 47754, 136, 'Khadgar\'s Hood of Triumph', 'Triumphant Khadgar\'s Regalia'),
(8, 47755, 136, 'Khadgar\'s Leggings of Triumph', 'Triumphant Khadgar\'s Regalia'),
(8, 47756, 136, 'Khadgar\'s Robe of Triumph', 'Triumphant Khadgar\'s Regalia'),
(8, 47757, 136, 'Khadgar\'s Shoulderpads of Triumph', 'Triumphant Khadgar\'s Regalia');

-- Insert Armor Sets for Sunstrider's Regalia Item Set 844
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 48730, 844, 'Sunstrider\'s Gauntlets', 'Sunstrider\'s Regalia'),
(8, 48731, 844, 'Sunstrider\'s Hood', 'Sunstrider\'s Regalia'),
(8, 48732, 844, 'Sunstrider\'s Leggings', 'Sunstrider\'s Regalia'),
(8, 48733, 844, 'Sunstrider\'s Robe', 'Sunstrider\'s Regalia'),
(8, 48734, 844, 'Sunstrider\'s Shoulderpads', 'Sunstrider\'s Regalia');

-- Insert Armor Sets for Triumphant Sunstrider's Regalia Item Set 137
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 47772, 137, 'Sunstrider\'s Gauntlets of Triumph', 'Triumphant Sunstrider\'s Regalia'),
(8, 47771, 137, 'Sunstrider\'s Hood of Triumph', 'Triumphant Sunstrider\'s Regalia'),
(8, 47770, 137, 'Sunstrider\'s Leggings of Triumph', 'Triumphant Sunstrider\'s Regalia'),
(8, 47769, 137, 'Sunstrider\'s Robe of Triumph', 'Triumphant Sunstrider\'s Regalia'),
(8, 47768, 137, 'Sunstrider\'s Shoulderpads of Triumph', 'Triumphant Sunstrider\'s Regalia');

-- Insert Armor Sets for Turalyon's Garb Item Set 875
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 48904, 875, 'Turalyon\'s Gloves', 'Turalyon\'s Garb'),
(2, 48903, 875, 'Turalyon\'s Greaves', 'Turalyon\'s Garb'),
(2, 48902, 875, 'Turalyon\'s Headpiece', 'Turalyon\'s Garb'),
(2, 48901, 875, 'Turalyon\'s Spaulders', 'Turalyon\'s Garb'),
(2, 48900, 875, 'Turalyon\'s Tunic', 'Turalyon\'s Garb');

-- Insert Armor Sets for Triumphant Turalyon's Garb Item Set 168
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 48576, 168, 'Turalyon\'s Gloves of Triumph', 'Triumphant Turalyon\'s Garb'),
(2, 48578, 168, 'Turalyon\'s Greaves of Triumph', 'Triumphant Turalyon\'s Garb'),
(2, 48577, 168, 'Turalyon\'s Headpiece of Triumph', 'Triumphant Turalyon\'s Garb'),
(2, 48579, 168, 'Turalyon\'s Spaulders of Triumph', 'Triumphant Turalyon\'s Garb'),
(2, 48575, 168, 'Turalyon\'s Tunic of Triumph', 'Triumphant Turalyon\'s Garb');

-- Insert Armor Sets for Turalyon's Plate Item Set 879
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 48927, 879, 'Turalyon\'s Breastplate', 'Turalyon\'s Plate'),
(2, 48928, 879, 'Turalyon\'s Faceguard', 'Turalyon\'s Plate'),
(2, 48929, 879, 'Turalyon\'s Handguards', 'Turalyon\'s Plate'),
(2, 48930, 879, 'Turalyon\'s Legguards', 'Turalyon\'s Plate'),
(2, 48931, 879, 'Turalyon\'s Shoulderguards', 'Turalyon\'s Plate');

-- Insert Armor Sets for Triumphant Turalyon's Plate Item Set 172
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 48641, 172, 'Turalyon\'s Breastplate of Triumph', 'Triumphant Turalyon\'s Plate'),
(2, 48639, 172, 'Turalyon\'s Faceguard of Triumph', 'Triumphant Turalyon\'s Plate'),
(2, 48640, 172, 'Turalyon\'s Handguards of Triumph', 'Triumphant Turalyon\'s Plate'),
(2, 48638, 172, 'Turalyon\'s Legguards of Triumph', 'Triumphant Turalyon\'s Plate'),
(2, 48637, 172, 'Turalyon\'s Shoulderguards of Triumph', 'Triumphant Turalyon\'s Plate');

-- Insert Armor Sets for Turalyon's Battlegear Item Set 877
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 48915, 877, 'Turalyon\'s Battleplate', 'Turalyon\'s Battlegear'),
(2, 48916, 877, 'Turalyon\'s Gauntlets', 'Turalyon\'s Battlegear'),
(2, 48917, 877, 'Turalyon\'s Helm', 'Turalyon\'s Battlegear'),
(2, 48918, 877, 'Turalyon\'s Legplates', 'Turalyon\'s Battlegear'),
(2, 48919, 877, 'Turalyon\'s Shoulderplates', 'Turalyon\'s Battlegear');

-- Insert Armor Sets for Triumphant Turalyon's Battlegear Item Set 170
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 48607, 170, 'Turalyon\'s Battleplate of Triumph', 'Triumphant Turalyon\'s Battlegear'),
(2, 48608, 170, 'Turalyon\'s Gauntlets of Triumph', 'Triumphant Turalyon\'s Battlegear'),
(2, 48609, 170, 'Turalyon\'s Helm of Triumph', 'Triumphant Turalyon\'s Battlegear'),
(2, 48610, 170, 'Turalyon\'s Legplates of Triumph', 'Triumphant Turalyon\'s Battlegear'),
(2, 48611, 170, 'Turalyon\'s Shoulderplates of Triumph', 'Triumphant Turalyon\'s Battlegear');

-- Insert Armor Sets for Liadrin's Garb Item Set 876
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 48909, 876, 'Liadrin\'s Gloves', 'Liadrin\'s Garb'),
(2, 48908, 876, 'Liadrin\'s Greaves', 'Liadrin\'s Garb'),
(2, 48907, 876, 'Liadrin\'s Headpiece', 'Liadrin\'s Garb'),
(2, 48906, 876, 'Liadrin\'s Spaulders', 'Liadrin\'s Garb'),
(2, 48905, 876, 'Liadrin\'s Tunic', 'Liadrin\'s Garb');

-- Insert Armor Sets for Triumphant Liadrin's Garb Item Set 169
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 48593, 169, 'Liadrin\'s Gloves of Triumph', 'Triumphant Liadrin\'s Garb'),
(2, 48591, 169, 'Liadrin\'s Greaves of Triumph', 'Triumphant Liadrin\'s Garb'),
(2, 48592, 169, 'Liadrin\'s Headpiece of Triumph', 'Triumphant Liadrin\'s Garb'),
(2, 48590, 169, 'Liadrin\'s Spaulders of Triumph', 'Triumphant Liadrin\'s Garb'),
(2, 48594, 169, 'Liadrin\'s Tunic of Triumph', 'Triumphant Liadrin\'s Garb');

-- Insert Armor Sets for Liadrin's Plate Item Set 880
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 48922, 880, 'Liadrin\'s Breastplate', 'Liadrin\'s Plate'),
(2, 48923, 880, 'Liadrin\'s Faceguard', 'Liadrin\'s Plate'),
(2, 48924, 880, 'Liadrin\'s Handguards', 'Liadrin\'s Plate'),
(2, 48925, 880, 'Liadrin\'s Legguards', 'Liadrin\'s Plate'),
(2, 48926, 880, 'Liadrin\'s Shoulderguards', 'Liadrin\'s Plate');

-- Insert Armor Sets for Triumphant Liadrin's Plate Item Set 173
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 48657, 173, 'Liadrin\'s Breastplate of Triumph', 'Triumphant Liadrin\'s Plate'),
(2, 48659, 173, 'Liadrin\'s Faceguard of Triumph', 'Triumphant Liadrin\'s Plate'),
(2, 48658, 173, 'Liadrin\'s Handguards of Triumph', 'Triumphant Liadrin\'s Plate'),
(2, 48660, 173, 'Liadrin\'s Legguards of Triumph', 'Triumphant Liadrin\'s Plate'),
(2, 48661, 173, 'Liadrin\'s Shoulderguards of Triumph', 'Triumphant Liadrin\'s Plate');

-- Insert Armor Sets for Liadrin's Battlegear Item Set 878
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 48910, 878, 'Liadrin\'s Battleplate', 'Liadrin\'s Battlegear'),
(2, 48911, 878, 'Liadrin\'s Gauntlets', 'Liadrin\'s Battlegear'),
(2, 48912, 878, 'Liadrin\'s Helm', 'Liadrin\'s Battlegear'),
(2, 48913, 878, 'Liadrin\'s Legplates', 'Liadrin\'s Battlegear'),
(2, 48914, 878, 'Liadrin\'s Shoulderplates', 'Liadrin\'s Battlegear');

-- Insert Armor Sets for Triumphant Liadrin's Battlegear Item Set 171
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 48626, 171, 'Liadrin\'s Battleplate of Triumph', 'Triumphant Liadrin\'s Battlegear'),
(2, 48625, 171, 'Liadrin\'s Gauntlets of Triumph', 'Triumphant Liadrin\'s Battlegear'),
(2, 48624, 171, 'Liadrin\'s Helm of Triumph', 'Triumphant Liadrin\'s Battlegear'),
(2, 48623, 171, 'Liadrin\'s Legplates of Triumph', 'Triumphant Liadrin\'s Battlegear'),
(2, 48622, 171, 'Liadrin\'s Shoulderplates of Triumph', 'Triumphant Liadrin\'s Battlegear');

-- Insert Armor Sets for Velen's Regalia Item Set 849
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 48755, 849, 'Velen\'s Circlet', 'Velen\'s Regalia'),
(5, 48756, 849, 'Velen\'s Handwraps', 'Velen\'s Regalia'),
(5, 48757, 849, 'Velen\'s Mantle', 'Velen\'s Regalia'),
(5, 48758, 849, 'Velen\'s Pants', 'Velen\'s Regalia'),
(5, 48759, 849, 'Velen\'s Raiments', 'Velen\'s Regalia');

-- Insert Armor Sets for Triumphant Velen's Regalia Item Set 142
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 48078, 142, 'Velen\'s Circlet of Triumph', 'Triumphant Velen\'s Regalia'),
(5, 48077, 142, 'Velen\'s Handwraps of Triumph', 'Triumphant Velen\'s Regalia'),
(5, 48081, 142, 'Velen\'s Mantle of Triumph', 'Triumphant Velen\'s Regalia'),
(5, 48079, 142, 'Velen\'s Pants of Triumph', 'Triumphant Velen\'s Regalia'),
(5, 48080, 142, 'Velen\'s Raiments of Triumph', 'Triumphant Velen\'s Regalia');

-- Insert Armor Sets for Velen's Raiment Item Set 847
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 48745, 847, 'Velen\'s Cowl', 'Velen\'s Raiment'),
(5, 48746, 847, 'Velen\'s Gloves', 'Velen\'s Raiment'),
(5, 48747, 847, 'Velen\'s Leggings', 'Velen\'s Raiment'),
(5, 48748, 847, 'Velen\'s Robe', 'Velen\'s Raiment'),
(5, 48749, 847, 'Velen\'s Shoulderpads', 'Velen\'s Raiment');

-- Insert Armor Sets for Triumphant Velen's Raiment Item Set 140
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 47984, 140, 'Velen\'s Cowl of Triumph', 'Triumphant Velen\'s Raiment'),
(5, 47983, 140, 'Velen\'s Gloves of Triumph', 'Triumphant Velen\'s Raiment'),
(5, 47985, 140, 'Velen\'s Leggings of Triumph', 'Triumphant Velen\'s Raiment'),
(5, 47986, 140, 'Velen\'s Robe of Triumph', 'Triumphant Velen\'s Raiment'),
(5, 47987, 140, 'Velen\'s Shoulderpads of Triumph', 'Triumphant Velen\'s Raiment');

-- Insert Armor Sets for Zabra's Regalia Item Set 850
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 48760, 850, 'Zabra\'s Circlet', 'Zabra\'s Regalia'),
(5, 48761, 850, 'Zabra\'s Handwraps', 'Zabra\'s Regalia'),
(5, 48762, 850, 'Zabra\'s Mantle', 'Zabra\'s Regalia'),
(5, 48763, 850, 'Zabra\'s Pants', 'Zabra\'s Regalia'),
(5, 48764, 850, 'Zabra\'s Raiments', 'Zabra\'s Regalia');

-- Insert Armor Sets for Triumphant Zabra's Regalia Item Set 143
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 48095, 143, 'Zabra\'s Circlet of Triumph', 'Triumphant Zabra\'s Regalia'),
(5, 48096, 143, 'Zabra\'s Handwraps of Triumph', 'Triumphant Zabra\'s Regalia'),
(5, 48092, 143, 'Zabra\'s Mantle of Triumph', 'Triumphant Zabra\'s Regalia'),
(5, 48094, 143, 'Zabra\'s Pants of Triumph', 'Triumphant Zabra\'s Regalia'),
(5, 48093, 143, 'Zabra\'s Raiments of Triumph', 'Triumphant Zabra\'s Regalia');

-- Insert Armor Sets for Zabra's Raiment Item Set 848
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 48750, 848, 'Zabra\'s Cowl', 'Zabra\'s Raiment'),
(5, 48751, 848, 'Zabra\'s Gloves', 'Zabra\'s Raiment'),
(5, 48752, 848, 'Zabra\'s Leggings', 'Zabra\'s Raiment'),
(5, 48753, 848, 'Zabra\'s Robe', 'Zabra\'s Raiment'),
(5, 48754, 848, 'Zabra\'s Shoulderpads', 'Zabra\'s Raiment');

-- Insert Armor Sets for Triumphant Zabra's Raiment Item Set 141
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 48065, 141, 'Zabra\'s Cowl of Triumph', 'Triumphant Zabra\'s Raiment'),
(5, 48066, 141, 'Zabra\'s Gloves of Triumph', 'Triumphant Zabra\'s Raiment'),
(5, 48064, 141, 'Zabra\'s Leggings of Triumph', 'Triumphant Zabra\'s Raiment'),
(5, 48063, 141, 'Zabra\'s Robe of Triumph', 'Triumphant Zabra\'s Raiment'),
(5, 48062, 141, 'Zabra\'s Shoulderpads of Triumph', 'Triumphant Zabra\'s Raiment');

-- Insert Armor Sets for VanCleef's Battlegear Item Set 857
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 48809, 857, 'VanCleef\'s Breastplate', 'VanCleef\'s Battlegear'),
(4, 48810, 857, 'VanCleef\'s Gauntlets', 'VanCleef\'s Battlegear'),
(4, 48811, 857, 'VanCleef\'s Helmet', 'VanCleef\'s Battlegear'),
(4, 48812, 857, 'VanCleef\'s Legplates', 'VanCleef\'s Battlegear'),
(4, 48813, 857, 'VanCleef\'s Pauldrons', 'VanCleef\'s Battlegear');

-- Insert Armor Sets for Triumphant VanCleef's Battlegear Item Set 150
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 48223, 150, 'VanCleef\'s Breastplate of Triumph', 'Triumphant VanCleef\'s Battlegear'),
(4, 48224, 150, 'VanCleef\'s Gauntlets of Triumph', 'Triumphant VanCleef\'s Battlegear'),
(4, 48225, 150, 'VanCleef\'s Helmet of Triumph', 'Triumphant VanCleef\'s Battlegear'),
(4, 48226, 150, 'VanCleef\'s Legplates of Triumph', 'Triumphant VanCleef\'s Battlegear'),
(4, 48227, 150, 'VanCleef\'s Pauldrons of Triumph', 'Triumphant VanCleef\'s Battlegear');

-- Insert Armor Sets for Garona's Battlegear Item Set 858
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 48804, 858, 'Garona\'s Breastplate', 'Garona\'s Battlegear'),
(4, 48805, 858, 'Garona\'s Gauntlets', 'Garona\'s Battlegear'),
(4, 48806, 858, 'Garona\'s Helmet', 'Garona\'s Battlegear'),
(4, 48807, 858, 'Garona\'s Legplates', 'Garona\'s Battlegear'),
(4, 48808, 858, 'Garona\'s Pauldrons', 'Garona\'s Battlegear');

-- Insert Armor Sets for Triumphant Garona's Battlegear Item Set 151
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 48242, 151, 'Garona\'s Breastplate of Triumph', 'Triumphant Garona\'s Battlegear'),
(4, 48241, 151, 'Garona\'s Gauntlets of Triumph', 'Triumphant Garona\'s Battlegear'),
(4, 48240, 151, 'Garona\'s Helmet of Triumph', 'Triumphant Garona\'s Battlegear'),
(4, 48239, 151, 'Garona\'s Legplates of Triumph', 'Triumphant Garona\'s Battlegear'),
(4, 48238, 151, 'Garona\'s Pauldrons of Triumph', 'Triumphant Garona\'s Battlegear');

-- Insert Armor Sets for Conqueror's Nobundo's Garb Item Set 861
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 48824, 861, 'Nobundo\'s Handguards', 'Conqueror\'s Nobundo\'s Garb'),
(7, 48825, 861, 'Nobundo\'s Headpiece', 'Conqueror\'s Nobundo\'s Garb'),
(7, 48826, 861, 'Nobundo\'s Legguards', 'Conqueror\'s Nobundo\'s Garb'),
(7, 48827, 861, 'Nobundo\'s Spaulders', 'Conqueror\'s Nobundo\'s Garb'),
(7, 48828, 861, 'Nobundo\'s Tunic', 'Conqueror\'s Nobundo\'s Garb');

-- Insert Armor Sets for Triumphant Nobundo's Garb Item Set 154
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 48286, 154, 'Nobundo\'s Handguards of Triumph', 'Triumphant Nobundo\'s Garb'),
(7, 48287, 154, 'Nobundo\'s Headpiece of Triumph', 'Triumphant Nobundo\'s Garb'),
(7, 48288, 154, 'Nobundo\'s Legguards of Triumph', 'Triumphant Nobundo\'s Garb'),
(7, 48289, 154, 'Nobundo\'s Spaulders of Triumph', 'Triumphant Nobundo\'s Garb'),
(7, 48285, 154, 'Nobundo\'s Tunic of Triumph', 'Triumphant Nobundo\'s Garb');

-- Insert Armor Sets for Nobundo's Battlegear Item Set 856
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 48846, 856, 'Nobundo\'s Chestguard', 'Nobundo\'s Battlegear'),
(7, 48847, 856, 'Nobundo\'s Faceguard', 'Nobundo\'s Battlegear'),
(7, 48848, 856, 'Nobundo\'s Grips', 'Nobundo\'s Battlegear'),
(7, 48849, 856, 'Nobundo\'s Shoulderguards', 'Nobundo\'s Battlegear'),
(7, 48850, 856, 'Nobundo\'s War-Kilt', 'Nobundo\'s Battlegear');

-- Insert Armor Sets for Triumphant Nobundo's Battlegear Item Set 158
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 48346, 158, 'Nobundo\'s Chestguard of Triumph', 'Triumphant Nobundo\'s Battlegear'),
(7, 48348, 158, 'Nobundo\'s Faceguard of Triumph', 'Triumphant Nobundo\'s Battlegear'),
(7, 48347, 158, 'Nobundo\'s Grips of Triumph', 'Triumphant Nobundo\'s Battlegear'),
(7, 48350, 158, 'Nobundo\'s Shoulderguards of Triumph', 'Triumphant Nobundo\'s Battlegear'),
(7, 48349, 158, 'Nobundo\'s War-Kilt of Triumph', 'Triumphant Nobundo\'s Battlegear');

-- Insert Armor Sets for Nobundo's Regalia Item Set 864
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 48836, 864, 'Nobundo\'s Gloves', 'Nobundo\'s Regalia'),
(7, 48837, 864, 'Nobundo\'s Hauberk', 'Nobundo\'s Regalia'),
(7, 48838, 864, 'Nobundo\'s Helm', 'Nobundo\'s Regalia'),
(7, 48839, 864, 'Nobundo\'s Kilt', 'Nobundo\'s Regalia'),
(7, 48840, 864, 'Nobundo\'s Shoulderpads', 'Nobundo\'s Regalia');

-- Insert Armor Sets for Triumphant Nobundo's Regalia Item Set 157
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 48317, 157, 'Nobundo\'s Gloves of Triumph', 'Triumphant Nobundo\'s Regalia'),
(7, 48316, 157, 'Nobundo\'s Hauberk of Triumph', 'Triumphant Nobundo\'s Regalia'),
(7, 48318, 157, 'Nobundo\'s Helm of Triumph', 'Triumphant Nobundo\'s Regalia'),
(7, 48319, 157, 'Nobundo\'s Kilt of Triumph', 'Triumphant Nobundo\'s Regalia'),
(7, 48320, 157, 'Nobundo\'s Shoulderpads of Triumph', 'Triumphant Nobundo\'s Regalia');

-- Insert Armor Sets for Thrall's Garb Item Set 862
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 48829, 862, 'Thrall\'s Handguards', 'Thrall\'s Garb'),
(7, 48830, 862, 'Thrall\'s Headpiece', 'Thrall\'s Garb'),
(7, 48831, 862, 'Thrall\'s Legguards', 'Thrall\'s Garb'),
(7, 48832, 862, 'Thrall\'s Spaulders', 'Thrall\'s Garb'),
(7, 48833, 862, 'Thrall\'s Tunic', 'Thrall\'s Garb');

-- Insert Armor Sets for Triumphant Thrall's Garb Item Set 155
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 48301, 155, 'Thrall\'s Handguards of Triumph', 'Triumphant Thrall\'s Garb'),
(7, 48302, 155, 'Thrall\'s Headpiece of Triumph', 'Triumphant Thrall\'s Garb'),
(7, 48303, 155, 'Thrall\'s Legguards of Triumph', 'Triumphant Thrall\'s Garb'),
(7, 48304, 155, 'Thrall\'s Spaulders of Triumph', 'Triumphant Thrall\'s Garb'),
(7, 48300, 155, 'Thrall\'s Tunic of Triumph', 'Triumphant Thrall\'s Garb');

-- Insert Armor Sets for Thrall's Battlegear Item Set 824
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 48370, 824, 'Thrall\'s Shoulderguards of Conquest', 'Thrall\'s Battlegear'),
(7, 48369, 824, 'Thrall\'s War-Kilt of Conquest', 'Thrall\'s Battlegear'),
(7, 48368, 824, 'Thrall\'s Faceguard of Conquest', 'Thrall\'s Battlegear'),
(7, 48367, 824, 'Thrall\'s Grips of Conquest', 'Thrall\'s Battlegear'),
(7, 48366, 824, 'Thrall\'s Chestguard of Conquest', 'Thrall\'s Battlegear');

-- Insert Armor Sets for Triumphant Thrall's Battlegear Item Set 159
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 48361, 159, 'Thrall\'s Shoulderguards of Triumph', 'Triumphant Thrall\'s Battlegear'),
(7, 48362, 159, 'Thrall\'s War-Kilt of Triumph', 'Triumphant Thrall\'s Battlegear'),
(7, 48363, 159, 'Thrall\'s Faceguard of Triumph', 'Triumphant Thrall\'s Battlegear'),
(7, 48364, 159, 'Thrall\'s Grips of Triumph', 'Triumphant Thrall\'s Battlegear'),
(7, 48365, 159, 'Thrall\'s Chestguard of Triumph', 'Triumphant Thrall\'s Battlegear');

-- Insert Armor Sets for Thrall's Regalia Item Set 863
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 48841, 863, 'Thrall\'s Gloves', 'Thrall\'s Regalia'),
(7, 48842, 863, 'Thrall\'s Hauberk', 'Thrall\'s Regalia'),
(7, 48843, 863, 'Thrall\'s Helm', 'Thrall\'s Regalia'),
(7, 48844, 863, 'Thrall\'s Kilt', 'Thrall\'s Regalia'),
(7, 48845, 863, 'Thrall\'s Shoulderpads', 'Thrall\'s Regalia');

-- Insert Armor Sets for Triumphant Thrall's Regalia Item Set 156
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 48334, 156, 'Thrall\'s Gloves of Triumph', 'Triumphant Thrall\'s Regalia'),
(7, 48335, 156, 'Thrall\'s Hauberk of Triumph', 'Triumphant Thrall\'s Regalia'),
(7, 48333, 156, 'Thrall\'s Helm of Triumph', 'Triumphant Thrall\'s Regalia'),
(7, 48332, 156, 'Thrall\'s Kilt of Triumph', 'Triumphant Thrall\'s Regalia'),
(7, 48331, 156, 'Thrall\'s Shoulderpads of Triumph', 'Triumphant Thrall\'s Regalia');

-- Insert Armor Sets for Kel'Thuzad's Regalia Item Set 846
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 48740, 846, 'Kel\'Thuzad\'s Gloves', 'Kel\'Thuzad\'s Regalia'),
(8, 48741, 846, 'Kel\'Thuzad\'s Hood', 'Kel\'Thuzad\'s Regalia'),
(8, 48742, 846, 'Kel\'Thuzad\'s Leggings', 'Kel\'Thuzad\'s Regalia'),
(8, 48743, 846, 'Kel\'Thuzad\'s Robe', 'Kel\'Thuzad\'s Regalia'),
(8, 48744, 846, 'Kel\'Thuzad\'s Shoulderpads', 'Kel\'Thuzad\'s Regalia');

-- Insert Armor Sets for Triumphant Kel'Thuzad's Regalia Item Set 139
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 47782, 139, 'Kel\'Thuzad\'s Gloves of Triumph', 'Triumphant Kel\'Thuzad\'s Regalia'),
(8, 47778, 139, 'Kel\'Thuzad\'s Hood of Triumph', 'Triumphant Kel\'Thuzad\'s Regalia'),
(8, 47780, 139, 'Kel\'Thuzad\'s Leggings of Triumph', 'Triumphant Kel\'Thuzad\'s Regalia'),
(8, 47779, 139, 'Kel\'Thuzad\'s Robe of Triumph', 'Triumphant Kel\'Thuzad\'s Regalia'),
(8, 47781, 139, 'Kel\'Thuzad\'s Shoulderpads of Triumph', 'Triumphant Kel\'Thuzad\'s Regalia');

-- Insert Armor Sets for Gul'dan's Regalia Item Set 845
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 48735, 845, 'Gul\'dan\'s Gloves', 'Gul\'dan\'s Regalia'),
(8, 48736, 845, 'Gul\'dan\'s Hood', 'Gul\'dan\'s Regalia'),
(8, 48737, 845, 'Gul\'dan\'s Leggings', 'Gul\'dan\'s Regalia'),
(8, 48738, 845, 'Gul\'dan\'s Robe', 'Gul\'dan\'s Regalia'),
(8, 48739, 845, 'Gul\'dan\'s Shoulderpads', 'Gul\'dan\'s Regalia');

-- Insert Armor Sets for Triumphant Gul'dan's Regalia Item Set 138
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 47803, 138, 'Gul\'dan\'s Gloves of Triumph', 'Triumphant Gul\'dan\'s Regalia'),
(8, 47804, 138, 'Gul\'dan\'s Hood of Triumph', 'Triumphant Gul\'dan\'s Regalia'),
(8, 47805, 138, 'Gul\'dan\'s Leggings of Triumph', 'Triumphant Gul\'dan\'s Regalia'),
(8, 47806, 138, 'Gul\'dan\'s Robe of Triumph', 'Triumphant Gul\'dan\'s Regalia'),
(8, 47807, 138, 'Gul\'dan\'s Shoulderpads of Triumph', 'Triumphant Gul\'dan\'s Regalia');

-- Insert Armor Sets for Wrynn's Battlegear Item Set 867
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 48865, 867, 'Wrynn\'s Battleplate', 'Wrynn\'s Battlegear'),
(4, 48866, 867, 'Wrynn\'s Gauntlets', 'Wrynn\'s Battlegear'),
(4, 48867, 867, 'Wrynn\'s Helmet', 'Wrynn\'s Battlegear'),
(4, 48868, 867, 'Wrynn\'s Legplates', 'Wrynn\'s Battlegear'),
(4, 48869, 867, 'Wrynn\'s Shoulderplates', 'Wrynn\'s Battlegear');

-- Insert Armor Sets for Triumphant Wrynn's Battlegear Item Set 160
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 48376, 160, 'Wrynn\'s Battleplate of Triumph', 'Triumphant Wrynn\'s Battlegear'),
(4, 48377, 160, 'Wrynn\'s Gauntlets of Triumph', 'Triumphant Wrynn\'s Battlegear'),
(4, 48378, 160, 'Wrynn\'s Helmet of Triumph', 'Triumphant Wrynn\'s Battlegear'),
(4, 48379, 160, 'Wrynn\'s Legplates of Triumph', 'Triumphant Wrynn\'s Battlegear'),
(4, 48380, 160, 'Wrynn\'s Shoulderplates of Triumph', 'Triumphant Wrynn\'s Battlegear');

-- Insert Armor Sets for Wrynn's Plate Item Set 869
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 48875, 869, 'Wrynn\'s Breastplate', 'Wrynn\'s Plate'),
(4, 48876, 869, 'Wrynn\'s Greathelm', 'Wrynn\'s Plate'),
(4, 48877, 869, 'Wrynn\'s Handguards', 'Wrynn\'s Plate'),
(4, 48878, 869, 'Wrynn\'s Legguards', 'Wrynn\'s Plate'),
(4, 48879, 869, 'Wrynn\'s Pauldrons', 'Wrynn\'s Plate');

-- Insert Armor Sets for Triumphant Wrynn's Plate Item Set 162
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 48450, 162, 'Wrynn\'s Breastplate of Triumph', 'Triumphant Wrynn\'s Plate'),
(4, 48430, 162, 'Wrynn\'s Greathelm of Triumph', 'Triumphant Wrynn\'s Plate'),
(4, 48452, 162, 'Wrynn\'s Handguards of Triumph', 'Triumphant Wrynn\'s Plate'),
(4, 48446, 162, 'Wrynn\'s Legguards of Triumph', 'Triumphant Wrynn\'s Plate'),
(4, 48454, 162, 'Wrynn\'s Pauldrons of Triumph', 'Triumphant Wrynn\'s Plate');

-- Insert Armor Sets for Hellscream's Battlegear Item Set 868
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 48860, 868, 'Hellscream\'s Battleplate', 'Hellscream\'s Battlegear'),
(4, 48861, 868, 'Hellscream\'s Gauntlets', 'Hellscream\'s Battlegear'),
(4, 48862, 868, 'Hellscream\'s Helmet', 'Hellscream\'s Battlegear'),
(4, 48863, 868, 'Hellscream\'s Legplates', 'Hellscream\'s Battlegear'),
(4, 48864, 868, 'Hellscream\'s Shoulderplates', 'Hellscream\'s Battlegear');

-- Insert Armor Sets for Triumphant Hellscream's Battlegear Item Set 161
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 48391, 161, 'Hellscream\'s Battleplate of Triumph', 'Triumphant Hellscream\'s Battlegear'),
(4, 48392, 161, 'Hellscream\'s Gauntlets of Triumph', 'Triumphant Hellscream\'s Battlegear'),
(4, 48393, 161, 'Hellscream\'s Helmet of Triumph', 'Triumphant Hellscream\'s Battlegear'),
(4, 48394, 161, 'Hellscream\'s Legplates of Triumph', 'Triumphant Hellscream\'s Battlegear'),
(4, 48395, 161, 'Hellscream\'s Shoulderplates of Triumph', 'Triumphant Hellscream\'s Battlegear');

-- Insert Armor Sets for Hellscream's Plate Item Set 870
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 48870, 870, 'Hellscream\'s Breastplate', 'Hellscream\'s Plate'),
(4, 48871, 870, 'Hellscream\'s Greathelm', 'Hellscream\'s Plate'),
(4, 48872, 870, 'Hellscream\'s Handguards', 'Hellscream\'s Plate'),
(4, 48873, 870, 'Hellscream\'s Legguards', 'Hellscream\'s Plate'),
(4, 48874, 870, 'Hellscream\'s Pauldrons', 'Hellscream\'s Plate');

-- Insert Armor Sets for Triumphant Hellscream's Plate Item Set 163
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 48461, 163, 'Hellscream\'s Breastplate of Triumph', 'Triumphant Hellscream\'s Plate'),
(4, 48463, 163, 'Hellscream\'s Greathelm of Triumph', 'Triumphant Hellscream\'s Plate'),
(4, 48462, 163, 'Hellscream\'s Handguards of Triumph', 'Triumphant Hellscream\'s Plate'),
(4, 48464, 163, 'Hellscream\'s Legguards of Triumph', 'Triumphant Hellscream\'s Plate'),
(4, 48465, 163, 'Hellscream\'s Pauldrons of Triumph', 'Triumphant Hellscream\'s Plate');





-- [[ Tier 10 Sets ]]



-- Insert Armor Sets for Scourgelord's Battlegear Item Set 897
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 51686, 897, 'Scourgelord Battleplate', 'Scourgelord\'s Battlegear'),
(6, 51685, 897, 'Scourgelord Gauntlets', 'Scourgelord\'s Battlegear'),
(6, 51684, 897, 'Scourgelord Helmet', 'Scourgelord\'s Battlegear'),
(6, 51683, 897, 'Scourgelord Legplates', 'Scourgelord\'s Battlegear'),
(6, 51682, 897, 'Scourgelord Shoulderplates', 'Scourgelord\'s Battlegear');

-- Insert Armor Sets for Sanctified Scourgelord's Battlegear Item Set 261
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 51310, 261, 'Sanctified Scourgelord Battleplate', 'Sanctified Scourgelord\'s Battlegear'),
(6, 51311, 261, 'Sanctified Scourgelord Gauntlets', 'Sanctified Scourgelord\'s Battlegear'),
(6, 51312, 261, 'Sanctified Scourgelord Helmet', 'Sanctified Scourgelord\'s Battlegear'),
(6, 51313, 261, 'Sanctified Scourgelord Legplates', 'Sanctified Scourgelord\'s Battlegear'),
(6, 51314, 261, 'Sanctified Scourgelord Shoulderplates', 'Sanctified Scourgelord\'s Battlegear');

-- Insert Armor Sets for Scourgelord's Plate Item Set 898
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 51691, 898, 'Scourgelord Pauldrons', 'Scourgelord\'s Plate'),
(6, 51690, 898, 'Scourgelord Legguards', 'Scourgelord\'s Plate'),
(6, 51689, 898, 'Scourgelord Faceguard', 'Scourgelord\'s Plate'),
(6, 51688, 898, 'Scourgelord Handguards', 'Scourgelord\'s Plate'),
(6, 51687, 898, 'Scourgelord Chestguard', 'Scourgelord\'s Plate');

-- Insert Armor Sets for Sanctified Scourgelord's Plate Item Set 262
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(6, 51309, 262, 'Sanctified Scourgelord Pauldrons', 'Sanctified Scourgelord\'s Plate'),
(6, 51308, 262, 'Sanctified Scourgelord Legguards', 'Sanctified Scourgelord\'s Plate'),
(6, 51306, 262, 'Sanctified Scourgelord Faceguard', 'Sanctified Scourgelord\'s Plate'),
(6, 51307, 262, 'Sanctified Scourgelord Handguards', 'Sanctified Scourgelord\'s Plate'),
(6, 51305, 262, 'Sanctified Scourgelord Chestguard', 'Sanctified Scourgelord\'s Plate');

-- Insert Armor Sets for Lasherweave Garb Item Set 887
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 51696, 887, 'Lasherweave Robes', 'Lasherweave Garb'),
(11, 51695, 887, 'Lasherweave Gauntlets', 'Lasherweave Garb'),
(11, 51694, 887, 'Lasherweave Helmet', 'Lasherweave Garb'),
(11, 51693, 887, 'Lasherweave Legplates', 'Lasherweave Garb'),
(11, 51692, 887, 'Lasherweave Pauldrons', 'Lasherweave Garb');

-- Insert Armor Sets for Sanctified Lasherweave Garb Item Set 251
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 51300, 251, 'Sanctified Lasherweave Robes', 'Sanctified Lasherweave Garb'),
(11, 51301, 251, 'Sanctified Lasherweave Gauntlets', 'Sanctified Lasherweave Garb'),
(11, 51302, 251, 'Sanctified Lasherweave Helmet', 'Sanctified Lasherweave Garb'),
(11, 51303, 251, 'Sanctified Lasherweave Legplates', 'Sanctified Lasherweave Garb'),
(11, 51304, 251, 'Sanctified Lasherweave Pauldrons', 'Sanctified Lasherweave Garb');

-- Insert Armor Sets for Lasherweave Regalia Item Set 888
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 51706, 888, 'Lasherweave Mantle', 'Lasherweave Regalia'),
(11, 51705, 888, 'Lasherweave Trousers', 'Lasherweave Regalia'),
(11, 51704, 888, 'Lasherweave Cover', 'Lasherweave Regalia'),
(11, 51703, 888, 'Lasherweave Gloves', 'Lasherweave Regalia'),
(11, 51702, 888, 'Lasherweave Vestment', 'Lasherweave Regalia');

-- Insert Armor Sets for Sanctified Lasherweave Regalia Item Set 252
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 51292, 252, 'Sanctified Lasherweave Mantle', 'Sanctified Lasherweave Regalia'),
(11, 51293, 252, 'Sanctified Lasherweave Trousers', 'Sanctified Lasherweave Regalia'),
(11, 51290, 252, 'Sanctified Lasherweave Cover', 'Sanctified Lasherweave Regalia'),
(11, 51291, 252, 'Sanctified Lasherweave Gloves', 'Sanctified Lasherweave Regalia'),
(11, 51294, 252, 'Sanctified Lasherweave Vestment', 'Sanctified Lasherweave Regalia');

-- Insert Armor Sets for Lasherweave Battlegear Item Set 889
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 51701, 889, 'Lasherweave Shoulderpads', 'Lasherweave Battlegear'),
(11, 51700, 889, 'Lasherweave Legguards', 'Lasherweave Battlegear'),
(11, 51699, 889, 'Lasherweave Headguard', 'Lasherweave Battlegear'),
(11, 51698, 889, 'Lasherweave Handgrips', 'Lasherweave Battlegear'),
(11, 51697, 889, 'Lasherweave Raiment', 'Lasherweave Battlegear');

-- Insert Armor Sets for Sanctified Lasherweave Battlegear Item Set 253
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 51299, 253, 'Sanctified Lasherweave Shoulderpads', 'Sanctified Lasherweave Battlegear'),
(11, 51297, 253, 'Sanctified Lasherweave Legguards', 'Sanctified Lasherweave Battlegear'),
(11, 51296, 253, 'Sanctified Lasherweave Headguard', 'Sanctified Lasherweave Battlegear'),
(11, 51295, 253, 'Sanctified Lasherweave Handgrips', 'Sanctified Lasherweave Battlegear'),
(11, 51298, 253, 'Sanctified Lasherweave Raiment', 'Sanctified Lasherweave Battlegear');

-- Insert Armor Sets for Ahn'Kahar Blood Hunter's Battlegear Item Set 891
INSERT INTO black_market_armor_sets (class,item_id,name,item_set_id,set_name) VALUES
	 (3,51708,'Ahn''Kahar Blood Hunter''s Spaulders',891,'Ahn''Kahar Blood Hunter''s Battlegear'),
	 (3,51709,'Ahn''Kahar Blood Hunter''s Legguards',891,'Ahn''Kahar Blood Hunter''s Battlegear'),
	 (3,51710,'Ahn''Kahar Blood Hunter''s Headpiece',891,'Ahn''Kahar Blood Hunter''s Battlegear'),
	 (3,51711,'Ahn''Kahar Blood Hunter''s Handguards',891,'Ahn''Kahar Blood Hunter''s Battlegear'),
	 (3,51707,'Ahn''Kahar Blood Hunter''s Tunic',891,'Ahn''Kahar Blood Hunter''s Battlegear');


-- Insert Armor Sets for Sanctified Ahn'Kahar Blood Hunter's Battlegear Item Set 259
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(3, 51150, 259, 'Sanctified Ahn\'Kahar Blood Hunter\'s Tunic', 'Sanctified Ahn\'Kahar Blood Hunter\'s Battlegear'),
(3, 51151, 259, 'Sanctified Ahn\'Kahar Blood Hunter\'s Handguards', 'Sanctified Ahn\'Kahar Blood Hunter\'s Battlegear'),
(3, 51152, 259, 'Sanctified Ahn\'Kahar Blood Hunter\'s Headpiece', 'Sanctified Ahn\'Kahar Blood Hunter\'s Battlegear'),
(3, 51153, 259, 'Sanctified Ahn\'Kahar Blood Hunter\'s Legguards', 'Sanctified Ahn\'Kahar Blood Hunter\'s Battlegear'),
(3, 51154, 259, 'Sanctified Ahn\'Kahar Blood Hunter\'s Spaulders', 'Sanctified Ahn\'Kahar Blood Hunter\'s Battlegear');

-- Bloodmage's Regalia Item Set 883
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 51716, 883, 'Bloodmage Gloves', 'Bloodmage\'s Regalia'),
(8, 51715, 883, 'Bloodmage Hood', 'Bloodmage\'s Regalia'),
(8, 51714, 883, 'Bloodmage Leggings', 'Bloodmage\'s Regalia'),
(8, 51713, 883, 'Bloodmage Robe', 'Bloodmage\'s Regalia'),
(8, 51712, 883, 'Bloodmage Shoulderpads', 'Bloodmage\'s Regalia');

-- Sanctified Bloodmage's Regalia Item Set 247
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 51280, 247, 'Sanctified Bloodmage Gloves', 'Sanctified Bloodmage\'s Regalia'),
(8, 51281, 247, 'Sanctified Bloodmage Hood', 'Sanctified Bloodmage\'s Regalia'),
(8, 51282, 247, 'Sanctified Bloodmage Leggings', 'Sanctified Bloodmage\'s Regalia'),
(8, 51283, 247, 'Sanctified Bloodmage Robe', 'Sanctified Bloodmage\'s Regalia'),
(8, 51284, 247, 'Sanctified Bloodmage Shoulderpads', 'Sanctified Bloodmage\'s Regalia');

-- Lightsworn Garb Item Set 899
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 51726, 899, 'Lightsworn Spaulders', 'Lightsworn Garb'),
(2, 51725, 899, 'Lightsworn Greaves', 'Lightsworn Garb'),
(2, 51724, 899, 'Lightsworn Headpiece', 'Lightsworn Garb'),
(2, 51723, 899, 'Lightsworn Gloves', 'Lightsworn Garb'),
(2, 51722, 899, 'Lightsworn Tunic', 'Lightsworn Garb');

-- Sanctified Lightsworn Garb Item Set 263
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 51273, 263, 'Sanctified Lightsworn Spaulders', 'Sanctified Lightsworn Garb'),
(2, 51271, 263, 'Sanctified Lightsworn Greaves', 'Sanctified Lightsworn Garb'),
(2, 51272, 263, 'Sanctified Lightsworn Headpiece', 'Sanctified Lightsworn Garb'),
(2, 51270, 263, 'Sanctified Lightsworn Gloves', 'Sanctified Lightsworn Garb'),
(2, 51274, 263, 'Sanctified Lightsworn Tunic', 'Sanctified Lightsworn Garb');

-- Lightsworn Plate Item Set 901
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 51731, 901, 'Lightsworn Shoulderguards', 'Lightsworn Plate'),
(2, 51730, 901, 'Lightsworn Legguards', 'Lightsworn Plate'),
(2, 51729, 901, 'Lightsworn Faceguard', 'Lightsworn Plate'),
(2, 51728, 901, 'Lightsworn Handguards', 'Lightsworn Plate'),
(2, 51727, 901, 'Lightsworn Chestguard', 'Lightsworn Plate');

-- Sanctified Lightsworn Plate Item Set 265
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 51269, 265, 'Sanctified Lightsworn Shoulderguards', 'Sanctified Lightsworn Plate'),
(2, 51268, 265, 'Sanctified Lightsworn Legguards', 'Sanctified Lightsworn Plate'),
(2, 51266, 265, 'Sanctified Lightsworn Faceguard', 'Sanctified Lightsworn Plate'),
(2, 51267, 265, 'Sanctified Lightsworn Handguards', 'Sanctified Lightsworn Plate'),
(2, 51265, 265, 'Sanctified Lightsworn Chestguard', 'Sanctified Lightsworn Plate');

-- Lightsworn Battlegear Item Set 900
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 51721, 900, 'Lightsworn Shoulderplates', 'Lightsworn Battlegear'),
(2, 51720, 900, 'Lightsworn Legplates', 'Lightsworn Battlegear'),
(2, 51719, 900, 'Lightsworn Helmet', 'Lightsworn Battlegear'),
(2, 51718, 900, 'Lightsworn Gauntlets', 'Lightsworn Battlegear'),
(2, 51717, 900, 'Lightsworn Battleplate', 'Lightsworn Battlegear');

-- Sanctified Lightsworn Battlegear Item Set 264
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 51279, 264, 'Sanctified Lightsworn Shoulderplates', 'Sanctified Lightsworn Battlegear'),
(2, 51278, 264, 'Sanctified Lightsworn Legplates', 'Sanctified Lightsworn Battlegear'),
(2, 51277, 264, 'Sanctified Lightsworn Helmet', 'Sanctified Lightsworn Battlegear'),
(2, 51276, 264, 'Sanctified Lightsworn Gauntlets', 'Sanctified Lightsworn Battlegear'),
(2, 51275, 264, 'Sanctified Lightsworn Battleplate', 'Sanctified Lightsworn Battlegear');

-- Crimson Acolyte's Regalia Item Set 886
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 51741, 886, 'Crimson Acolyte Pants', 'Crimson Acolyte\'s Regalia'),
(9, 51740, 886, 'Crimson Acolyte Raiments', 'Crimson Acolyte\'s Regalia'),
(9, 51739, 886, 'Crimson Acolyte Mantle', 'Crimson Acolyte\'s Regalia'),
(9, 51738, 886, 'Crimson Acolyte Handwraps', 'Crimson Acolyte\'s Regalia'),
(9, 51737, 886, 'Crimson Acolyte Cowl', 'Crimson Acolyte\'s Regalia');

-- Sanctified Crimson Acolyte's Regalia Item Set 250
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 51258, 250, 'Sanctified Crimson Acolyte Pants', 'Sanctified Crimson Acolyte\'s Regalia'),
(9, 51259, 250, 'Sanctified Crimson Acolyte Raiments', 'Sanctified Crimson Acolyte\'s Regalia'),
(9, 51257, 250, 'Sanctified Crimson Acolyte Mantle', 'Sanctified Crimson Acolyte\'s Regalia'),
(9, 51256, 250, 'Sanctified Crimson Acolyte Handwraps', 'Sanctified Crimson Acolyte\'s Regalia'),
(9, 51255, 250, 'Sanctified Crimson Acolyte Cowl', 'Sanctified Crimson Acolyte\'s Regalia');

-- Crimson Acolyte's Raiment Item Set 885
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 51732, 885, 'Crimson Acolyte Leggings', 'Crimson Acolyte\'s Raiment'),
(9, 51733, 885, 'Crimson Acolyte Robe', 'Crimson Acolyte\'s Raiment'),
(9, 51734, 885, 'Crimson Acolyte Shoulderpads', 'Crimson Acolyte\'s Raiment'),
(9, 51735, 885, 'Crimson Acolyte Gloves', 'Crimson Acolyte\'s Raiment'),
(9, 51736, 885, 'Crimson Acolyte Hood', 'Crimson Acolyte\'s Raiment');

-- Sanctified Crimson Acolyte's Raiment Item Set 249
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 51262, 249, 'Sanctified Crimson Acolyte Leggings', 'Sanctified Crimson Acolyte\'s Raiment'),
(9, 51263, 249, 'Sanctified Crimson Acolyte Robe', 'Sanctified Crimson Acolyte\'s Raiment'),
(9, 51264, 249, 'Sanctified Crimson Acolyte Shoulderpads', 'Sanctified Crimson Acolyte\'s Raiment'),
(9, 51260, 249, 'Sanctified Crimson Acolyte Gloves', 'Sanctified Crimson Acolyte\'s Raiment'),
(9, 51261, 249, 'Sanctified Crimson Acolyte Hood', 'Sanctified Crimson Acolyte\'s Raiment');

-- Shadowblade's Battlegear Item Set 890
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 51746, 890, 'Shadowblade Pauldrons', 'Shadowblade\'s Battlegear'),
(4, 51745, 890, 'Shadowblade Helmet', 'Shadowblade\'s Battlegear'),
(4, 51744, 890, 'Shadowblade Legplates', 'Shadowblade\'s Battlegear'),
(4, 51743, 890, 'Shadowblade Breastplate', 'Shadowblade\'s Battlegear'),
(4, 51742, 890, 'Shadowblade Gauntlets', 'Shadowblade\'s Battlegear');

-- Sanctified Shadowblade's Battlegear Item Set 254
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 51254, 254, 'Sanctified Shadowblade Pauldrons', 'Sanctified Shadowblade\'s Battlegear'),
(4, 51252, 254, 'Sanctified Shadowblade Helmet', 'Sanctified Shadowblade\'s Battlegear'),
(4, 51253, 254, 'Sanctified Shadowblade Legplates', 'Sanctified Shadowblade\'s Battlegear'),
(4, 51250, 254, 'Sanctified Shadowblade Breastplate', 'Sanctified Shadowblade\'s Battlegear'),
(4, 51251, 254, 'Sanctified Shadowblade Gauntlets', 'Sanctified Shadowblade\'s Battlegear');

-- Frost Witch's Garb Item Set 892
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 51747, 892, 'Frost Witch\'s Tunic', 'Frost Witch\'s Garb'),
(9, 51748, 892, 'Frost Witch\'s Handguards', 'Frost Witch\'s Garb'),
(9, 51749, 892, 'Frost Witch\'s Headpiece', 'Frost Witch\'s Garb'),
(9, 51750, 892, 'Frost Witch\'s Legguards', 'Frost Witch\'s Garb'),
(9, 51751, 892, 'Frost Witch\'s Spaulders', 'Frost Witch\'s Garb');

-- Sanctified Frost Witch's Garb Item Set 256
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 51249, 256, 'Sanctified Frost Witch\'s Tunic', 'Sanctified Frost Witch\'s Garb'),
(9, 51248, 256, 'Sanctified Frost Witch\'s Handguards', 'Sanctified Frost Witch\'s Garb'),
(9, 51247, 256, 'Sanctified Frost Witch\'s Headpiece', 'Sanctified Frost Witch\'s Garb'),
(9, 51246, 256, 'Sanctified Frost Witch\'s Legguards', 'Sanctified Frost Witch\'s Garb'),
(9, 51245, 256, 'Sanctified Frost Witch\'s Spaulders', 'Sanctified Frost Witch\'s Garb');

-- Frost Witch's Battlegear Item Set 894
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 51752, 894, 'Frost Witch\'s Chestguard', 'Frost Witch\'s Battlegear'),
(9, 51753, 894, 'Frost Witch\'s Grips', 'Frost Witch\'s Battlegear'),
(9, 51754, 894, 'Frost Witch\'s Faceguard', 'Frost Witch\'s Battlegear'),
(9, 51755, 894, 'Frost Witch\'s War-Kilt', 'Frost Witch\'s Battlegear'),
(9, 51756, 894, 'Frost Witch\'s Shoulderguards', 'Frost Witch\'s Battlegear');

-- Sanctified Frost Witch's Battlegear Item Set 258
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 51244, 258, 'Sanctified Frost Witch\'s Chestguard', 'Sanctified Frost Witch\'s Battlegear'),
(9, 51243, 258, 'Sanctified Frost Witch\'s Grips', 'Sanctified Frost Witch\'s Battlegear'),
(9, 51242, 258, 'Sanctified Frost Witch\'s Faceguard', 'Sanctified Frost Witch\'s Battlegear'),
(9, 51241, 258, 'Sanctified Frost Witch\'s War-Kilt', 'Sanctified Frost Witch\'s Battlegear'),
(9, 51240, 258, 'Sanctified Frost Witch\'s Shoulderguards', 'Sanctified Frost Witch\'s Battlegear');

-- Frost Witch's Regalia Item Set 893
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 51757, 893, 'Frost Witch\'s Hauberk', 'Frost Witch\'s Regalia'),
(9, 51758, 893, 'Frost Witch\'s Gloves', 'Frost Witch\'s Regalia'),
(9, 51759, 893, 'Frost Witch\'s Helm', 'Frost Witch\'s Regalia'),
(9, 51760, 893, 'Frost Witch\'s Kilt', 'Frost Witch\'s Regalia'),
(9, 51761, 893, 'Frost Witch\'s Shoulderpads', 'Frost Witch\'s Regalia');

-- Sanctified Frost Witch's Regalia Item Set 257
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 51239, 257, 'Sanctified Frost Witch\'s Hauberk', 'Sanctified Frost Witch\'s Regalia'),
(9, 51238, 257, 'Sanctified Frost Witch\'s Gloves', 'Sanctified Frost Witch\'s Regalia'),
(9, 51237, 257, 'Sanctified Frost Witch\'s Helm', 'Sanctified Frost Witch\'s Regalia'),
(9, 51236, 257, 'Sanctified Frost Witch\'s Kilt', 'Sanctified Frost Witch\'s Regalia'),
(9, 51235, 257, 'Sanctified Frost Witch\'s Shoulderpads', 'Sanctified Frost Witch\'s Regalia');

-- Dark Coven's Regalia Item Set 884
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 51766, 884, 'Dark Coven Gloves', 'Dark Coven\'s Regalia'),
(9, 51765, 884, 'Dark Coven Hood', 'Dark Coven\'s Regalia'),
(9, 51764, 884, 'Dark Coven Leggings', 'Dark Coven\'s Regalia'),
(9, 51763, 884, 'Dark Coven Robe', 'Dark Coven\'s Regalia'),
(9, 51762, 884, 'Dark Coven Shoulderpads', 'Dark Coven\'s Regalia');

-- Sanctified Dark Coven's Regalia Item Set 248
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 51230, 248, 'Sanctified Dark Coven Gloves', 'Sanctified Dark Coven\'s Regalia'),
(9, 51231, 248, 'Sanctified Dark Coven Hood', 'Sanctified Dark Coven\'s Regalia'),
(9, 51232, 248, 'Sanctified Dark Coven Leggings', 'Sanctified Dark Coven\'s Regalia'),
(9, 51233, 248, 'Sanctified Dark Coven Robe', 'Sanctified Dark Coven\'s Regalia'),
(9, 51234, 248, 'Sanctified Dark Coven Shoulderpads', 'Sanctified Dark Coven\'s Regalia');

-- Ymirjar Lord's Battlegear Item Set 895
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 51771, 895, 'Ymirjar Lord\'s Battleplate', 'Ymirjar Lord\'s Battlegear'),
(2, 51770, 895, 'Ymirjar Lord\'s Gauntlets', 'Ymirjar Lord\'s Battlegear'),
(2, 51769, 895, 'Ymirjar Lord\'s Helmet', 'Ymirjar Lord\'s Battlegear'),
(2, 51768, 895, 'Ymirjar Lord\'s Legplates', 'Ymirjar Lord\'s Battlegear'),
(2, 51767, 895, 'Ymirjar Lord\'s Shoulderplates', 'Ymirjar Lord\'s Battlegear');

-- Sanctified Ymirjar Lord's Battlegear Item Set 259
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 51225, 259, 'Sanctified Ymirjar Lord\'s Battleplate', 'Sanctified Ymirjar Lord\'s Battlegear'),
(2, 51226, 259, 'Sanctified Ymirjar Lord\'s Gauntlets', 'Sanctified Ymirjar Lord\'s Battlegear'),
(2, 51227, 259, 'Sanctified Ymirjar Lord\'s Helmet', 'Sanctified Ymirjar Lord\'s Battlegear'),
(2, 51228, 259, 'Sanctified Ymirjar Lord\'s Legplates', 'Sanctified Ymirjar Lord\'s Battlegear'),
(2, 51229, 259, 'Sanctified Ymirjar Lord\'s Shoulderplates', 'Sanctified Ymirjar Lord\'s Battlegear');

-- Ymirjar Lord's Plate Item Set 896
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 51776, 896, 'Ymirjar Lord\'s Pauldrons', 'Ymirjar Lord\'s Plate'),
(2, 51775, 896, 'Ymirjar Lord\'s Legguards', 'Ymirjar Lord\'s Plate'),
(2, 51774, 896, 'Ymirjar Lord\'s Greathelm', 'Ymirjar Lord\'s Plate'),
(2, 51773, 896, 'Ymirjar Lord\'s Handguards', 'Ymirjar Lord\'s Plate'),
(2, 51772, 896, 'Ymirjar Lord\'s Breastplate', 'Ymirjar Lord\'s Plate');

-- Sanctified Ymirjar Lord's Plate Item Set 260
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 51224, 260, 'Sanctified Ymirjar Lord\'s Pauldrons', 'Sanctified Ymirjar Lord\'s Plate'),
(2, 51223, 260, 'Sanctified Ymirjar Lord\'s Legguards', 'Sanctified Ymirjar Lord\'s Plate'),
(2, 51221, 260, 'Sanctified Ymirjar Lord\'s Greathelm', 'Sanctified Ymirjar Lord\'s Plate'),
(2, 51222, 260, 'Sanctified Ymirjar Lord\'s Handguards', 'Sanctified Ymirjar Lord\'s Plate'),
(2, 51220, 260, 'Sanctified Ymirjar Lord\'s Breastplate', 'Sanctified Ymirjar Lord\'s Plate');





-- [[ Arathi Basin Sets ]]





INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 20052, 471, 'Highlander\'s Leather Boots', 'The Highlander\'s Purpose'),
(11, 20045, 471, 'Highlander\'s Leather Girdle', 'The Highlander\'s Purpose'),
(11, 20059, 471, 'Highlander\'s Leather Shoulders', 'The Highlander\'s Purpose');

-- Insert Armor Sets for The Defiler's Purpose Item Set 486
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 20186, 486, 'Defiler\'s Leather Boots', 'The Defiler\'s Purpose'),
(11, 20190, 486, 'Defiler\'s Leather Girdle', 'The Defiler\'s Purpose'),
(11, 20194, 486, 'Defiler\'s Leather Shoulders', 'The Defiler\'s Purpose');

-- Insert Armor Sets for The Highlander's Will Item Set 472
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 20053, 472, 'Highlander\'s Lizardhide Boots', 'The Highlander\'s Will'),
(11, 20046, 472, 'Highlander\'s Lizardhide Girdle', 'The Highlander\'s Will'),
(11, 20060, 472, 'Highlander\'s Lizardhide Shoulders', 'The Highlander\'s Will');

-- Insert Armor Sets for The Defiler's Will Item Set 488
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(11, 20167, 488, 'Defiler\'s Lizardhide Boots', 'The Defiler\'s Will'),
(11, 20171, 488, 'Defiler\'s Lizardhide Girdle', 'The Defiler\'s Will'),
(11, 20175, 488, 'Defiler\'s Lizardhide Shoulders', 'The Defiler\'s Will');

-- Insert Armor Sets for The Highlander's Determination Item Set 469
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(3, 20043, 469, 'Highlander\'s Chain Girdle', 'The Highlander\'s Determination'),
(3, 20050, 469, 'Highlander\'s Chain Greaves', 'The Highlander\'s Determination'),
(3, 20055, 469, 'Highlander\'s Chain Pauldrons', 'The Highlander\'s Determination');

-- Insert Armor Sets for The Defiler's Determination Item Set (ID not provided)
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(3, 20158, 0, 'Defiler\'s Chain Pauldrons', 'The Defiler\'s Determination'),
(3, 20154, 0, 'Defiler\'s Chain Greaves', 'The Defiler\'s Determination'),
(3, 20150, 0, 'Defiler\'s Chain Girdle', 'The Defiler\'s Determination');

-- Insert Armor Sets for The Defiler's Fortitude Item Set 484
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(3, 20195, 484, 'Defiler\'s Mail Girdle', 'The Defiler\'s Fortitude'),
(3, 20199, 484, 'Defiler\'s Mail Greaves', 'The Defiler\'s Fortitude'),
(3, 20203, 484, 'Defiler\'s Mail Pauldrons', 'The Defiler\'s Fortitude');

-- Insert Armor Sets for The Highlander's Intent Item Set 473
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 20054, 473, 'Highlander\'s Cloth Boots', 'The Highlander\'s Intent'),
(8, 20047, 473, 'Highlander\'s Cloth Girdle', 'The Highlander\'s Intent'),
(8, 20061, 473, 'Highlander\'s Epaulets', 'The Highlander\'s Intent');

-- Insert Armor Sets for The Defiler's Intent Item Set 485
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(8, 20176, 485, 'Defiler\'s Epaulets', 'The Defiler\'s Intent'),
(8, 20159, 485, 'Defiler\'s Cloth Boots', 'The Defiler\'s Intent'),
(8, 20163, 485, 'Defiler\'s Cloth Girdle', 'The Defiler\'s Intent');

-- Insert Armor Sets for The Highlander's Resolution Item Set 467
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 20041, 467, 'Highlander\'s Plate Girdle', 'The Highlander\'s Resolution'),
(2, 20048, 467, 'Highlander\'s Plate Greaves', 'The Highlander\'s Resolution'),
(2, 20057, 467, 'Highlander\'s Plate Spaulders', 'The Highlander\'s Resolution');

-- Insert Armor Sets for The Highlander's Resolve Item Set 468
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(2, 20042, 468, 'Highlander\'s Lamellar Girdle', 'The Highlander\'s Resolve'),
(2, 20049, 468, 'Highlander\'s Lamellar Greaves', 'The Highlander\'s Resolve'),
(2, 20058, 468, 'Highlander\'s Lamellar Spaulders', 'The Highlander\'s Resolve');

-- Insert Armor Sets for The Highlander's Intent Item Set 473
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 20054, 473, 'Highlander\'s Cloth Boots', 'The Highlander\'s Intent'),
(5, 20047, 473, 'Highlander\'s Cloth Girdle', 'The Highlander\'s Intent'),
(5, 20061, 473, 'Highlander\'s Epaulets', 'The Highlander\'s Intent');

-- Insert Armor Sets for The Defiler's Intent Item Set 485
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(5, 20176, 485, 'Defiler\'s Epaulets', 'The Defiler\'s Intent'),
(5, 20159, 485, 'Defiler\'s Cloth Boots', 'The Defiler\'s Intent'),
(5, 20163, 485, 'Defiler\'s Cloth Girdle', 'The Defiler\'s Intent');

-- Insert Armor Sets for The Highlander's Purpose Item Set 471
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 20052, 471, 'Highlander\'s Leather Boots', 'The Highlander\'s Purpose'),
(4, 20045, 471, 'Highlander\'s Leather Girdle', 'The Highlander\'s Purpose'),
(4, 20059, 471, 'Highlander\'s Leather Shoulders', 'The Highlander\'s Purpose');

-- Insert Armor Sets for The Defiler's Purpose Item Set 486
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(4, 20186, 486, 'Defiler\'s Leather Boots', 'The Defiler\'s Purpose'),
(4, 20190, 486, 'Defiler\'s Leather Girdle', 'The Defiler\'s Purpose'),
(4, 20194, 486, 'Defiler\'s Leather Shoulders', 'The Defiler\'s Purpose');

-- Insert Armor Sets for The Defiler's Determination Item Set 483
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 20158, 483, 'Defiler\'s Chain Pauldrons', 'The Defiler\'s Determination'),
(7, 20154, 483, 'Defiler\'s Chain Greaves', 'The Defiler\'s Determination'),
(7, 20150, 483, 'Defiler\'s Chain Girdle', 'The Defiler\'s Determination');

-- Insert Armor Sets for The Defiler's Fortitude Item Set 484
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(7, 20195, 484, 'Defiler\'s Mail Girdle', 'The Defiler\'s Fortitude'),
(7, 20199, 484, 'Defiler\'s Mail Greaves', 'The Defiler\'s Fortitude'),
(7, 20203, 484, 'Defiler\'s Mail Pauldrons', 'The Defiler\'s Fortitude');

-- Insert Armor Sets for The Highlander's Intent Item Set 473
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 20054, 473, 'Highlander\'s Cloth Boots', 'The Highlander\'s Intent'),
(9, 20047, 473, 'Highlander\'s Cloth Girdle', 'The Highlander\'s Intent'),
(9, 20061, 473, 'Highlander\'s Epaulets', 'The Highlander\'s Intent');

-- Insert Armor Sets for The Defiler's Intent Item Set 485
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(9, 20176, 485, 'Defiler\'s Epaulets', 'The Defiler\'s Intent'),
(9, 20159, 485, 'Defiler\'s Cloth Boots', 'The Defiler\'s Intent'),
(9, 20163, 485, 'Defiler\'s Cloth Girdle', 'The Defiler\'s Intent');

-- Insert Armor Sets for The Highlander's Resolution Item Set 467
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 20041, 467, 'Highlander\'s Plate Girdle', 'The Highlander\'s Resolution'),
(1, 20048, 467, 'Highlander\'s Plate Greaves', 'The Highlander\'s Resolution'),
(1, 20057, 467, 'Highlander\'s Plate Spaulders', 'The Highlander\'s Resolution');

-- Insert Armor Sets for The Defiler's Resolution Item Set 487
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(1, 20204, 487, 'Defiler\'s Plate Girdle', 'The Defiler\'s Resolution'),
(1, 20208, 487, 'Defiler\'s Plate Greaves', 'The Defiler\'s Resolution'),
(1, 20212, 487, 'Defiler\'s Plate Spaulders', 'The Defiler\'s Resolution');





-- [[ Non-Class Sets ]]

-- Insert Armor Sets for Defias Leather Item Set 161
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 10399, 161, 'Blackened Defias Armor', 'Defias Leather'),
(0, 10403, 161, 'Blackened Defias Belt', 'Defias Leather'),
(0, 10402, 161, 'Blackened Defias Boots', 'Defias Leather'),
(0, 10401, 161, 'Blackened Defias Gloves', 'Defias Leather'),
(0, 10400, 161, 'Blackened Defias Leggings', 'Defias Leather');

-- Insert Armor Sets for Embrace of the Viper Item Set 162
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 10412, 162, 'Belt of the Fang', 'Embrace of the Viper'),
(0, 10411, 162, 'Footpads of the Fang', 'Embrace of the Viper'),
(0, 10413, 162, 'Gloves of the Fang', 'Embrace of the Viper'),
(0, 10410, 162, 'Leggings of the Fang', 'Embrace of the Viper'),
(0, 6473, 162, 'Armor of the Fang', 'Embrace of the Viper');

-- Insert Armor Sets for Chain of the Scarlet Crusade Item Set 163
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 10329, 163, 'Scarlet Belt', 'Chain of the Scarlet Crusade'),
(0, 10332, 163, 'Scarlet Boots', 'Chain of the Scarlet Crusade'),
(0, 10328, 163, 'Scarlet Chestpiece', 'Chain of the Scarlet Crusade'),
(0, 10331, 163, 'Scarlet Gauntlets', 'Chain of the Scarlet Crusade'),
(0, 10330, 163, 'Scarlet Leggings', 'Chain of the Scarlet Crusade'),
(0, 10333, 163, 'Scarlet Wristguards', 'Chain of the Scarlet Crusade');

-- Insert Armor Sets for Green Dragon Mail Item Set 490
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 15045, 490, 'Green Dragonscale Breastplate', 'Green Dragon Mail'),
(0, 15046, 490, 'Green Dragonscale Leggings', 'Green Dragon Mail'),
(0, 20296, 490, 'Green Dragonscale Gauntlets', 'Green Dragon Mail');

-- Insert Armor Sets for Ironfeather Armor Item Set 144
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 15066, 144, 'Ironfeather Breastplate', 'Ironfeather Armor'),
(0, 15067, 144, 'Ironfeather Shoulders', 'Ironfeather Armor');

-- Insert Armor Sets for Imperial Plate Item Set 321
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 12424, 321, 'Imperial Plate Belt', 'Imperial Plate'),
(0, 12426, 321, 'Imperial Plate Boots', 'Imperial Plate'),
(0, 12425, 321, 'Imperial Plate Bracers', 'Imperial Plate'),
(0, 12422, 321, 'Imperial Plate Chest', 'Imperial Plate'),
(0, 12427, 321, 'Imperial Plate Helm', 'Imperial Plate'),
(0, 12429, 321, 'Imperial Plate Leggings', 'Imperial Plate'),
(0, 12428, 321, 'Imperial Plate Shoulders', 'Imperial Plate');

-- Insert Armor Sets for The Gladiator Item Set 1
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 11729, 1, 'Savage Gladiator Helm', 'The Gladiator'),
(0, 11726, 1, 'Savage Gladiator Chain', 'The Gladiator'),
(0, 11728, 1, 'Savage Gladiator Leggings', 'The Gladiator'),
(0, 11731, 1, 'Savage Gladiator Greaves', 'The Gladiator'),
(0, 11730, 1, 'Savage Gladiator Grips', 'The Gladiator');

-- Insert Armor Sets for Volcanic Armor Item Set 141
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 15053, 141, 'Volcanic Breastplate', 'Volcanic Armor'),
(0, 15054, 141, 'Volcanic Leggings', 'Volcanic Armor'),
(0, 15055, 141, 'Volcanic Shoulders', 'Volcanic Armor');

-- Insert Armor Sets for Blue Dragon Mail Item Set 491
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 15048, 491, 'Blue Dragonscale Breastplate', 'Blue Dragon Mail'),
(0, 20295, 491, 'Blue Dragonscale Leggings', 'Blue Dragon Mail'),
(0, 15049, 491, 'Blue Dragonscale Shoulders', 'Blue Dragon Mail');

-- Insert Armor Sets for Devilsaur Armor Item Set 143
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 15062, 143, 'Devilsaur Leggings', 'Devilsaur Armor'),
(0, 15063, 143, 'Devilsaur Gauntlets', 'Devilsaur Armor');

-- Insert Armor Sets for Stormshroud Armor Item Set 142
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 15056, 142, 'Stormshroud Armor', 'Stormshroud Armor'),
(0, 15057, 142, 'Stormshroud Pants', 'Stormshroud Armor'),
(0, 15058, 142, 'Stormshroud Shoulders', 'Stormshroud Armor'),
(0, 21278, 142, 'Stormshroud Gloves', 'Stormshroud Armor');

-- Insert Armor Sets for Black Dragon Mail Item Set 489
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 16984, 489, 'Black Dragonscale Boots', 'Black Dragon Mail'),
(0, 15050, 489, 'Black Dragonscale Breastplate', 'Black Dragon Mail'),
(0, 15052, 489, 'Black Dragonscale Leggings', 'Black Dragon Mail'),
(0, 15051, 489, 'Black Dragonscale Shoulders', 'Black Dragon Mail');

-- Insert Armor Sets for The Postmaster Item Set 81
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 13390, 81, 'The Postmaster\'s Band', 'The Postmaster'),
(0, 13388, 81, 'The Postmaster\'s Tunic', 'The Postmaster'),
(0, 13391, 81, 'The Postmaster\'s Treads', 'The Postmaster'),
(0, 13392, 81, 'The Postmaster\'s Seal', 'The Postmaster'),
(0, 13389, 81, 'The Postmaster\'s Trousers', 'The Postmaster');

-- Insert Armor Sets for Ironweave Battlesuit Item Set 520
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 22306, 520, 'Ironweave Belt', 'Ironweave Battlesuit'),
(0, 22311, 520, 'Ironweave Boots', 'Ironweave Battlesuit'),
(0, 22313, 520, 'Ironweave Bracers', 'Ironweave Battlesuit'),
(0, 22302, 520, 'Ironweave Cowl', 'Ironweave Battlesuit'),
(0, 22304, 520, 'Ironweave Gloves', 'Ironweave Battlesuit'),
(0, 22305, 520, 'Ironweave Mantle', 'Ironweave Battlesuit'),
(0, 22303, 520, 'Ironweave Pants', 'Ironweave Battlesuit'),
(0, 22301, 520, 'Ironweave Robe', 'Ironweave Battlesuit');

-- Insert Armor Sets for Regalia of Undead Cleansing Item Set 536
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 23091, 536, 'Bracers of Undead Cleansing', 'Regalia of Undead Cleansing'),
(0, 23084, 536, 'Gloves of Undead Cleansing', 'Regalia of Undead Cleansing'),
(0, 23085, 536, 'Robe of Undead Cleansing', 'Regalia of Undead Cleansing');

-- Insert Armor Sets for Undead Slayer's Armor Item Set 534
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 23081, 534, 'Handwraps of Undead Slaying', 'Undead Slayer\'s Armor'),
(0, 23089, 534, 'Tunic of Undead Slaying', 'Undead Slayer\'s Armor'),
(0, 23093, 534, 'Wristwraps of Undead Slaying', 'Undead Slayer\'s Armor');

-- Insert Armor Sets for Garb of the Undead Slayer Item Set 535
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 23088, 535, 'Chestguard of Undead Slaying', 'Garb of the Undead Slayer'),
(0, 23082, 535, 'Handguards of Undead Slaying', 'Garb of the Undead Slayer'),
(0, 23092, 535, 'Wristguards of Undead Slaying', 'Garb of the Undead Slayer');

-- Insert Armor Sets for Battlegear of Undead Slaying Item Set 533
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 23090, 533, 'Bracers of Undead Slaying', 'Battlegear of Undead Slaying'),
(0, 23087, 533, 'Breastplate of Undead Slaying', 'Battlegear of Undead Slaying'),
(0, 23078, 533, 'Gauntlets of Undead Slaying', 'Battlegear of Undead Slaying');

-- Insert Armor Sets for Blessed Regalia of Undead Cleansing Item Set 781
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 43073, 781, 'Blessed Gloves of Undead Cleansing', 'Blessed Regalia of Undead Cleansing'),
(0, 43074, 781, 'Blessed Mantle of Undead Cleansing', 'Blessed Regalia of Undead Cleansing'),
(0, 43075, 781, 'Blessed Trousers of Undead Cleansing', 'Blessed Regalia of Undead Cleansing'),
(0, 43072, 781, 'Blessed Robe of Undead Cleansing', 'Blessed Regalia of Undead Cleansing');

-- Insert Armor Sets for Undead Slayer's Blessed Armor Item Set 782
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 43078, 782, 'Blessed Grips of Undead Slaying', 'Undead Slayer\'s Blessed Armor'),
(0, 43077, 782, 'Blessed Shoulderpads of Undead Slaying', 'Undead Slayer\'s Blessed Armor'),
(0, 43079, 782, 'Blessed Leggings of Undead Slaying', 'Undead Slayer\'s Blessed Armor'),
(0, 43076, 782, 'Blessed Tunic of Undead Slaying', 'Undead Slayer\'s Blessed Armor');

-- Insert Armor Sets for Blessed Garb of the Undead Slayer Item Set 783
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 43082, 783, 'Blessed Handguards of Undead Slaying', 'Blessed Garb of the Undead Slayer'),
(0, 43081, 783, 'Blessed Pauldrons of Undead Slaying', 'Blessed Garb of the Undead Slayer'),
(0, 43083, 783, 'Blessed Greaves of Undead Slaying', 'Blessed Garb of the Undead Slayer'),
(0, 43080, 783, 'Blessed Hauberk of Undead Slaying', 'Blessed Garb of the Undead Slayer');

-- Insert Armor Sets for Blessed Battlegear of Undead Slaying Item Set 784
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 43070, 784, 'Blessed Gauntlets of Undead Slaying', 'Blessed Battlegear of Undead Slaying'),
(0, 43068, 784, 'Blessed Spaulders of Undead Slaying', 'Blessed Battlegear of Undead Slaying'),
(0, 43071, 784, 'Blessed Legplates of Undead Slaying', 'Blessed Battlegear of Undead Slaying'),
(0, 43069, 784, 'Blessed Breastplate of Undead Slaying', 'Blessed Battlegear of Undead Slaying');

-- Insert Armor Sets for Twilight Trappings Item Set 492
INSERT INTO `black_market_armor_sets` (`class`, `item_id`, `item_set_id`, `name`, `set_name`) VALUES
(0, 20406, 492, 'Twilight Cultist Mantle', 'Twilight Trappings'),
(0, 20408, 492, 'Twilight Cultist Cowl', 'Twilight Trappings'),
(0, 20407, 492, 'Twilight Cultist Robe', 'Twilight Trappings');


CALL black_market_current_set();