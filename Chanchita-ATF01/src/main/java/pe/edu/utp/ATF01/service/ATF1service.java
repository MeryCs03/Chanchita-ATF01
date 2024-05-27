package pe.edu.utp.ATF01.service;

import pe.edu.utp.ATF01.model.Chanchita;
import pe.edu.utp.ATF01.model.Deposito;
import pe.edu.utp.ATF01.utils.DataAccessMariaDB;

import javax.naming.NamingException;
import java.sql.*;

public class ATF1service {
    private Connection cnn;
    private DataAccessMariaDB dao;

    public ATF1service(DataAccessMariaDB dao, String cnx) throws SQLException, NamingException {
        this.dao = dao;
        this.cnn = dao.getConnection();
    }

    public void cerrarConexion() {
        try {
            DataAccessMariaDB.closeConnection(cnn);
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }

    public void RegistrarChanchita(String NombreChanchita, long NumeroCuenta) throws SQLException {
        try {
            // Llamar al procedimiento almacenado para registrar la Chanchita
            String sql = "CALL RegistrarChanchita(?, ?)";

            // Preparar la llamada al procedimiento almacenado
            try (CallableStatement cs = cnn.prepareCall(sql)) {
                cs.setString(1, NombreChanchita);
                cs.setLong(2, NumeroCuenta);
                // Ejecutar la llamada al procedimiento almacenado
                cs.execute();
            }
        } catch (SQLException e) {
            // Capturar y relanzar la excepción
            throw new SQLException("Error al registrar la Chanchita: " + e.getMessage());
        } finally {
            // Cerrar la conexión
            cerrarConexion();
        }
    }

    public void RegistrarDeposito(Deposito dep) throws SQLException {
        try {
            String sql = "CALL RegistrarDeposito(?,?,?,?,?)";
            try (CallableStatement cs = cnn.prepareCall(sql)) {
                cs.setLong(1, Long.parseLong(dep.getNumero_Cuenta()));
                Timestamp timestamp = Timestamp.valueOf(dep.getFechaHora());
                cs.setTimestamp(2, timestamp);
                cs.setString(3, dep.getNombrePersona());
                cs.setDouble(4, dep.getMonto());
                cs.setString(5, dep.getDetalle());
                cs.execute();
            }
        } catch (SQLException e) {
            throw new SQLException("Error al registrar Deposito: " + e.getMessage());
        } finally {
            cerrarConexion();
        }
    }


    public Chanchita BuscarChanchita(String NombreChanchita, String NumeroCuenta) throws SQLException {
        Chanchita chanchita = null;
        String sql = "CALL BuscarChanchita(?, ?)";
        try (PreparedStatement pstmt = cnn.prepareStatement(sql)) {
            pstmt.setString(1, NombreChanchita);
            pstmt.setString(2, NumeroCuenta);
            try (ResultSet rst = pstmt.executeQuery()) {
                if (rst.next()) {
                    String Nombre_Chanchita = rst.getString("NombreChanchita");
                    long NroCuenta = rst.getLong("NumeroCuenta");
                    chanchita = new Chanchita(Nombre_Chanchita, NroCuenta);
                }
            }
        }
        return chanchita;
    }
}
