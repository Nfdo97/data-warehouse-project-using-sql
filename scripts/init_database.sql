/*
=============================================================
Database and Schema Creation
=============================================================
Script Purpose:
    This script checks for the existence of a database named 'DataWarehouse'. 
    If it exists, the script drops and recreates it. It also sets up three 
    schemas within the database: 'bronze', 'silver', and 'gold'.
    
WARNING:
    Executing this script will permanently delete the 'DataWarehouse' database 
    if it already exists. All data will be lost. Ensure you have appropriate 
    backups before proceeding.

*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas bronze, silver, gold
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
