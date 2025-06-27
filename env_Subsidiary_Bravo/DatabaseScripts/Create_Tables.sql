-- ========================
-- CREATE TABLES
---------------------------
-- Server: [My local SQL server]
-- Database: BMTC
-- Author: Vesper Annstas
-- Date: 
-- Description: This script creates the necessary tables for the Alpha database. Is dependent on the database being created first.
-- Last Modified: 
-- Modified By: Vesper Annstas
-- Modification Notes:
-- ========================

-- CREATE SCHEMA ODS;
-- CREATE SCHEMA WHS;


CREATE TABLE WHS.Machine (
    MachineID INT PRIMARY KEY CLUSTERED,
    WarehouseID INT,
    Timestamp DATETIME,
    SensorType VARCHAR(100),
);

CREATE TABLE WHS.MachineLog (
    LogID INT PRIMARY KEY CLUSTERED,
    WarehouseID INT,
    ProductID INT,
    Timestamp DATETIME,
    SensorType VARCHAR(100),
    DataPayload NVARCHAR(MAX)
);