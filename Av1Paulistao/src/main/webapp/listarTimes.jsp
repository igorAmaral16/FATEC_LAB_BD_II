<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Times Participantes</title>
<style>
	body {
		background-repeat: no-repeat;
		background-size: cover;
		background-color: grey;
	}
	h1 {
	font-family: 'Arial Black', sans-serif;
	text-align: center;
	font-size: 50px;
	text-shadow: 2px 2px black;
	margin-top: 50px;
	color: Black;
	}
	
	li a {
		text-decoration: none;
		color: white;
		font-size: 1.2rem;
		padding: 10px;
		border-radius: 5px;
		background-color: #333;
	}
	
	li a:hover {
		background-color: #444;
	}
	
	li a:active {
		background-color: #555;
	}

nav {
	background-color: rgba(0, 0, 0, 0.6);
	text-align: center;
	padding: 10px;
	margin: 20px;
	border-radius: 10px;
}

nav ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: space-between;
}

nav li {
	margin: 0 10px;
}

nav a {
	color: white;
	text-decoration: none;
	font-family: 'Arial', sans-serif;
	font-size: 20px;
	text-shadow: 2px 2px black;
}

table {
	background-color: rgba(0, 0, 0, 0.6);
	padding: 10px;
	margin: 20px;
	border-radius: 10px;
}

th, td {
	padding: 5px 10px;
}

th {
	font-family: 'Arial Black', sans-serif;
	font-size: 20px;
	text-shadow: 2px 2px black;
}

.error {
	color: red;
	font-family: 'Arial', sans-serif;
	font-size: 20px;
	text-shadow: 2px 2px black;
}

.success {
	color: green;
	font-family: 'Arial', sans-serif;
	font-size: 20px;
	text-shadow: 2px 2px black;
}
</style>
</head>
<body>
	<ul>
		<li><a href="index.jsp">VOLTAR</a></li>
	</ul>
	<h1>Times Participantes</h1>
	<div align="center">
		<form action="listarTimes" method="post">
			<table> 
				<tr>
					<td><input type="submit" id="botao" name="enviar" value="LISTAR"></td>
				</tr>
			</table>
		</form>
		</div>
 
  <main>
    <section>
      <br />
      <c:if test="${not empty erro }">
        <div class="mensagem-erro">
          <h2><c:out value="${erro }" /></h2>
        </div>
      </c:if>
      <c:if test="${not empty saida }">
        <div class="mensagem-sucesso">
          <h2><c:out value="${saida }" /></h2>
        </div>
      </c:if>
      <c:if test="${not empty Time }">
        <table class="tabela-times">
          <thead>
            <tr>
              <th>Código</th>
              <th>Time</th>
              <th>Cidade</th>
              <th>Estádio</th>
              <th>Material Esportivo</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${Time }" var="t">
              <tr>
                <td><c:out value="${t.codigoTime }"></c:out></td>
                <td><c:out value="${t.nomeTime }"></c:out></td>
                <td><c:out value="${t.cidade }"></c:out></td>
                <td><c:out value="${t.estadio }"></c:out></td>
                <td><c:out value="${t.MatEsportivo }"></c:out></td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:if>
    </section>
  </main>