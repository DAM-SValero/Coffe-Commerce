package com.coffecomerce.domain;

public class Provider {

    private int idProvider;
    private String provider;
    private String cif;
    private String address;
    private String country;

    public Provider() {

    }

    public Provider(String provider, String cif, String address, String country) {
        this.provider = provider;
        this.cif = cif;
        this.address = address;
        this.country = country;
    }

    public int getIdProvider() {
        return idProvider;
    }

    public void setIdProvider(int idProvider) {
        this.idProvider = idProvider;
    }

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    public String getCif() {
        return cif;
    }

    public void setCif(String cif) {
        this.cif = cif;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
