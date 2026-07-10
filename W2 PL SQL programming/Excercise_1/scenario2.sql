SET SERVEROUTPUT ON;

DECLARE
    -- Cursor to iterate through all customers
    CURSOR c_customers IS
        SELECT CustomerID, Name, Balance, IsVIP
        FROM Customers;

    v_vip_promoted NUMBER := 0;
BEGIN
    -- Iterate through each customer
    FOR r_customer IN c_customers LOOP
        -- Check if the balance is over $10,000
        IF r_customer.Balance > 10000 THEN
            -- Only perform the update if the customer is not already VIP
            IF r_customer.IsVIP <> 'TRUE' THEN
                UPDATE Customers
                SET IsVIP = 'TRUE'
                WHERE CustomerID = r_customer.CustomerID;

                DBMS_OUTPUT.PUT_LINE('Customer promoted to VIP: ' || r_customer.Name || ' (New Balance: $' || r_customer.Balance || ')');
                v_vip_promoted := v_vip_promoted + 1;
            END IF;
        END IF;
    END LOOP;

    -- Commit the transaction to save changes
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Process finished. Total customers promoted to VIP: ' || v_vip_promoted);

EXCEPTION
    WHEN OTHERS THEN
        -- Rollback in case of unexpected errors
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
