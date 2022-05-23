CREATE TABLE Chef(
    ChefId int NOT NULL,
    ChefName varchar(255) NOT NULL,
    ClockInTime TIME NOT NULL,
    ClockOutTime TIME NOT NULL,
    PRIMARY KEY (ChefId)
);

CREATE TABLE Manager(
    MId int NOT NULL,
    MName varchar(255) NOT NULL,
    Address varchar(255),
    PRIMARY KEY (MId)
);


CREATE TABLE Meal(
    MealId int NOT NULL,
    MealName varchar(255) NOT NULL,
    Price int NOT NULL,
    PRIMARY KEY (MealId)
);

CREATE TABLE Customer(
    CustomerId int NOT NULL,
    CustomerName varchar(255) NOT NULL,
    Address varchar(255),
    PRIMARY KEY (CustomerId)
);

CREATE TABLE Orders(
    OrderId int NOT NULL,
    ChefId int NOT NULL,
    CustomerId int NOT NULL,
    PRIMARY KEY (OrderId),
    FOREIGN KEY (ChefId) REFERENCES Chef (ChefId),
    FOREIGN KEY (CUstomerId) REFERENCES Customer (CustomerId)
);

CREATE TABLE Ingredients(
   	IngredientsId int NOT NULL,
    IngredientsName varchar(255) NOT NULL,
    ManufactureDate DATE NOT NULL,
    ExpiryDate DATE NOT NULL,
    Quantity int NOT NULL,
    PRIMARY KEY (IngredientsId)
);

CREATE TABLE Payment(
    PaymentId int NOT NULL,
    Price int NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentMode varchar(255),
    CustomerId int NOT NULL,
    OrderId int NOT NULL,
    PRIMARY KEY (PaymentId),
    FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId),
    FOREIGN KEY (OrderId) REFERENCES Orders (OrderId)
);

CREATE TABLE Waiter(
    WaiterId int NOT NULL,
    WaiterName varchar(255) NOT NULL,
    Address varchar(255),
    Salary int,
    PRIMARY KEY (WaiterId)
);

CREATE TABLE Instructs
(
    MId int NOT NULL,
    ChefId int NOT NULL,
    FOREIGN KEY (MId) REFERENCES Manager (MId),
    FOREIGN KEY (ChefId) REFERENCES Chef (ChefId)
);

CREATE TABLE Requires
(
    ChefId int NOT NULL,
    IngredientsId int NOT NULL,
    FOREIGN KEY (ChefId) REFERENCES Chef (ChefId),
    FOREIGN KEY (IngredientsId) REFERENCES Ingredients (IngredientsId)
);

CREATE TABLE ConsistsOf
(
    OrderId int NOT NULL,
    MealId int NOT NULL,
    Quantity int NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders (OrderId),
    FOREIGN KEY (MealId) REFERENCES Meal (MealId)
);



CREATE TABLE ManagerPhone
(
    Phone varchar(10) NOT NULL,
    MId int NOT NULL,
    PRIMARY KEY (Phone),
    FOREIGN KEY (MId) REFERENCES Manager (MId)
);

CREATE TABLE ChefPhone
(
    Phone varchar(10) NOT NULL,
    ChefId int NOT NULL,
    PRIMARY KEY (Phone),
    FOREIGN KEY (ChefId) REFERENCES Chef (ChefId)
);

CREATE TABLE CustomerPhone
(
    Phone varchar(10) NOT NULL,
    CustomerId int NOT NULL,
    PRIMARY KEY (Phone),
    FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId)
);

CREATE TABLE WaiterPhone
(
    Phone varchar(10) NOT NULL,
    WaiterId int NOT NULL,
    PRIMARY KEY (Phone),
    FOREIGN KEY (WaiterId) REFERENCES Waiter (WaiterId)
);
