<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Notas dos Alunos</title>
    
    <style>
    	body {
            height: 100vh;
        	background: linear-gradient(to bottom, beige, white);
        	color: #333333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
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

<script>
    function cancelarListar() {
        var selectElement = document.getElementById("disciplina");
        var buttonElement = document.getElementById("botao");
        
        if (selectElement.value === "") {
            buttonElement.disabled = true;
        } else {
            buttonElement.disabled = false;
        }
    }
</script>

	<a href = "index" class="voltar-button">Voltar</a>

    <h1>Lista de Notas dos Alunos</h1>
    <form action="listarNotas" method="POST">
        <label for="materia">Matéria:</label>
        <select id="disciplina" name="disciplina" onchange="cancelarListar()">
		  <option value="" selected>Selecione uma disciplina</option>
		  <option value="4203010">Arquitetura e Organização de Computadores (AOC) - T</option>
		  <option value="4203020">Arquitetura e Organização de Computadores (AOC) - N</option>
		  <option value="4208010">Laboratório de Hardware (LH) - T</option>
		  <option value="4226004">Banco de Dados (BD) - T</option>
		  <option value="4213003">Sistemas Operacionais I (SOI) - T</option>
		  <option value="4213013">Sistemas Operacionais I (SOI) - N</option>
		  <option value="4233005">Laboratório de Banco de Dados (LBD) - T</option>
		  <option value="5005220">Métodos Para a Produção do Conhecimento (MPC) - T</option>
		</select>
        
        <input type="submit" id="botao" name="enviar" value="LISTAR" disabled>
    </form>
    <div>
    <h1>Quadro de notas dos alunos</h1>
    <table>
        <thead>
            <tr>
                <th>Matrícula</th>
                <th>Aluno</th>
                <th>Avaliação 1</th>
                <th>Avaliação 2</th>
                <th>Avaliação 3</th>
                <th>Trabalho</th>
                <th>Exame</th>
                <th>Média Final</th>
                <th>Situação</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="nota" items="${notas}">
                <tr>
                    <td>${nota.ra}</td>
                    <td>${nota.nome}</td>
                    <td>${nota.av1}</td>
                    <td>${nota.av2}</td>
                    <td>${nota.av3}</td>
                    <td>${nota.trabalho}</td>
                    <td>${nota.exame}</td>
                    <td>${nota.mediaFinal}</td>
                    <td>${nota.situacao}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
</body>
</html>

