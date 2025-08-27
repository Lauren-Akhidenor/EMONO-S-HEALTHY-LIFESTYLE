IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='COUNTRY' AND xtype='U')
BEGIN
    CREATE TABLE COUNTRY (
        idCountry INT PRIMARY KEY,
        country VARCHAR(100)
    );
END;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='REGION' AND xtype='U')
BEGIN
    CREATE TABLE REGION (
        idRegion INT PRIMARY KEY,
        region VARCHAR(100),
        idCountry INT,
        FOREIGN KEY (idCountry) REFERENCES COUNTRY(idCountry)
    );
END;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='FARMER' AND xtype='U')
BEGIN
    CREATE TABLE FARMER (
        idFarmer INT PRIMARY KEY,
        name VARCHAR(100),
        city VARCHAR(100),
        idRegion INT,
        FOREIGN KEY (idRegion) REFERENCES REGION(idRegion)
    );
END;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='MONTH_NAME' AND xtype='U')
BEGIN
    CREATE TABLE MONTH_NAME (
        idMonthName INT PRIMARY KEY,
        monthName VARCHAR(20)
    );
END;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DimDate' AND xtype='U')
BEGIN
    CREATE TABLE DimDate (
        idDate INT PRIMARY KEY,
        month INT,
        quarter INT,
        year INT,
        idMonthName INT,
        FOREIGN KEY (idMonthName) REFERENCES MONTH_NAME(idMonthName)
    );
END;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='CROP' AND xtype='U')
BEGIN
    CREATE TABLE CROP (
        idCrop INT PRIMARY KEY,
        cropName VARCHAR(100),
        category VARCHAR(50),
        cost_price DECIMAL(10,2),
        sale_price DECIMAL(10,2),
        supplier VARCHAR(100)
    );
END;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='HARVEST_SALES' AND xtype='U')
BEGIN
    CREATE TABLE HARVEST_SALES (
        idCrop INT,
        idDate INT,
        idFarmer INT,
        delivery_date DATE,
        quantity_kg DECIMAL(10,2),
        revenue DECIMAL(12,2),
        PRIMARY KEY (idCrop, idDate, idFarmer),
        FOREIGN KEY (idCrop) REFERENCES CROP(idCrop),
        FOREIGN KEY (idDate) REFERENCES DimDate(idDate),
        FOREIGN KEY (idFarmer) REFERENCES FARMER(idFarmer)
    );
END;
