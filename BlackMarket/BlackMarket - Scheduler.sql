SET GLOBAL event_scheduler = ON;
DROP EVENT IF EXISTS UpdateBlackMarketEvent;

-- Will create an sql event that on a weekly basis refreshs the weekly black market item sets
-- You can run this .sql script to delete and remake the event so you can set the start date when you like
CREATE EVENT UpdateBlackMarketEvent
ON SCHEDULE EVERY 1 WEEK
STARTS CURRENT_DATE + INTERVAL (7 - WEEKDAY(CURRENT_DATE)) DAY + INTERVAL 0 HOUR
COMMENT 'Automatically refreshes Black Market item sets weekly'
DO CALL UpdateBlackMarketSets();