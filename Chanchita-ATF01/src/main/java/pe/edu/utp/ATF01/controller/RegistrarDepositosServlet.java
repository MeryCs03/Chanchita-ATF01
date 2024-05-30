package pe.edu.utp.ATF01.controller;

import pe.edu.utp.ATF01.model.Deposito;
import pe.edu.utp.ATF01.service.ATF1service;
import pe.edu.utp.ATF01.service.AppConfig;
import pe.edu.utp.ATF01.service.Auth;
import pe.edu.utp.ATF01.utils.DataAccessMariaDB;
import pe.edu.utp.ATF01.utils.LogFile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "RegistrarDeposito", urlPatterns = "/RegistrarDeposito")
public class RegistrarDepositosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String numero_cuenta = req.getParameter("numero_cuenta");
        String nombrePersona = req.getParameter("nombrePersona");
        String monto = req.getParameter("monto");
        String detalle = req.getParameter("detalle");

        // parseo de datos
        double montoParse;
        PrintWriter out = resp.getWriter();
        try {
            montoParse = Double.parseDouble(monto);

            // Para la fecha y hora
            LocalDateTime fechaHoraActual = LocalDateTime.now();

            // Crear objeto Deposito
            Deposito dep = new Deposito(numero_cuenta, fechaHoraActual, nombrePersona, montoParse, detalle);

            if (Auth.isValidDeposito(dep.getNumero_Cuenta(), dep.getNombrePersona(), dep.getMonto(), dep.getDetalle())) {

                DataAccessMariaDB dao = new DataAccessMariaDB();
                String cnx = AppConfig.getDatasource();
                ATF1service service = new ATF1service(dao, cnx);

                service.RegistrarDeposito(dep);
                resp.sendRedirect(req.getContextPath() + "/index_general.jsp");
            } else {
                String errMsg = String.format("Error al Deposito");
                LogFile.error(errMsg);
                resp.sendRedirect("RegistrarDeposito.jsp");
            }

        } catch (Exception e) {
            LogFile.error(e.getMessage());
            out.println(e.getMessage());
        }
    }
}

