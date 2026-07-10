package com.library.service;

import com.library.repository.BookRepository;

public class BookService {
    private BookRepository bookRepository;

    // Setter method for setter-based dependency injection
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void execute() {
        System.out.println("BookService: Processing library business logic...");
        if (bookRepository != null) {
            bookRepository.save();
        } else {
            System.out.println("BookService Error: BookRepository is not injected.");
        }
    }
}
