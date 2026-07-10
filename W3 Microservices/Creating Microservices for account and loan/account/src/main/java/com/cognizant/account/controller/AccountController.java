package com.cognizant.account.controller;

import com.cognizant.account.dto.Account;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/accounts")
public class AccountController {

    /**
     * Endpoint to retrieve details of a specific account.
     * Uses dummy data as specified.
     * 
     * @param number The account number
     * @return Account details containing number, type, and balance
     */
    @GetMapping("/{number}")
    public Account getAccountDetails(@PathVariable String number) {
        // Return dummy response matches the sample output format
        return new Account(number, "savings", 234343.0);
    }
}
