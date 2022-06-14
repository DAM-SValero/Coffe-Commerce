package com.coffecomerce.domain;

public class Detail {

    private int idDetail;
    private int idProduct;
    private int idUser;
    private int quantity;

    public Detail(){}

    public Detail(int idDetail, int idProduct, int idUser, int quantity) {
        this.idDetail = idDetail;
        this.idProduct = idProduct;
        this.idUser = idUser;
        this.quantity = quantity;
    }

    public int getIdDetail() {
        return idDetail;
    }

    public void setIdDetail(int idDetail) {
        this.idDetail = idDetail;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
