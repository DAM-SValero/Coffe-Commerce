package com.coffecomerce.domain;

public class User {

    private int idUser;
    private String firstname;
    private String surname;
    private String dni;
    private String email;
    private String username;
    private String pass;
    private String rol;

    public User() {

    }

    /**
     * CONSTRUCTOR PARA PODER BUSCAR SI EXISTE EL USERNAME AL CREARLO
     */
    public User(String username) {
        this.username = username;
    }

    /**
     * CONSTRUCTOR PARA DAR DE ALTA DESDE LA WEB
     */
    public User(String firstname, String surname, String dni, String email, String username, String pass) {
        this.firstname = firstname;
        this.surname = surname;
        this.dni = dni;
        this.email = email;
        this.username = username;
        this.pass = pass;
    }

    /**
     * CONSTRUCTOR PARA DAR DE ALTA DESDE LA WEB UN ADMINISTRADOR
     */
    public User(String firstname, String surname, String dni, String email, String username, String pass, String rol) {
        this.firstname = firstname;
        this.surname = surname;
        this.dni = dni;
        this.email = email;
        this.username = username;
        this.pass = pass;
        this.rol = rol;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
}
