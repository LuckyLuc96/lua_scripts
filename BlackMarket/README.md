# Black-Market-Vendor
**Updated 2025 by Judgefae - This version's SQL only works for Trinity Core**

**Credit to original author to the Azerothcore Version Manmadedrummer**

https://github.com/Manmadedrummer/Weekly-Armor-Vendor-Black-Market-

Adds a Vendor who sells One Armor Set per class and rotates them out weekly.

The SQL table's (`black_market_armor_sets` `black_market_current_set`) is created in your "World" folder. The Lua script for the NPC handles randomly getting the Armor sets and allows players to purchase them for 100 Araxia Tokens (Item ID: 910001).


One table for all the armor sets and one table for the current sets (resets weekly).
<br>
<br>
### Step 1: Import the two .sql files.
Import these in the order as they appear. "CreateTables", then "Scheduler"
Import the .sql file called BlackMarket - CreateTablesWorld.sql
Import the .sql file called BlackMarket - Scheduler.sql

## Step 2: Test the Stored Procedure Manually
Show the event as scheduled and also displays the current sets

```sql
SHOW EVENTS FROM `trinity_world` LIKE 'WeeklyBlackMarketUpdate';
SELECT * FROM black_market_current_set;
```

<br>

### Summary of Setup

1. **Tables:**
    - `black_market_armor_sets`: Contains all possible armor sets and items.
    - `black_market_current_set`: Contains the current week's selected armor sets.

2. **Stored Procedure:**
    - `UpdateBlackMarketSets`: Updates the current sets table with one random armor set per class each week.

3. **Event Scheduler:**
    - `UpdateBlackMarketEvent`: Calls the stored procedure weekly to refresh the available sets.

4. **Lua Script:**
    - Manages the NPC interactions, displays the current sets, and handles purchases.

By following these steps, you ensure that the Black Market NPC is correctly set up to provide players with a weekly rotating selection of armor sets.
