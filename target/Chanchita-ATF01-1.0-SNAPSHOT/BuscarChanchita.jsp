<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar Chanchita</title>
    <link rel="stylesheet" href="buscar_chanchita.css">
</head>
<body>
<div class="container">
    <div class="form-container">
        <h1>Buscar Chanchita</h1>
        <form action="BuscarChanchita" method="post">
            <input oninput="limitarDigitos(this)" maxlength="16" type="number" placeholder="Ingrese número de cuenta" name="nroCuenta" required>
        </form>
    </div>
    <table class="table">
        <thead>
        <tr>
            ${tablaEncabezado}
        </tr>
        </thead>
        <tbody>
        ${table}
        </tbody>
    </table>
    <div class="button-container">
        <button onclick="window.location.href='RegistrarDeposito.jsp'" class="button">Registrar Depósito</button>
        <button onclick="window.location.href='index_general.jsp'" class="button">Inicio</button>
    </div>
</div>
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
