-- Create Customers Table
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Balance NUMBER(15, 2) NOT NULL,
    IsVIP VARCHAR2(5) DEFAULT 'FALSE' CHECK (IsVIP IN ('TRUE', 'FALSE'))
);

-- Create Loans Table
CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER REFERENCES Customers(CustomerID),
    LoanAmount NUMBER(15, 2) NOT NULL,
    InterestRate NUMBER(5, 2) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);

-- Insert sample data for customers
-- Current date reference: 2026-07-10
-- Customer 1: Age 65 (Born 1961) -> Above 60, Balance < 10000
INSERT INTO Customers (CustomerID, Name, DateOfBirth, Balance, IsVIP)
VALUES (1, 'John Doe', TO_DATE('1961-05-15', 'YYYY-MM-DD'), 5000.00, 'FALSE');

-- Customer 2: Age 40 (Born 1986) -> Below 60, Balance > 10000 (Should become VIP)
INSERT INTO Customers (CustomerID, Name, DateOfBirth, Balance, IsVIP)
VALUES (2, 'Jane Smith', TO_DATE('1986-08-20', 'YYYY-MM-DD'), 12500.00, 'FALSE');

-- Customer 3: Age 70 (Born 1956) -> Above 60, Balance > 10000 (Should get discount & become VIP)
INSERT INTO Customers (CustomerID, Name, DateOfBirth, Balance, IsVIP)
VALUES (3, 'Bob Johnson', TO_DATE('1956-11-10', 'YYYY-MM-DD'), 15000.00, 'FALSE');

-- Customer 4: Age 30 (Born 1996) -> Below 60, Balance < 10000
INSERT INTO Customers (CustomerID, Name, DateOfBirth, Balance, IsVIP)
VALUES (4, 'Alice Brown', TO_DATE('1996-01-01', 'YYYY-MM-DD'), 3000.00, 'FALSE');


-- Insert sample data for loans
-- Loan 1: Belongs to John (Age 65, above 60). EndDate: 2026-07-25 (Due in 15 days, within 30 days)
INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (101, 1, 10000.00, 8.50, TO_DATE('2026-01-01', 'YYYY-MM-DD'), TO_DATE('2026-07-25', 'YYYY-MM-DD'));

-- Loan 2: Belongs to Jane (Age 40). EndDate: 2026-08-15 (Due in 36 days, not within 30 days)
INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (102, 2, 20000.00, 7.00, TO_DATE('2026-02-01', 'YYYY-MM-DD'), TO_DATE('2026-08-15', 'YYYY-MM-DD'));

-- Loan 3: Belongs to Bob (Age 70, above 60). EndDate: 2026-07-12 (Due in 2 days, within 30 days)
INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (103, 3, 15000.00, 9.00, TO_DATE('2026-03-01', 'YYYY-MM-DD'), TO_DATE('2026-07-12', 'YYYY-MM-DD'));

-- Commit the inserts
COMMIT;
