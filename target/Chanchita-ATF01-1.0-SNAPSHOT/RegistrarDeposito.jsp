<%@ page contentType="text/html;charset=UTF-8" language="java" import="pe.edu.utp.ATF01.service.Auth" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Datos</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<main class="container">
    <div class="form-container">
        <h1>Registrar Depósito</h1>
        <form action="RegistrarDeposito" method="post">
            <div class="form-group">
                <label for="numero_cuenta">Número de Cuenta Destino (cci):</label>
                <input oninput="limitarDigitos(this)" maxlength="16" class="form-input" type="number" id="numero_cuenta" name="numero_cuenta" required>
            </div>
            <div class="form-group">
                <label>Fecha y hora:</label>
                <span><%= Auth.getDateTime() %></span>
            </div>
            <div class="form-group">
                <label for="nombrePersona">Nombre de la Persona:</label>
                <input class="form-input" type="text" id="nombrePersona" name="nombrePersona" minlength="2" maxlength="20" pattern="[A-Za-záéíóúÁÉÍÓÚñÑ\s]+" required>
            </div>
            <div class="form-group">
                <label for="monto">Monto:</label>
                <input class="form-input" type="number" step="0.01" id="monto" name="monto" pattern="[0-9]+" required>
            </div>
            <div class="form-group">
                <label for="detalle">Detalle:</label>
                <input class="form-input" type="text" id="detalle" name="detalle" required>
            </div>
            <div class="center-button">
                <button class="submit" type="submit">Enviar</button>
            </div>
        </form>

        <div class="button-container">
            <button onclick="window.location.href='index_general.jsp'" class="button">Inicio</button>
            <button onclick="window.location.href='BuscarChanchita.jsp'" class="button">Buscar Chanchita</button>
        </div>
    </div>
</main>
<script>
    function limitarDigitos(element) {
        let valor = element.value;
        if (valor.length > 16) {
            element.value = valor.slice(0, 16);
        }
    }
</script>
</body>
</html>
