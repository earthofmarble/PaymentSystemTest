package app.dao;

import app.entities.Account;
import app.entities.Payment;

import java.util.List;

interface AccountDAO {

void addMoney(Account account, Double amount);
void withdrawMoney(Account account, Double amount);
void savePayment(double amount, int from, int to);
List<Payment> getAllPaymentsByAccount(int accountNumber);
}
