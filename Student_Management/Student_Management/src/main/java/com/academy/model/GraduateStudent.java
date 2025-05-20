package com.academy.model;

public class GraduateStudent extends Student {
    public GraduateStudent(String id, String name, String email, String password) {
        super(id, name, email, password);
    }

    @Override
    public String getType() {
        return "Graduate";
    }
}
