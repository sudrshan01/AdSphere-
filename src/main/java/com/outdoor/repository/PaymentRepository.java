package com.outdoor.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.outdoor.entity.Payment;

public interface PaymentRepository extends JpaRepository<Payment, Long> {
   // List<Payment> findByInvoiceId(Long invoiceId);
}