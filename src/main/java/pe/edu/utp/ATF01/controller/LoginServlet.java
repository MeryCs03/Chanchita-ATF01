package pe.edu.utp.ATF01.controller;

import pe.edu.utp.ATF01.service.Auth;
import pe.edu.utp.ATF01.utils.LogFile;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;



@WebServlet(name = "login", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Recuperar datos del formulario
        String email = req.getParameter("txtEmail");
        String pwd = req.getParameter("txtPassword");

        PrintWriter out = resp.getWriter();

        try {
            boolean is_validuser= Auth.isValidUser(email,pwd);
			// Autenticar y crear sesion
            if(is_validuser){
                HttpSession ses=req.getSession();
                ses.setAttribute("is_valid_user",true);
                req.getRequestDispatcher("index_general.jsp").forward(req, resp);
            }else{
                String errMsg=String.format("Error de inicio de sesion para usuario: %s ",email);
                LogFile.error(errMsg);
                resp.sendRedirect("index.jsp");
            }
			
        } catch (SQLException | NamingException e) {
            LogFile.error(e.getMessage());
            out.println(e.getMessage()); // solo para desarrollo
        }
    }
}