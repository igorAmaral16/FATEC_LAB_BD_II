<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quadro de Faltas dos Alunos</title>
    
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

    <h1>Lista de faltas dos Alunos</h1>
    <form action="listarFaltas" method="POST">
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
        <h1>Quadro de Faltas dos Alunos</h1>
        <table>
            <thead>
                <tr>
                    <th>Matrícula</th>
                    <th>Aluno</th>
                    <th>Data 1</th>
                    <th>Data 2</th>
                    <th>Data 3</th>
                    <th>Data 4</th>
                    <th>Data 5</th>
                    <th>Data 6</th>
                    <th>Data 7</th>
                    <th>Data 8</th>
                    <th>Data 9</th>
                    <th>Data 10</th>
                    <th>Data 11</th>
                    <th>Data 12</th>
                    <th>Data 13</th>
                    <th>Data 14</th>
                    <th>Data 15</th>
                    <th>Data 16</th>
                    <th>Data 17</th>
                    <th>Data 18</th>
                    <th>Data 19</th>
                    <th>Data 20</th>
                    <th>Total de Faltas</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="falta" items="${faltas}">
                    <tr>
                        <td>${falta.matricula_Aluno}</td>
                        <td>${falta.aluno}</td>
                        <td>${falta.DATA1}</td>
                        <td>${falta.DATA2}</td>
                        <td>${falta.DATA3}</td>
                        <td>${falta.DATA4}</td>
                        <td>${falta.DATA5}</td>
                        <td>${falta.DATA6}</td>
                        <td>${falta.DATA7}</td>
                        <td>${falta.DATA8}</td>
                        <td>${falta.DATA9}</td>
                        <td>${falta.DATA10}</td>
                        <td>${falta.DATA11}</td>
                        <td>${falta.DATA12}</td>
                        <td>${falta.DATA13}</td>
                        <td>${falta.DATA14}</td>
                        <td>${falta.DATA15}</td>
                        <td>${falta.DATA16}</td>
                        <td>${falta.DATA17}</td>
                        <td>${falta.DATA18}</td>
                        <td>${falta.DATA19}</td>
                        <td>${falta.DATA20}</td>
                        <td>${falta.totFaltas}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
