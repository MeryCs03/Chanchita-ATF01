package pe.edu.utp.ATF01.model;
import java.time.LocalDateTime;
import java.util.Objects;

public class Deposito {
    private String numero_Cuenta;
    private LocalDateTime fechaHora;
    private String nombrePersona;
    private double monto;
    private String detalle;

    public Deposito() {
    }

    public Deposito(String numero_Cuenta, LocalDateTime fechaHora, String nombrePersona, double monto, String detalle) {
        this.numero_Cuenta = numero_Cuenta;
        this.fechaHora = fechaHora;
        this.nombrePersona = nombrePersona;
        this.monto = monto;
        this.detalle = detalle;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getNombrePersona() {
        return nombrePersona;
    }

    public void setNombrePersona(String nombrePersona) {
        this.nombrePersona = nombrePersona;
    }

    public LocalDateTime getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(LocalDateTime fechaHora) {
        this.fechaHora = fechaHora;
    }

    public String getNumero_Cuenta() {
        return numero_Cuenta;
    }

    public void setNumero_Cuenta(String numero_Cuenta) {
        this.numero_Cuenta = numero_Cuenta;
    }

    @Override
    public String toString() {
        return "Deposito{" +
                "numero_Cuenta='" + numero_Cuenta + '\'' +
                ", fechaHora=" + fechaHora +
                ", nombrePersona='" + nombrePersona + '\'' +
                ", monto=" + monto +
                ", detalle='" + detalle + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Deposito deposito = (Deposito) o;
        return Double.compare(monto, deposito.monto) == 0 && Objects.equals(numero_Cuenta, deposito.numero_Cuenta) && Objects.equals(fechaHora, deposito.fechaHora) && Objects.equals(nombrePersona, deposito.nombrePersona) && Objects.equals(detalle, deposito.detalle);
    }

    @Override
    public int hashCode() {return Objects.hash(numero_Cuenta, fechaHora, nombrePersona, monto, detalle);
    }
}
