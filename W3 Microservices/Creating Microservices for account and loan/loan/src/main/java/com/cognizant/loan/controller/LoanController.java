package com.cognizant.loan.controller;

import com.cognizant.loan.dto.Loan;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/loans")
public class LoanController {

    /**
     * Endpoint to retrieve details of a specific loan account.
     * Uses dummy data as specified.
     * 
     * @param number The loan account number
     * @return Loan details containing number, type, loan amount, emi, and tenure
     */
    @GetMapping("/{number}")
    public Loan getLoanDetails(@PathVariable String number) {
        // Return dummy response matches the sample output format
        return new Loan(number, "car", 400000.0, 3258.0, 18);
    }
}
