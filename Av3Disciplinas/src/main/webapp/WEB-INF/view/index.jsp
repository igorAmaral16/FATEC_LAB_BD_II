<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Menu</title>
    <!-- <link rel="stylesheet" type="text/css" href='<c:url value="./resources/css/style.css"/>'> -->
    <style>
        body {
            display: flex;
        	justify-content: center;
        	align-items: center;
        	height: 100vh;
        	background: linear-gradient(to bottom, beige, white);
        	color: #333333;
        }

        #menu {
            display: flex;
            justify-content: center;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 10px;
        }

        a {
            display: block;
            text-decoration: none;
            border: 2px solid #333333;
            border-radius: 5px;
            padding: 20px;
            font-size: 20px;
            color: black;
            background: linear-gradient(to bottom, beige, white);
        }

        a:hover {
            background: linear-gradient(to bottom, white, beige);
        }
    </style>
  </head>
  <body>
  
  	<div id="menu">
		<ul>
	       <li> <a href="notas">Inserir notas</a></li>
	       <li> <a href="faltas">Inserir Faltas</a></li>
	       <li> <a href="listarNotas">Notas</a></li>
	       <li> <a href="listarFaltas">Faltas</a></li>
	   	</ul>	
	 </div>
	 <br />
	 <br />
  </body>
</html>
