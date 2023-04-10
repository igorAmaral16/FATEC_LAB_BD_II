<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gerar grupos</title>
<style>
	body {
		background-repeat: no-repeat;
		background-size: cover;
		background-color: grey;
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
	
	table {
		border-collapse: collapse;
		width: 80%;
		margin: 0 auto;
	}
	
	th, td {
		padding: 10px;
		text-align: left;
	}
	
	th {
		background-color: #333;
		color: white;
	}
	
	tr:nth-child(even) {
		background-color: #f2f2f2;
	}
	
	.grupo-a {
		background-color: #ff6961;
	}
	
	.grupo-b {
		background-color: #0074d9;
	}
	
	.grupo-c {
		background-color: #2ecc40;
	}
	
	.grupo-d {
		background-color: #b10dc9;
	}
</style>
</head>
<body>
	<ul>
		<li><a href="index.jsp">VOLTAR</a></li>
	</ul>

	<div align="center">
		<form action="formarGrupos" method="post">
			<table>
				<tr>
					<td><input type="submit" id="botao" name="enviar" value="GERAR"></td>           
				</tr>
			</table>
		</form>
	</div>

	<br />

	<div align="center">
		<c:if test="${not empty erro}">
			<H2><c:out value="${erro}" /></H2>
		</c:if>
		<c:if test="${not empty saida}">
			<H2><c:out value="${saida}" /></H2>
		</c:if>
	</div>

	<div align="center">
		<c:if test="${not empty grupos }">
			<table>
				<thead>
					<tr>
						<th>Nome do Time</th>
						<th>Grupo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${grupos }" var="g">
						<tr>
							<c:choose>
						    <c:when test="${g.grupo == 'A'}">
						        <td class = "grupo-a"><c:out value="${g.nometime }"></c:out></td>
								<td class = "grupo-a"><c:out value="${g.grupo }"></c:out></td>
						    </c:when>
						    <c:when test="${g.grupo == 'B'}">
						    	<td class = "grupo-b"><c:out value="${g.nometime }"></c:out></td>
								<td class = "grupo-b"><c:out value="${g.grupo }"></c:out></td>
						    </c:when>
						    <c:when test="${g.grupo == 'C'}">
						    	<td class = "grupo-c"><c:out value="${g.nometime }"></c:out></td>
								<td class = "grupo-c"><c:out value="${g.grupo }"></c:out></td>
						    </c:when>
						    <c:when test="${g.grupo == 'D'}">
						    	<td class = "grupo-d"><c:out value="${g.nometime }"></c:out></td>
								<td class = "grupo-d"><c:out value="${g.grupo }"></c:out></td>
						    </c:when>
						    <c:otherwise>
						        <p>Pelo menos um elemento não tem o valor correto.</p>
						    </c:otherwise>
						</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>	
	</div>
</body>
</html>
