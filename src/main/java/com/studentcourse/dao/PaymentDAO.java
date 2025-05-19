package com.studentcourse.dao;

import com.studentcourse.model.Payment;
import com.studentcourse.util.FileUtil;

import java.util.*;

public class PaymentDAO {
    public static void addPayment(Payment payment) {
        List<String> lines = FileUtil.readFile();
        lines.add(payment.toString());
        FileUtil.writeFile(lines);
    }

    public static List<Payment> getAllPayments() {
        List<String> lines = FileUtil.readFile();
        List<Payment> payments = new ArrayList<>();
        for (String line : lines) {
            String[] data = line.split(",");
            Payment payment = new Payment(data[0], Double.parseDouble(data[1]), data[2], data[3]);
            payments.add(payment);
        }
        return payments;
    }
}
