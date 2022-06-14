package com.coffecomerce.domain;

import java.sql.Date;

public class Order {

    private int idorder;
    private Date fecha;
    private String orderNumber;

    public Order(){}

    public Order(int idorder, Date fecha, String orderNumber) {
        this.idorder = idorder;
        this.fecha = fecha;
        this.orderNumber = orderNumber;
    }

    public int getIdorder() {
        return idorder;
    }

    public void setIdorder(int idorder) {
        this.idorder = idorder;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }
}
