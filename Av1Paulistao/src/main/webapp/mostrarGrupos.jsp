<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./css/styles.css">
<title>Grupos</title>

<style>

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

	.grupo-tabela {
	  display: inline-block;
	  width: 48%; /* metade da largura da tela */
	  margin: 10px;
	}
	
	table {
	  border-collapse: collapse;
	  width: 100%;
	  margin-bottom: 10px;
	}
	
	th {
	  background-color: #333;
	  color: #fff;
	  padding: 8px;
	}
	
	td {
	  background-color: #fff;
	  border: 1px solid #ddd;
	  padding: 8px;
	}
	
	tr:nth-child(even) td {
	  background-color: #f2f2f2;
	}
	
	.wrapper {
	  display: flex;
	  flex-wrap: wrap;
	  justify-content: center;
	}

</style>
</head>
<body>
	<ul>
		<li><a href="index.jsp">VOLTAR</a></li>
	</ul>
          <div align="center">
          <form action="gruposformados" method="post">
               <table>
                 <tr> 
                 <td><input type="submit" id="botao" name="enviar" value="Mostrar"><td>
                 </tr>
               </table>
          </form>
     </div>
 <br>
     <div class="wrapper" align="center">
     
     <div>
		<c:choose>
			<c:when test="${not empty erro}">
				<H1><c:out value="${erro }" /></H1>
			</c:when>
			<c:when test="${not empty saida}">
				<H1><c:out value="${saida }" /></H1>
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
	</div>
	
	<div>
	<c:if test="${not empty grupoA}">
		<table border="1">
			<thead>
				<tr>
					<th>Nome do Time</th>
					<th>Grupo</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${grupoA}" var="ga">
					<tr align="center">
						<td><c:out value="${ga.nometime}"></c:out></td>
						<td><c:out value="${ga.grupo}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>	
</div>

<div>
	<c:choose>
		<c:when test="${not empty grupoB}">
			<table border="1">
				<thead>
					<tr>
						<th>Nome do Time</th>
						<th>Grupo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${grupoB}" var="gb">
						<tr align="center">
							<td><c:out value="${gb.nometime}"></c:out></td>
							<td><c:out value="${gb.grupo}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
</div>

<div>
	<c:choose>
		<c:when test="${not empty grupoC}">
			<table border="1">
				<thead>
					<tr>
						<th>Nome do Time</th>
						<th>Grupo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${grupoC}" var="gc">
						<tr align="center">
							<td><c:out value="${gc.nometime}"></c:out></td>
							<td><c:out value="${gc.grupo}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
</div>

<div>
	<c:choose>
		<c:when test="${not empty grupoD}">
			<table border="1">
				<thead>
					<tr>
						<th>Nome do Time</th>
						<th>Grupo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${grupoD}" var="gd">
						<tr align="center">
							<td><c:out value="${gd.nometime}"></c:out></td>
							<td><c:out value="${gd.grupo}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
	</div>
	</div>
</body>
</html>