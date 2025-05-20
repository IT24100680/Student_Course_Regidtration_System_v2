package com.academy.model;

public class UndergraduateStudent extends Student {
    public UndergraduateStudent(String id, String name, String email, String password) {
        super(id, name, email, password);
    }

    @Override
    public String getType() {
        return "Undergraduate";
    }
}
