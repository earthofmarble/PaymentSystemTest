package app.services;

import app.entities.Account;
import app.entities.Payment;

import java.util.List;

public interface AccountService {
    //добавляем деньги на счет
    void addMoney(Account account, Double amount);
    //списываем деньги со счета
    void withdrawMoney(Account account, Double amount);
    //сохраняем типа чек, ну как чек, просто сохраняем информацию о переводе
    void savePayment(double amount, int from, int to);
    //получаем информацию о всех переводах с/на определенного счета
    List<Payment> getAllPaymentsByAccount(int accountNumber);
}
