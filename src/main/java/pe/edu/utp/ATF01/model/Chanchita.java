package pe.edu.utp.ATF01.model;

import java.util.Objects;

public class Chanchita {
    private String Nombre;
    private long NumeroCuenta;

    public Chanchita() {
    }

    public Chanchita(String nombre,long numerocuenta) {
        this.Nombre = nombre;
        this.NumeroCuenta = numerocuenta;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        this.Nombre = nombre;
    }

    public long getNumerocuenta() {
        return NumeroCuenta;
    }

    public void setNumerocuenta(long numerocuenta) {
        this.NumeroCuenta = numerocuenta;
    }

    @Override
    public String toString() {
        return "Chanchita{" +
                "nombre='" + Nombre + '\'' +
                ", numerocuenta='" + NumeroCuenta + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Chanchita chanchita = (Chanchita) o;
        return Objects.equals(Nombre, chanchita.Nombre) && Objects.equals(NumeroCuenta, chanchita.NumeroCuenta);
    }

    @Override
    public int hashCode() {
        return Objects.hash(Nombre, NumeroCuenta);
    }
}

