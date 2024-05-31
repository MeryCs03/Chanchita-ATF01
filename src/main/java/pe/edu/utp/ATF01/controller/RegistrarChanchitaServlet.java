package pe.edu.utp.ATF01.controller;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import pe.edu.utp.ATF01.service.ATF1service;
import pe.edu.utp.ATF01.service.AppConfig;
import pe.edu.utp.ATF01.service.Auth;
import pe.edu.utp.ATF01.utils.DataAccessMariaDB;
import pe.edu.utp.ATF01.utils.LogFile;


@WebServlet(name="RegistrarChanchita",urlPatterns = "/RegistrarChanchita")
public class RegistrarChanchitaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //recuperar datos del formulario
        String nombreChanchita = req.getParameter("txtNombreChanchita");
        String numeroCuenta = req.getParameter("txtNumeroCuenta");
        PrintWriter out = resp.getWriter();
        try {
            // Validar los datos de la Chanchita utilizando el método de Auth
            if (Auth.isValidChanchita(nombreChanchita, numeroCuenta)) {

                // Crear instancia de DataAccessMariaDB
                DataAccessMariaDB dao = new DataAccessMariaDB();
                String cnx = AppConfig.getDatasource();

                // Inicializar el servicio ATF1 pasando los argumentos requeridos
                ATF1service service = new ATF1service(dao, cnx);

                // Registrar la nueva Chanchita
                service.RegistrarChanchita(nombreChanchita, Long.parseLong(numeroCuenta));

                // Redirigir a una página de éxito si el registro se realiza correctamente
                resp.sendRedirect(req.getContextPath() + "/index_general.jsp");

            } else {

                // Si los datos de la Chanchita no son válidos, redirigir de vuelta al formulario con un mensaje de error
                String errMsg=String.format("Error al crear chanchita");
                LogFile.error(errMsg);
                resp.sendRedirect("RegistrarChanchita.jsp");
            }

        } catch (SQLException | NamingException e) {
            LogFile.error(e.getMessage());
            out.println(e.getMessage()); // solo para desarrollo
        }
    }

}
