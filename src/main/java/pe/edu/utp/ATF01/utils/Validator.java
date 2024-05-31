package pe.edu.utp.ATF01.utils;

import pe.edu.utp.ATF01.service.Auth;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class Validator {

    public static Map<String, String> getErrores(HttpServletRequest req) throws IOException {
        String login = req.getParameter("txtlogin");
        String fullname = req.getParameter("txtfullname");
        String email = req.getParameter("txtEmail");
        String pwd = req.getParameter("txtpwd");
        Map<String, String> errores = new HashMap<>();
        // TODO: REALIZAR VALIDACION
        if( login == null || login.isBlank() ){
            errores.put("login", "El campo login es requerido");
        }
        if( fullname == null || fullname.isBlank() ){
            errores.put("fullname", "El campo fullname es requerido");
        }
        if( email == null || email.isBlank()){
            errores.put("email", "El campo email es requerido");
        }else if( !EmailValidator.isEmailValid(email) ){
            errores.put("email", "Formato de email no aceptado");
        }else{
            try {
                if( Auth.doesUserExist(email) ){
                    errores.put("email", "El email ya esta registrado");
                }
            } catch (Exception e) {
                LogFile.error(e.getMessage());
            }
        }
        if( pwd == null || pwd.isBlank()){
            errores.put("pwd", "El campo contraseña es requerido");
        }else if( pwd.length() < 6 ){
            errores.put("pwd", "El campo contraseña debe tener minimo 6 digitos");
        }
        return errores;
    }

}
