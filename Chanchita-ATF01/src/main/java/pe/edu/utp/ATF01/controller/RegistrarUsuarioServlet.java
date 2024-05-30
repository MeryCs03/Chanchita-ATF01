package pe.edu.utp.ATF01.controller;

import pe.edu.utp.ATF01.model.Usuario;
import pe.edu.utp.ATF01.service.ATF1service;
import pe.edu.utp.ATF01.service.AppConfig;
import pe.edu.utp.ATF01.service.Auth;
import pe.edu.utp.ATF01.utils.DataAccessMariaDB;
import pe.edu.utp.ATF01.utils.EmailValidator;
import pe.edu.utp.ATF01.utils.LogFile;
import pe.edu.utp.ATF01.utils.Validator;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "RegistrarUsuario", urlPatterns = "/RegistrarUsuario")
public class RegistrarUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("txtlogin");
        String fullname = req.getParameter("txtfullname");
        String email = req.getParameter("txtEmail");
        String pwd = req.getParameter("txtpwd");

        Map<String, String> errores = Validator.getErrores(req);

        if( !errores.isEmpty() ){
            req.setAttribute("errores", errores);
            getServletContext().getRequestDispatcher("/registrarUsuario.jsp").forward(req, resp);
            return;
        }

        PrintWriter out = resp.getWriter();

        try {
            // Validar datos del usuario
            if (!Auth.areUserDetailsValid(login, fullname, email, pwd)) {
                String errMsg = "Datos de usuario inválidos.";
                LogFile.error(errMsg);
                resp.sendRedirect("RegistrarUsuario.jsp");
                return;
            }

            // Comprobar si el email ya está registrado
            if (Auth.doesUserExist(email)) {
                String errMsg = "El email ya está registrado.";
                LogFile.error(errMsg);
                resp.sendRedirect("RegistrarUsuario.jsp");
                return;
            }
            // Convertir la contraseña a MD5
            String hashedPwd = hashPassword(pwd);

            // Crear usuario y registrar
            Usuario usuario = new Usuario(login, fullname, email, hashedPwd);
            DataAccessMariaDB dao = new DataAccessMariaDB();
            String cnx = AppConfig.getDatasource();
            ATF1service service = new ATF1service(dao, cnx);

            service.RegistrarUsuario(usuario);
            resp.sendRedirect(req.getContextPath() + "/index_general.jsp");

        } catch (Exception e) {
            LogFile.error(e.getMessage());
            out.println(e.getMessage());
        }
    }

    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());
        byte[] digest = md.digest();
        StringBuilder sb = new StringBuilder();
        for (byte b : digest) {
            sb.append(String.format("%02x", b & 0xff));
        }
        return sb.toString();
    }
}
