SET SERVEROUTPUT ON;

DECLARE
    -- fetch loans due within the next 30 days (inclusive)
    -- Joins Loans with customers to get the customer's name
    CURSOR c_due_loans IS
        SELECT c.Name, l.LoanID, l.LoanAmount, l.EndDate
        FROM Loans l
        JOIN Customers c ON l.CustomerID = c.CustomerID
        WHERE l.EndDate BETWEEN TRUNC(SYSDATE) AND TRUNC(SYSDATE) + 30;

    v_reminder_count NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== BANK LOAN DUE REMINDERS ===');

    -- Iterate through the loans that match the condition
    FOR r_loan IN c_due_loans LOOP
        DBMS_OUTPUT.PUT_LINE('REMINDER: Dear ' || r_loan.Name || 
                             ', your loan (ID: ' || r_loan.LoanID || ') of $' || 
                             TO_CHAR(r_loan.LoanAmount, 'FM99,999,990.00') || 
                             ' is due on ' || TO_CHAR(r_loan.EndDate, 'YYYY-MM-DD') || 
                             '. Please ensure payment is processed on time.');
        v_reminder_count := v_reminder_count + 1;
    END LOOP;

    -- Output summary
    IF v_reminder_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No loans are due within the next 30 days.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Total reminders generated: ' || v_reminder_count);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
