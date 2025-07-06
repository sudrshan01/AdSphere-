package com.outdoor.service;

import com.outdoor.entity.Campaign;
import com.outdoor.entity.Payment;
import com.outdoor.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

@Service
public class PaymentService {
    @Autowired
    private PaymentRepository paymentRepository;

    public List<Payment> getAllPayments() {
        return paymentRepository.findAll();
    }

    public Payment savePayment(Payment payment) {
        return paymentRepository.save(payment);
    }

	
    public void deletePayment(Long id) {
        paymentRepository.deleteById(id);
    }

    // **New: Get Payment by ID**
    public Payment getPaymentById(Long id) {
        return paymentRepository.findById(id).orElse(null);
    }

    // **New: Update Payment**
    public Payment updatePayment(Payment payment) {
        return paymentRepository.save(payment);
    }

	public Collection<Campaign> getAllPayment() {
		// TODO Auto-generated method stub
		return null;
	}
   
}
