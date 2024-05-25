package pe.edu.utp.ATF_01.service;

import java.util.ResourceBundle;

public class AppConfig {
    static ResourceBundle rb = ResourceBundle.getBundle("app");
	
	// Crear metodo getDataSource
    public static String getDatasource() {
        return rb.getString("datasource");
    }

    // Crear metodo getErrorLogFile
    public static String getErrorLogFile() {
        return rb.getString("errorLog");
    }
	
}
