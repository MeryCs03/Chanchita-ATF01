package pe.edu.utp.ATF01.controller;


import pe.edu.utp.ATF01.model.Deposito;
import pe.edu.utp.ATF01.model.response.BuscarDepositos;
import pe.edu.utp.ATF01.service.ATF1service;
import pe.edu.utp.ATF01.service.AppConfig;
import pe.edu.utp.ATF01.utils.DataAccessMariaDB;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "BuscarChanchita", urlPatterns = "/BuscarChanchita")
public class BuscarChanchitaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nroCuenta = req.getParameter("nroCuenta");
        try {
            DataAccessMariaDB dao = new DataAccessMariaDB();
            String cnx = AppConfig.getDatasource();
            ATF1service service = new ATF1service(dao, cnx);

            BuscarDepositos res = service.BuscarChanchita(Long.parseLong(nroCuenta));

            StringBuilder sb = new StringBuilder();
            generarTablaDepositos(res.depositos(), sb);
            generarTotalIngresos(res.depositos(), sb);

            req.setAttribute("nombre_chanchita", res.nombre_chanchita());
            req.setAttribute("nroCuenta", nroCuenta);
            req.setAttribute("table", sb.toString());
            req.getRequestDispatcher("/BuscarChanchita.jsp").forward(req, resp);
        } catch (SQLException | NamingException e) {
            throw new RuntimeException(e);
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
