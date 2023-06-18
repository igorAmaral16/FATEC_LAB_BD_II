<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inserindo notas</title>
</head>
<body>
	<div align = "left">
		<a href = "index">Voltar</a>
	</div>
     <div align="center" class="container">
		<h1><b>Inserir nota</b></h1>
	</div>
	<br />
	<div align="center">
        <form action="notas" method="post">
        	<table>
           
                 <tr><td><input type="number" id="aluno" name="aluno" placeholder="RA"></td></tr>
                 <tr><td><input type="number" step="0.1" min="0" id="nota" name="nota" placeholder="nota"></td></tr>
                 <tr><td><select id="disciplina" name="disciplina">
				  <option value="">Selecione uma disciplina</option>
				  <option value="4203010">Arquitetura e Organização de Computadores (AOC) - T</option>
				  <option value="4203020">Arquitetura e Organização de Computadores (AOC) - N</option>
				  <option value="4208010">Laboratório de Hardware (LH) - T</option>
				  <option value="4226004">Banco de Dados (BD) - T</option>
				  <option value="4213003">Sistemas Operacionais I (SOI) - T</option>
				  <option value="4213013">Sistemas Operacionais I (SOI) - N</option>
				  <option value="4233005">Laboratório de Banco de Dados (LBD) - T</option>
				  <option value="5005220">Métodos Para a Produção do Conhecimento (MPC) - T</option>
				 </select>
				 </tr>
                 <tr><td> <select id="presenca" name="presenca">
                  <option value="">Selecione a avaliação</option>
				  <option value="1">P1</option>
				  <option value="2">P2</option>
				  <option value="3">P3</option>
				  <option value="4">Trabalho</option>
				  <option value="5">Pré exame</option>
				  <option value="6">Exame</option>
				  <option value="7">Monografia Resumida</option>
				  <option value="8">Monografia completa</option>
				</select>
                 <tr><td><input type="submit" id="botao" name="botao" value="Inserir"></td></tr>
                 
            </table>
		</form>
	</div> 
	<br />
	<br />
	<div align="center">
		<c:if test="${not empty erro } ">
			<H2><c:out value="${erro }"  /></H2>
		</c:if>
	</div>
	<div align="center">
		<c:if test="${not empty saida } ">
			<H3><c:out value="${saida }"  /></H3>
		</c:if>
	</div>
</body>
</html>