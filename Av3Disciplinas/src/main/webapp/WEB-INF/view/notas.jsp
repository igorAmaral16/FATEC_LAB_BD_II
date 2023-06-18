<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inserindo notas</title>

<style>
    	body {
            height: 100vh;
        	background: linear-gradient(to bottom, beige, white);
        	color: #333333;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }
        h1, label, td {
        color: black;
        }
        
        .voltar-button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: black;
            background: linear-gradient(to bottom, beige, white);
            border: none;
            border: 2px solid #333333;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .voltar-button:hover {
            background: linear-gradient(to bottom, white, beige);
        }
    </style>
</head>
<body>
	
		<a href = "index" class="voltar-button">Voltar</a>
	
     <div align="center">
		<h1><b>Inserir nota</b></h1>
	</div>
	<br />
	<div align="center">
        <form action="notas" method="post">
        	<table>
           
                 <tr><td><input type="number" min="0" id="aluno" name="aluno" placeholder="RA" required></td></tr>
                 <tr><td><input type="number" step="0.1" min="0" max="10" id="nota" name="nota" placeholder="nota" required></td></tr>
                 <tr><td><select id="disciplina" name="disciplina" required>
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
                 <tr><td> <select id="tipoAvaliacao" name="tipoAvaliacao">
                  <option value="">Selecione a avaliação</option>
				  <option value="1">P1</option>
				  <option value="2">P2</option>
				  <option value="3">P3</option>
				  <option value="4">Trabalho</option>
				  <option value="5">Pré exame</option>
				  <option value="6">Exame</option>
				</select>
                 <tr><td><input class="voltar-button" type="submit" id="botao" name="botao" value="Inserir"></td></tr>
                 
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