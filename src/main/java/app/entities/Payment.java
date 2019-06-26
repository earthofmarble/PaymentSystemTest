package app.entities;

import javax.persistence.*;

@Entity
@Table(name = "payments", schema = "public")
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_payment")
    private int id;   //id
    @Column(name="amount_payment")
    private double amount;   //сумма
    @Column(name="from_payment")
    private int fromAccount;  //откуда перевод
    @Column(name="to_payment")
    private int toAccount;   //куда перевод


    public Payment() {}

    public Payment(double amount, int from, int to) {
        this.amount = amount;
        this.fromAccount = from;
        this.toAccount = to;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public int getFrom() {
        return fromAccount;
    }

    public void setFrom(int from) {
        this.fromAccount = from;
    }

    public int getTo() {
        return toAccount;
    }

    public void setTo(int to) {
        this.toAccount = to;
    }

}
