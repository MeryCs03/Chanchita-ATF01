package pe.edu.utp.ATF01.controller;


import pe.edu.utp.ATF01.response.BuscarDepositos;
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
            service.generarTablaDepositos(res.depositos(), sb);
            service.generarTotalIngresos(res.depositos(), sb);

            req.setAttribute("nombre_chanchita", res.nombre_chanchita());
            req.setAttribute("nroCuenta", nroCuenta);
            req.setAttribute("table", sb.toString());

            // Incluye el encabezado de la tabla en la variable tablaEncabezado
            String tablaEncabezado = "<thead>" +
                    "<tr>" +
                    "<th>Nombre</th>" +
                    "<th>Fecha</th>" +
                    "<th>Detalle</th>" +
                    "<th>Monto S/</th>" +
                    "</tr>" +
                    "</thead>";

            req.setAttribute("tablaEncabezado", tablaEncabezado);

            req.getRequestDispatcher("/BuscarChanchita.jsp").forward(req, resp);
        } catch (SQLException | NamingException e) {
            throw new RuntimeException(e);
        }
    }


}
