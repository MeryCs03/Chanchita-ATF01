<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Datos</title>
</head>
<body>
<h1>Registrar Deposito</h1>
<form action="RegistrarDeposito" method="post">
    <label for="numero_cuenta">Número de Cuenta:</label>
    <input type="text" id="numero_cuenta" name="numero_cuenta" required><br><br>

    <label for="fechaHora">Fecha y Hora:</label>
    <input type="datetime-local" id="fechaHora" name="fechaHora" required><br><br>

    <label for="nombrePersona">Nombre de la Persona:</label>
    <input type="text" id="nombrePersona" name="nombrePersona" required><br><br>

    <label for="monto">Monto:</label>
    <input type="number" step="0.01" id="monto" name="monto" required><br><br>

    <label for="detalle">Detalle:</label>
    <input type="text" id="detalle" name="detalle" required><br><br>

    <button type="submit">Enviar</button>
</form>
</body>
</html>
