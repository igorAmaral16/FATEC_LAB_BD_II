<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Menu</title>
    <style>
      /* Estilos para o menu */
      body {
		background-repeat: no-repeat;
		background-size: cover;
		background-color: grey;
	}
      #menu {
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #253237;
        color: #fff;
        font-size: 1.2em;
        padding: 20px;
        border-bottom: 1px solid #ccc;
      }
      
      #menu ul {
        display: flex;
        list-style: none;
        margin: 0;
        padding: 0;
      }
      
      #menu li {
        margin: 0 20px;
        position: relative;
      }
      
      #menu a {
        color: #fff;
        text-decoration: none;
        padding: 10px;
        border-radius: 5px;
        transition: all 0.2s ease-in-out;
      }
      
      #menu a:hover {
        background-color: #f44336;
        color: #fff;
      }
      
      /* Ícone do menu */
      #menu li:before {
        content: "";
        position: absolute;
        top: 50%;
        left: -30px;
        transform: translateY(-50%);
        width: 20px;
        height: 20px;
        background-image: url("https://image.flaticon.com/icons/svg/2084/2084894.svg");
        background-repeat: no-repeat;
        background-size: contain;
        filter: invert(100%);
      }
      
      /* Estilos adicionais para cada link */
      #menu li:nth-of-type(1):before {
        background-image: url("https://image.flaticon.com/icons/svg/1164/1164929.svg");
      }
      
      #menu li:nth-of-type(2):before {
        background-image: url("https://image.flaticon.com/icons/svg/1164/1164923.svg");
      }
      
      #menu li:nth-of-type(3):before {
        background-image: url("https://image.flaticon.com/icons/svg/1164/1164926.svg");
      }
      
      #menu li:nth-of-type(4):before {
        background-image: url("https://image.flaticon.com/icons/svg/1164/1164919.svg");
      }
      
      #menu li:nth-of-type(5):before {
        background-image: url("https://image.flaticon.com/icons/svg/1164/1164928.svg");
      }
    </style>
  </head>
  <body>
    <!-- Menu -->
    <div id="menu">
      <ul>
        <li><a href="formarGrupos.jsp">Formar Grupos</a></li>
        <li><a href="listarTimes.jsp">Listar Times em Ordem Alfabética</a></li>
        <li><a href="listarJogos.jsp">Gerar Jogos</a></li>
        <li><a href="mostrarGrupos.jsp">Mostrar Grupos</a></li>
        <li><a href="buscarJogos.jsp">Pesquisar Jogo por Data</a></li>
      </ul>
    </div>
  </body>
</html>
