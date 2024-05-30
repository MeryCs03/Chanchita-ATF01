package pe.edu.utp.ATF01.model;

import java.io.Serializable;


public class Usuario implements Serializable {
    private String login;
    private String fullname;
    private String email;
    private String pwd;

    public Usuario() {
    }

    public Usuario(String login, String fullname, String email, String pwd) {
        this.login = login;
        this.fullname = fullname;
        this.email = email;
        this.pwd = pwd;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return "Usuario{" +
                "login='" + login + '\'' +
                ", fullname='" + fullname + '\'' +
                ", email='" + email + '\'' +
                ", password='" + pwd + '\'' +
                '}';
    }
}
