<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tabela de Jogos</title>
<style>
body {
	background-color: #F5F5F5;
	color: #333333;
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
	margin: 0 auto;
	background-color: #FFFFFF;
}
th, td {
	padding: 8px;
	border: 1px solid #333333;
}
th {
	background-color: #333333;
	color: #FFFFFF;
}
input[type=date], input[type=submit] {
	padding: 6px;
	border: none;
	background-color: #333333;
	color: #FFFFFF;
	cursor: pointer;
}
input[type=submit]:hover {
	background-color: #FFFFFF;
	color: #333333;
}
div {
	margin: 20px auto;
	padding: 10px;
	border: 1px solid #333333;
	background-color: #FFFFFF;
	text-align: center;
}
h1 {
	color: #333333;
}
</style>
</head>
<body>
	<ul>
		<li><a href="index.jsp">VOLTAR</a></li>
	</ul>
     <div>
          <form action="buscarJogos" method="post">
               <table>
                 <tr>
                 <td><input type="date" id="data" name="data"><td>
             <td><input type="submit" id="botao" name="botao" value="Buscar"><td>
             
             </tr>
           </table>
      </form>
 </div>
 <br />
     <div>
		<c:if test="${not empty erro }">
			<h1><c:out value="${erro }" /></h1>
		</c:if>
		<c:if test="${not empty saida }">
			<h1><c:out value="${saida }" /></h1>
		</c:if>
	</div>
	<div>
	   <c:choose>
	<c:when test="${not empty listaJogos }">
		<table>
			<thead>
				<tr>
					<th>Time A</th>
					
					<th>Time B</th>
					
					<th>Data do jogo</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listaJogos }" var="lj">
					<tr>
						<td><c:out value="${lj.nometimeA }"></c:out></td>
						
						<td><c:out value="${lj.nometimeB }"></c:out></td>
						
						<td><c:out value="${lj.data }"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:when>
		<c:otherwise>
			<div>
	              <p> Não tem jogos registrados</p>
			</div>
		</c:otherwise>		
		 </c:choose>		
	</div>
</body>
</html>