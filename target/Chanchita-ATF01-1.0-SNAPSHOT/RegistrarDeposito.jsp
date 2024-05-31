<%@ page contentType="text/html;charset=UTF-8" language="java" import="pe.edu.utp.ATF01.service.Auth" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Datos</title>
    <style>
        body {
            background-color: #edf5f8;
        }
        .button {
            background-color: #007bff; /* Azul */
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 8px;
        }
        .button:hover {
            background-color: #0056b3; /* Azul oscuro */
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .center-button {
            display: flex;
            justify-content: center;
        }
    </style>
    <link rel="stylesheet" href="form-style.css">
    <script>
    </script>
</head>
<body>

<div class="flex min-h-screen w-full items-center justify-center p-5">

    <div class="form-container">
        <h1 class="text-2xl font-semibold mb-7">Registrar Depósito</h1>
        <form action="RegistrarDeposito" method="post">

            <div class="flex flex-col gap-2 mb-6">
                <label for="numero_cuenta">Número de Cuenta Destino (cci):</label>
                <input oninput="limitarDigitos(this)" maxlength="16" class="form-input" type="number" id="numero_cuenta" name="numero_cuenta" maxlength="20" required>
            </div>

            <div class="flex flex-col gap-2 mb-6">
                <label>Fecha y hora:</label>
                <label><%= Auth.getDateTime() %></label>
            </div>

            <div class="flex flex-col gap-2 mb-6">
                <label for="nombrePersona">Nombre de la Persona:</label>
                <input class="form-input" type="text" id="nombrePersona" name="nombrePersona" minlength="2" maxlength="20" pattern="[A-Za-záéíóúÁÉÍÓÚñÑ\s]+" required>
            </div>

            <div class="flex flex-col gap-2 mb-6">
                <label for="monto">Monto:</label>
                <input class="form-input" type="number" step="0.01" id="monto" name="monto" pattern="[0-9]+" required>
            </div>

            <div class="flex flex-col gap-2 mb-6">
                <label for="detalle">Detalle:</label>
                <input class="form-input" type="text" id="detalle" name="detalle" required>
            </div>

            <div class="center-button">
                <button class="submit" type="submit">Enviar</button>
            </div>

        </form>

        <!-- Botones adicionales -->
        <div class="button-container">
            <button onclick="window.location.href='index_general.jsp'" class="button">Inicio</button>
            <button onclick="window.location.href='BuscarChanchita.jsp'" class="button">Buscar Chanchita</button>
        </div>
    </div>

</div>
<script> function limitarDigitos(element) {
    let valor = element.value;
    if (valor.length > 16) {
        element.value = valor.slice(0, 16);
    }
} </script>
</body>
</html>
