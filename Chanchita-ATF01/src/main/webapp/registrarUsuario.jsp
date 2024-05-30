<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Usuario</title>
    <style>
        #txtfullname::placeholder {
            color: rgba(0, 0, 0, 0.2); /* Cambia el color y la transparencia del placeholder */
        }
    </style>
</head>
<body>
<h1>Registro de Usuario</h1>
<form action="RegistrarUsuario" method="post">
    <label for="txtlogin">Nombre del usuario:</label>
    <input type="text" id="txtlogin" name="txtlogin" required><br><br>

    <label for="txtfullname">Nombre completo:</label>
    <input type="text" id="txtfullname" name="txtfullname" placeholder="Colocar nombre y apellidos"  required><br><br>

    <label for="txtEmail">Email:</label>
    <input type="text" id="txtEmail" name="txtEmail" required><br><br>

    <label for="txtpwd">Contraseña:</label>
    <input type="password" id="txtpwd" name="txtpwd" required><br><br>

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
