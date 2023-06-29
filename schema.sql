CREATE TABLE clients (
  id_client SERIAL PRIMARY KEY,
  passport VARCHAR(15),
  id_card VARCHAR(15),
  name VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  country VARCHAR(20) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone INTEGER NOT NULL,
  dimex VARCHAR(15)
);

CREATE TABLE client_directions (
  id_direction SERIAL PRIMARY KEY,
  id_client INTEGER REFERENCES clients(id_client),
  direction VARCHAR(300) NOT NULL,
  province VARCHAR(50) NOT NULL,
  canton VARCHAR(50) NOT NULL,
  district VARCHAR(50) NOT NULL,
  zip_code VARCHAR(12) NOT NULL
);

CREATE TABLE payment_method (
  id_payment_method SERIAL PRIMARY KEY,
  id_client INTEGER REFERENCES clients(id_client),
  name VARCHAR(60) NOT NULL,
  number VARCHAR(16) NOT NULL,
  expire DATE NOT NULL,
  cvv VARCHAR(3) NOT NULL
);

CREATE TABLE reviews (
  id_reviews SERIAL PRIMARY KEY,
  id_client INTEGER REFERENCES clients(id_client),
  id_service INTEGER REFERENCES services(id_service),
  valuation INTEGER NOT NULL,
  comment TEXT NOT NULL,
  date DATE NOT NULL
);

CREATE TABLE orders (
  id_order SERIAL PRIMARY KEY,
  id_client INTEGER REFERENCES clients(id_client),
  order_date DATE NOT NULL,
  status BOOL NOT NULL
);

CREATE TABLE bill (
  id_bill SERIAL PRIMARY KEY,
  id_client INTEGER REFERENCES clients(id_client),
  id_order INTEGER REFERENCES orders(id_order),
  date DATE,
  subtotal DECIMAL(10, 2),
  total DECIMAL(10, 2)
);

CREATE TABLE bill_service (
  id_service INTEGER REFERENCES services(id_service),
  id_bill INTEGER REFERENCES bill(id_bill),
  quantity INTEGER,
  cost DECIMAL(10, 2),
  PRIMARY KEY (id_service, id_bill)
);

CREATE TABLE services (
  id_service SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description TEXT,
  cost_notes TEXT,
  cost DECIMAL(10, 2) NOT NULL
);

CREATE TABLE category_services (
  id_service INTEGER REFERENCES services(id_service),
  id_Category INTEGER REFERENCES category(id_category),
  PRIMARY KEY(id_service, id_category)
);

CREATE TABLE category (
  id_category SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description TEXT
);

CREATE TABLE label_services (
  id_service INTEGER REFERENCES services(id_service),
  id_label INTEGER REFERENCES label(id_label),
  PRIMARY KEY(id_service, id_label)
);

CREATE TABLE label (
  id_label SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description TEXT
);

CREATE TABLE worker_services (
  id_service INTEGER REFERENCES service(id_service),
  id_worker INTEGER REFERENCES workers(id_worker),
  PRIMARY KEY(id_service, id_worker)
);

CREATE TABLE workers (
  id_worker SERIAL PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  lastname VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone VARCHAR(16) NOT NULL,
  passport VARCHAR(15),
  id_card VARCHAR(15),
  dimex VARCHAR(15),
  country VARCHAR(30),
  professional_profile TEXT NOT NULL,
  valuation INTEGER,
  province VARCHAR(50) NOT NULL,
  canton VARCHAR(40) NOT NULL,
  district VARCHAR(40),
  zip_code VARCHAR(10),
  active BOOL NOT NULL
);

CREATE TABLE vacations (
  id_vacations SERIAL PRIMARY KEY,
  id_worker INTEGER REFERENCES workers(id_worker),
  start_date DATE NOT NULL,
  finish_date DATE NOT NULL
);

CREATE TABLE schedule (
  id_schedule SERIAL PRIMARY KEY,
  id_service INTEGER REFERENCES services(id_service),
  id_worker INTEGER REFERENCES workers(id_worker),
  week_day VARCHAR(2) NOT NULL,
  start_hour TIME NOT NULL,
  finish_hour TIME NOT NULL
);

CREATE TABLE directions_worker (
  id_direction SERIAL PRIMARY KEY,
  id_worker INTEGER REFERENCES workers(id_worker),
  direction TEXT NOT NULL,
  province VARCHAR(40) NOT NULL,
  canton VARCHAR(40) NOT NULL,
  district VARCHAR(40) NOT NULL,
  zip_code VARCHAR(10) NOT NULL
);
