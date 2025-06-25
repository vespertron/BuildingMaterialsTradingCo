--CREATE DATABASE BuildingMaterialsTradingCo;
USE BuildingMaterialsTradingCo;

--CREATE SCHEMA BMTC_ODS;


-- Drop existing tables if they exist (optional cleanup)
DROP TABLE IF EXISTS BMTC_ODS.SalesOrderLine;
DROP TABLE IF EXISTS BMTC_ODS.SalesOrder;
DROP TABLE IF EXISTS BMTC_ODS.Inventory;
DROP TABLE IF EXISTS BMTC_ODS.Warehouse;
DROP TABLE IF EXISTS BMTC_ODS.Product;
DROP TABLE IF EXISTS BMTC_ODS.ProductCategory;
DROP TABLE IF EXISTS BMTC_ODS.CustomerLocation;
DROP TABLE IF EXISTS BMTC_ODS.Customer;
DROP TABLE IF EXISTS BMTC_ODS.SupplierLocation;
DROP TABLE IF EXISTS BMTC_ODS.Supplier;


-- Create Supplier table
CREATE TABLE BMTC_ODS.Supplier (
    SupplierID INTEGER PRIMARY KEY IDENTITY,
    SupplierName TEXT,
    ContactEmail TEXT,
	LastUpdate DATETIME
);


-- Create SupplierLocation table
CREATE TABLE BMTC_ODS.SupplierLocation (
    LocationID INTEGER PRIMARY KEY IDENTITY,
    SupplierID INTEGER,
    Address TEXT,
    Region TEXT,
    FOREIGN KEY (SupplierID) REFERENCES BMTC_ODS.Supplier(SupplierID),
	LastUpdate DATETIME
);


-- Create Customer table
CREATE TABLE BMTC_ODS.Customer (
    CustomerID INTEGER PRIMARY KEY IDENTITY,
    CustomerName TEXT,
    Industry TEXT,
	LastUpdate DATETIME
);


-- Create CustomerLocation table
CREATE TABLE BMTC_ODS.CustomerLocation (
    LocationID INTEGER PRIMARY KEY IDENTITY,
    CustomerID INTEGER,
    Address TEXT,
    Region TEXT,
    FOREIGN KEY (CustomerID) REFERENCES BMTC_ODS.Customer(CustomerID),
	LastUpdate DATETIME
);


-- Create ProductCategory table
CREATE TABLE BMTC_ODS.ProductCategory (
    CategoryID INTEGER PRIMARY KEY IDENTITY,
    CategoryName TEXT,
    SubCategoryName TEXT,
    Material TEXT,
	LastUpdate DATETIME
);


-- Create Product table
CREATE TABLE BMTC_ODS.Product (
    ProductID INTEGER PRIMARY KEY IDENTITY,
    ProductName TEXT,
    CategoryID INTEGER,
    SupplierID INTEGER,
    UnitPrice REAL,
    FOREIGN KEY (CategoryID) REFERENCES BMTC_ODS.ProductCategory(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES BMTC_ODS.Supplier(SupplierID),
	LastUpdate DATETIME
);


-- Create Warehouse table
CREATE TABLE BMTC_ODS.Warehouse (
    WarehouseID INTEGER PRIMARY KEY IDENTITY,
    WarehouseName TEXT,
    Location TEXT,
	LastUpdate DATETIME
);


-- Create Inventory table
CREATE TABLE BMTC_ODS.Inventory (
    InventoryID INTEGER PRIMARY KEY IDENTITY,
    ProductID INTEGER,
    WarehouseID INTEGER,
    QuantityOnHand INTEGER,
    FOREIGN KEY (ProductID) REFERENCES BMTC_ODS.Product(ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES BMTC_ODS.Warehouse(WarehouseID),
	LastUpdate DATETIME
);


-- Create SalesOrder table
CREATE TABLE BMTC_ODS.SalesOrder (
    SalesOrderID INTEGER PRIMARY KEY IDENTITY,
    CustomerID INTEGER,
    OrderDate TEXT,
    Status TEXT,
    FOREIGN KEY (CustomerID) REFERENCES BMTC_ODS.Customer(CustomerID),
	LastUpdate DATETIME
);


-- Create SalesOrderLine table
CREATE TABLE BMTC_ODS.SalesOrderLine (
    SalesOrderLineID INTEGER PRIMARY KEY IDENTITY,
    SalesOrderID INTEGER,
    ProductID INTEGER,
    QuantityOrdered INTEGER,
    UnitPrice REAL,
    FOREIGN KEY (SalesOrderID) REFERENCES BMTC_ODS.SalesOrder(SalesOrderID),
    FOREIGN KEY (ProductID) REFERENCES BMTC_ODS.Product(ProductID),
	LastUpdate DATETIME
);