package com.coffecomerce.domain;

public class Category {
    private int idCategory;
    private String tipo;

    public Category (){}

    public Category(int idCategory, String tipo) {
        this.idCategory = idCategory;
        this.tipo = tipo;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}
