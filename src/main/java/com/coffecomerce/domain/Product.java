package com.coffecomerce.domain;

public class Product {
    private int idProduct;
    private int idCategory;
    private String  proname;
    private String country;
    private String intensity;

    private double price;
    private String img;


    /**
     * Productos: PARA RELACIONAR LOS PRODUCTOS CON LA CATEGORIA
     */


    public Product() {

    }

    public Product(String proname, String country, String intensity, double price ,int idCategory , String img) {

        this.proname = proname;
        this.country = country;
        this.intensity = intensity;
        this.price = price;
        this.idCategory = idCategory;
        this.img = img;

    }

 public String getImg() {
        return img;
    }

    public void setImg(String img) {
            this.img = img;
        }


    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getProname() {
        return proname;
    }

    public void setProname(String proname) {
        this.proname = proname;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getIntensity() {
        return intensity;
    }

    public void setIntensity(String intensity) {
        this.intensity = intensity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

}
