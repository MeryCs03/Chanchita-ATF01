<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Chanchita</title>
</head>
<body>
<h1>Registro de Nueva Chanchita</h1>
<form action="RegistrarChanchita" method="post">
    <label for="txtNombreChanchita">Nombre de la Chanchita:</label>
    <input type="text" id="txtNombreChanchita" name="txtNombreChanchita" required><br><br>

    <label for="txtNumeroCuenta">Número de Cuenta:</label>
    <input type="text" id="txtNumeroCuenta" name="txtNumeroCuenta" required><br><br>

    <input type="submit" value="Registrar">
</form>
<%
    // Recuperar el mensaje de error de la solicitud
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null && !errorMessage.isEmpty()) {
%>
<script type="text/javascript">
    // Mostrar el mensaje de error en una ventana emergente
    showError("<%= errorMessage %>");
</script>
<%
    }
%>
</body>
</html>