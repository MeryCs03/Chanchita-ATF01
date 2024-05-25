package pe.edu.utp.ATF_01.service;

import pe.edu.utp.ATF_01.utils.DataAccessMariaDB;
import pe.edu.utp.ATF_01.utils.LogFile;

import javax.naming.NamingException;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Auth {

    public static boolean isValidUser(String email, String pwd)
            throws SQLException, NamingException, IOException {
        String strSQL = String.format("CALL pr_checkUser('%s','%s')",email, md5(pwd));
        // 1. Enviar al archivo log la sentencia sql
        LogFile.info(strSQL);
        // 2. Crear conexion BD con datasource
        Connection cnn= DataAccessMariaDB.getConnection(DataAccessMariaDB.TipoDA.DATASOURCE,
                AppConfig.getDatasource());

        ResultSet rst = cnn.createStatement().executeQuery(strSQL);
        String res = (rst.next()) ? rst.getString("login") : "no_data";
        cnn.close();
        return !res.equals("no_data");
    }

    public static String md5(String data) throws IOException {
        try{
            MessageDigest md = MessageDigest.getInstance("MD5");
            MessageDigest msg = (MessageDigest) md.clone();
            msg.update(data.getBytes());
            return byteArrayToHex(msg.digest());
        } catch (CloneNotSupportedException | NoSuchAlgorithmException e) {
            LogFile.error(e.getMessage());
            return data;
        }
    }

    /*
    * Link: https://stackoverflow.com/questions/9655181/java-convert-a-byte-array-to-a-hex-string
    * Nota: Metodo altetnativo para JDK17, pero se debe tener cuidado con tener este entorno activado
    * HexFormat hex = HexFormat.of();
    * hex.formatHex(someByteArray)
    * */
    public static String byteArrayToHex(byte[] a) {
        StringBuilder sb = new StringBuilder(a.length * 2);
        for(byte b: a)
            sb.append(String.format("%02x", b));
        return sb.toString();
    }

}
