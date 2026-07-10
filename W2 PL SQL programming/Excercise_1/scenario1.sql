SET SERVEROUTPUT ON;

DECLARE
    -- Cursor to fetch all customers
    CURSOR c_customers IS
        SELECT CustomerID, Name, DateOfBirth
        FROM Customers;

    v_age NUMBER;
    v_loans_updated NUMBER := 0;
BEGIN
    -- Loop through all customers
    FOR r_customer IN c_customers LOOP
        -- Calculate customer's age based on date of birth
        v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, r_customer.DateOfBirth) / 12);

        -- If customer is older than 60 years then apply 1% discount to interest rates
        IF v_age > 60 THEN
            -- Update the interest rate for the customers loans
            -- Note: A 1% discount refers to reducing the rate by 1 percentage point (e.g: from 8.5% to 7.5%)
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = r_customer.CustomerID;

            -- Check if any loans were updated for the customer
            IF SQL%ROWCOUNT > 0 THEN
                DBMS_OUTPUT.PUT_LINE('Successfully applied 1% discount for ' || r_customer.Name || ' (Age: ' || v_age || '). Total Loans Updated: ' || SQL%ROWCOUNT);
                v_loans_updated := v_loans_updated + SQL%ROWCOUNT;
            ELSE
                DBMS_OUTPUT.PUT_LINE('Customer ' || r_customer.Name || ' (Age: ' || v_age || ') has no active loans to update.');
            END IF;
        END IF;
    END LOOP;

    -- Commit the transaction to save changes permanently
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Process finished. Total loans discounted: ' || v_loans_updated);

EXCEPTION
    WHEN OTHERS THEN
        -- Rollback in case of unexpected errors
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
