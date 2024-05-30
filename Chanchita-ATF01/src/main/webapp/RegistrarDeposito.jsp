<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Datos</title>
    <link rel="stylesheet" href="form-style.css">
</head>
<body>

<div class="flex min-h-screen w-full items-center justify-center p-5">

    <div class="form-container">
        <h1 class="text-2xl font-semibold mb-7">Registrar Deposito</h1>
        <form action="RegistrarDeposito" method="post">

            <div class="flex flex-col gap-2 mb-6">
                <label for="numero_cuenta">Número de Cuenta:</label>
                <input class="form-input" type="text" id="numero_cuenta" name="numero_cuenta" required>
            </div>

            <div class="flex flex-col gap-2 mb-6">
                <label for="fechaHora">Fecha y Hora:</label>
                <input class="form-input" type="datetime-local" id="fechaHora" name="fechaHora" required>
            </div>

            <div class="flex flex-col gap-2 mb-6">
                <label for="nombrePersona">Nombre de la Persona:</label>
                <input class="form-input" type="text" id="nombrePersona" name="nombrePersona" required>
            </div>

            <div class="flex flex-col gap-2 mb-6">
                <label for="monto">Monto:</label>
                <input class="form-input" type="number" step="0.01" id="monto" name="monto" required>
            </div>


            <div class="flex flex-col gap-2 mb-6">
                <label for="detalle">Detalle:</label>
                <input class="form-input" type="text" id="detalle" name="detalle" required>
            </div>

            <button class="submit" type="submit">Enviar</button>

        </form>
    </div>

</div>

</body>
</html>
