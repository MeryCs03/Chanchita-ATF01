package pe.edu.utp.ATF01.service;

import pe.edu.utp.ATF01.model.Deposito;
import pe.edu.utp.ATF01.response.BuscarDepositos;
import pe.edu.utp.ATF01.utils.DataAccessMariaDB;

import javax.naming.NamingException;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class ATF1service {
    private Connection cnn;
    private DataAccessMariaDB dao;

    public ATF1service(DataAccessMariaDB dao, String cnx) throws SQLException, NamingException {
        this.dao = dao;
        this.cnn = dao.getConnection();
    }

    public void RegistrarUsuario(Usuario usuario) throws SQLException, NamingException, IOException {
        String strSQL = String.format("CALL pr_registerUser('%s', '%s', '%s', '%s')",
                usuario.getLogin(), usuario.getFullname(), usuario.getEmail(), usuario.getPwd());
        LogFile.info(strSQL);
        cnn.createStatement().execute(strSQL);
        cnn.close();
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


    public BuscarDepositos BuscarChanchita(Long NumeroCuenta) throws SQLException {
        String nombre_chanchita = "";
        String sql = "CALL BuscarDepositosPorNumeroCuenta(?)";
        try (PreparedStatement pstmt = cnn.prepareStatement(sql)) {
            pstmt.setLong(1, NumeroCuenta);
            try (ResultSet rst = pstmt.executeQuery()) {
                if (rst.next()) {
                    nombre_chanchita = rst.getString("Nombre");
                }
            }
            boolean hayDepositos = pstmt.getMoreResults();
            List<Deposito> depositos = new ArrayList<>();
            if (hayDepositos) {
                try (ResultSet rst = pstmt.getResultSet()) {
                    while (rst.next()) {
                        String nombrePersona = rst.getString("Nombre");
                        Timestamp fechaTimestamp = rst.getTimestamp("Fecha");
                        LocalDateTime fechaHora = fechaTimestamp.toInstant()
                                .atZone(ZoneId.systemDefault())
                                .toLocalDateTime();
                        String detalle = rst.getString("Detalle");
                        double monto = rst.getDouble("Monto");
                        depositos.add(new Deposito(fechaHora, nombrePersona, monto, detalle));
                    }
                }
            }
            return new BuscarDepositos(nombre_chanchita, depositos);
        } catch (SQLException e) {
            throw new SQLException("Error al registrar Deposito: " + e.getMessage());
        } finally {
            cerrarConexion();
        }
    }
    public void generarTablaDepositos(List<Deposito> depositos, StringBuilder sb) {
        String table = """
               
                <tr>
                <td>{{nombre}}</td>
                <td>{{fecha}}</td>
                <td>{{detalle}}</td>
                <td>{{monto}}</td>
                </tr>
                """;

        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        for (Deposito deposito : depositos) {
            String fecha = deposito.getFechaHora().format(fmt);
            sb.append(
                    table.replace("{{nombre}}", deposito.getNombrePersona())
                            .replace("{{fecha}}", fecha)
                            .replace("{{detalle}}", deposito.getDetalle())
                            .replace("{{monto}}", String.valueOf(deposito.getMonto()))
            );
        }
    }

    public void generarTotalIngresos(List<Deposito> depositos, StringBuilder sb) {
        double totalIngresos = depositos.stream().mapToDouble(Deposito::getMonto).sum();
        String total = """
                <tr>
                <td></td>
                <td></td>
                <td>Total de Ingresos:</td>
                <td>{{total}}</td>
                </tr>
                """.replace("{{total}}", String.valueOf(totalIngresos));

        sb.append(total);
    }
}
