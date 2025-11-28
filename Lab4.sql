CREATE TABLE Customers(
    id_c int PRIMARY KEY,
    name_c VARCHAR(255),
    email VARCHAR(255)
);
CREATE TABLE Orders(
    id_o int PRIMARY KEY,
    data_o DATE,
    id_c int,
    FOREIGN KEY (id_c) REFERENCES Customers(id_c)
);
CREATE TABLE Products(
    id_p int PRIMARY KEY,
    name_p VARCHAR(255),
    price NUMERIC(6,2)
);
CREATE TABLE Orders_Products(
    id_o int,
    id_p int,
    quantitiy int,
    PRIMARY KEY (id_o, id_p),
    FOREIGN KEY (id_o) REFERENCES Orders(id_o),
    FOREIGN KEY (id_p) REFERENCES Products(id_p)
);