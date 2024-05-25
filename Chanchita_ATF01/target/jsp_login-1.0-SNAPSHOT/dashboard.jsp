<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Verificamos la sesion
    HttpSession ses = request.getSession();
    boolean is_valid_user = false;
    if (ses.getAttribute("is_valid_user") != null) {
        is_valid_user = (boolean) ses.getAttribute("is_valid_user");
    }else{
        is_valid_user = false;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <!-- MDB CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f8ff;
            font-family: Arial, sans-serif;
            margin: 0;
        }
        .navbar {
            background-color: #4a90e2;
        }
        .navbar .navbar-brand, .navbar .nav-link {
            color: white !important;
        }
        .navbar .nav-link:hover {
            background-color: #357ab7;
            border-radius: 5px;
        }
        .content {
            padding: 2rem;
        }
        .card {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }
        .card-header {
            background-color: #4a90e2;
            color: white;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .card-body {
            padding: 1.5rem;
        }
    </style>
</head>

<% if (is_valid_user) { %>

<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Dashboard</a>
        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Books</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Clients</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Content -->
<div class="container content">
    <div class="card">
        <div class="card-header">Books Overview</div>
        <div class="card-body">
            <p>Info about books.</p>
        </div>
    </div>
    <div class="card">
        <div class="card-header">Clients Overview</div>
        <div class="card-body">
            <p>Info about clients.</p>
        </div>
    </div>
</div>

<!-- MDB JS -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
</body>
</html>

<% }else{ %>
    <% response.sendRedirect("index.jsp"); %>
<% } %>