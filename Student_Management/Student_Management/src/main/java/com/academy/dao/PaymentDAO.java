package com.academy.dao;

import com.academy.model.Payment;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAO {
    private static final String FILE_PATH = "C:\\Users\\pubud\\OneDrive\\Desktop\\sliit\\oop project - student course registration system\\Student_Management\\Student_Management\\src\\main\\resources\\payments.txt";

    // Save payment
    public void savePayment(Payment payment) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            bw.write(payment.getStudentId() + "," + payment.getCourseId() + "," + payment.getAmountPaid());
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Get all payments (optional for admin view)
    public List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 3) {
                    Payment payment = new Payment(parts[0], parts[1], Double.parseDouble(parts[2]));
                    payments.add(payment);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return payments;
    }
}
