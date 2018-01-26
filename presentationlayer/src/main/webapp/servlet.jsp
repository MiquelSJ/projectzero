<%@ page import="com.iesemilidarder.projectzero.DBHelper" %>
<%@ page import="com.iesemilidarder.projectzero.Restaurants" %>
<%@ page import="com.iesemilidarder.projectzero.Comments" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ca">
<head>
    <title>Restaurants</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://bootswatch.com/4/minty/bootstrap.min.css" >

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/png" href="http://elowcarbfoodlist.org/wp-content/uploads/2013/01/bacon-256.jpg"/>

</head>
<body>

<!-- Navigation bar -->
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="#">Restaurants</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Inici <span class="sr-only">(current)</span></a>
            </li>
            <li  class="nav-item">
                <a text-align="right" class="nav-link" href="test">Inicia sessió</a>
            </li>
            <li  class="nav-item">
                <a text-align="right" class="nav-link" href="test">Registra't</a>
            </li>
            <li class="nav-item">
                <a text-align="right" class="nav-link" href="test">Ajuda</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" name="cerca" type="text" placeholder="Cercar" aria-label="Cercar">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Cercar</button>
        </form>
    </div>
</nav>

<main role="main">

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">Demana el que et demani el cos</h1>
            <h2>Menjar a domicili a prop de tu</h2>
            <p><a class="btn btn-primary btn-lg" href="test" role="button">Consultar més &raquo;</a></p>
        </div>
    </div>

    <div class="container">

           <%
               Restaurants rest = (Restaurants) request.getAttribute("restaurant");


            out.println("<br><div><h2>"+rest.getName()+"</h2><h4>"+rest.getAddress()+"</h4></div><br>"+"<div>\n" +
                    "<div class=\"centrar\"><img src=\" "+rest.getImages()+"\" height=\"455px\" width=\"60%\"><br>"+
                    "<br><table class=\"table table-hover\">" +
                    "<thead>" +
                    "<tr>"+
                    "<th scope=\"col\">Estil del restaurant</th>"+
                    "<th scope=\"col\">"+rest.getType()+"</th>"+
                    "</tr>"+
                    "</thead>"+
                    "<tbody>"+
                    "<tr class=\"table-active\">"+
                    "<th scope=\"row\">Puntuació ♥</th>"+
                    "<td>"+rest.getMitjana()+"</td>"+
                    "</tr>"+
                    "<tr>"+
                    "<th scope=\"row\">Telèfon</th>"+
                    "<td>"+rest.getTelephone()+"</td>"+
                    "</tr>"+
                    "<tr class=\"table-active\">"+
                    "<th scope=\"row\">Adreça</th>"+
                    "<td>"+rest.getAddress()+"</td>"+
                    "</tr>"+
                    "<tr>"+
                    "<th scope=\"row\">Web</th>"+
                    "<td><a target=\"_blank\" href=\""+rest.getWebsite()+"\">"+rest.getWebsite()+"</a></td>"+
                    "</tr>"+
                    "</tbody>"+
                    "</table>"+
                    "</div>"
            );


            DBHelper dbHelper = new DBHelper();
            List<Comments> arrayComments = dbHelper.getComments(request.getParameter("id"));
            Iterator itr = arrayComments.iterator();

            while (itr.hasNext()) {
                Comments com = (Comments) itr.next();
                out.println("<div class=\"row\">" +
                        "<div class=\"col-md-8\">" +
                        "</div>" +
                        "<h2>Opinió del client</h2>"+
                        "<table class=\"table table-hover\">" +
                        "<thead>" +
                        "<tr>"+
                        "<th scope=\"col\">Id de l'usuari</th>"+
                        "<th scope=\"col\">"+com.getId()+"</th>"+
                        "</tr>"+
                        "</thead>"+
                        "<tbody>"+
                        "<tr class=\"table-active\">"+
                        "<th scope=\"row\">Usuari</th>"+
                        "<td>"+com.getUser()+"</td>"+
                        "</tr>"+
                        "<tr>"+
                        "<th scope=\"row\">Puntuació del restaurant</th>"+
                        "<td>"+com.getPuntu()+"</td>"+
                        "</tr>"+
                        "<tr class=\"table-active\">"+
                        "<th scope=\"row\">Comentari</th>"+
                        "<td>"+com.getComment()+"</td>"+
                        "</tr>"+
                        "</tbody>"+
                        "</table>"+
                        "</div>" +
                        "</div>"
                );
            }

        %>


    </div>


</main>

<footer class="container">
    <p>&copy; Miquel Servera Julià 2017</p>
</footer>

