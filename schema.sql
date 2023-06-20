CREATE TABLE Clients (
  ID_Client SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Phone VARCHAR(12) NOT NULL
);

CREATE TABLE Directions (
  ID_Direccion SERIAL PRIMARY KEY,
  ID_Cliente INTEGER REFERENCES Clients(ID_Client),
  Direccion VARCHAR(100) NOT NULL,
  Provincia VARCHAR(50) NOT NULL,
  Canton VARCHAR(50) NOT NULL,
  Distrito VARCHAR(50) NOT NULL,
  Codigo_Postal VARCHAR(10) NOT NULL
);

CREATE TABLE Payment_Method (
  ID_Metodo_Pago SERIAL PRIMARY KEY,
  ID_Cliente INTEGER REFERENCES Clients(ID_Client),
  Tipo VARCHAR(50) NOT NULL,
  Numero VARCHAR(50) NOT NULL,
  Fecha_Vencimiento DATE NOT NULL,
  CVV VARCHAR(10) NOT NULL
);

CREATE TABLE Reviews (
  ID_Reviews SERIAL PRIMARY KEY,
  ID_Client INTEGER REFERENCES Clients(ID_Client),
  ID_Service INTEGER REFERENCES Service(ID_Service),
  Valuation INTEGER NOT NULL,
  Comment TEXT,
  Date DATE
);

CREATE TABLE Order (
  ID_Order SERIAL PRIMARY KEY,
  ID_Client INTEGER REFERENCES Clients(ID_Client),
  Order_Date DATE NOT NULL,
  Status BOOL NOT NULL
);

CREATE TABLE Bill (
  ID_Bill SERIAL PRIMARY KEY,
  ID_Client INTEGER REFERENCES Clients(ID_Client),
  ID_Order INTEGER REFERENCES Order(ID_Order),
  Date DATE,
  Subtotal DECIMAL(10, 2),
  Total DECIMAL(10, 2)
);

CREATE TABLE Bill_Service (
  ID_Service INTEGER REFERENCES Service(ID_Service),
  ID_Bill INTEGER REFERENCES Bill(ID_Bill),
  Quantity INTEGER,
  Cost DECIMAL(10, 2),
  PRIMARY KEY (ID_Service, ID_Bill)
);

CREATE TABLE Services (
  ID_Service SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Description TEXT,
  Cost DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Category_Services (
  ID_Service INTEGER REFERENCES Service(ID_Service),
  ID_Category INTEGER REFERENCES Category(ID_Category),
  PRIMARY KEY(ID_Service, ID_Category)
);

CREATE TABLE Category (
  ID_Category SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Description TEXT
);

CREATE TABLE Label_Services (
  ID_Service INTEGER REFERENCES Service(ID_Service),
  ID_Label INTEGER REFERENCES Label(ID_Label),
  PRIMARY KEY(ID_Servicio, ID_Etiqueta)
);

CREATE TABLE Label (
  ID_Label SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Description TEXT
);

CREATE TABLE Worker_Service (
  ID_Service INTEGER REFERENCES Service(ID_Service),
  ID_Worker INTEGER REFERENCES Workers(ID_Worker),
  PRIMARY KEY(ID_Service, ID_Worker)
);

CREATE TABLE Workers (
  ID_Worker SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Phone VARCHAR(12) NOT NULL,
  Professional_Profile TEXT,
  Valuation INTEGER,
  Province VARCHAR(50),
  Canton VARCHAR(50),
  District VARCHAR(50),
  Zip_Code VARCHAR(10),
  Active BOOL
);

CREATE TABLE Vacations (
  ID_Vacations SERIAL PRIMARY KEY,
  ID_Worker INTEGER REFERENCES Trabajadores(ID_Trabajador),
  Start_Date DATE NOT NULL,
  Finish_Date DATE NOT NULL
);

CREATE TABLE Schedule (
  ID_Schedule SERIAL PRIMARY KEY,
  ID_Service INTEGER REFERENCES Service(ID_Service),
  ID_Worker INTEGER REFERENCES Workers(ID_Worker),
  Week VARCHAR(20) NOT NULL,
  Start_Hour TIME NOT NULL,
  Finish_Hour TIME NOT NULL
);

CREATE TABLE Directions_Worker (
  ID_Direction SERIAL PRIMARY KEY,
  ID_Worker INTEGER REFERENCES Trabajadores(ID_Trabajador),
  Direction VARCHAR(100) NOT NULL,
  Province VARCHAR(50) NOT NULL,
  Canton VARCHAR(50) NOT NULL,
  District VARCHAR(50) NOT NULL,
  Zip_Code VARCHAR(10) NOT NULL
);
