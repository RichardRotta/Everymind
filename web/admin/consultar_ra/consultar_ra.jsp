<%@page import="model.dao.FuncionarioDAO"%>
<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles.css" rel="stylesheet" >
        <link href="../../assets/dist/css/bootstrap.min.css" rel="stylesheet" >

    </head>
    <body>
        <div class="container">

            <h1 class="sigle-item-title">Consulta de Funcionario</h1>

            <%
                int cod_produto = Integer.parseInt(request.getParameter("cod_produto"));

                Funcionario funcionario = new Funcionario();
                funcionario.setCod_produto(cod_produto);

                FuncionarioDAO funcionarioDAO = new FuncionarioDAO();

                if (funcionarioDAO.consultarRa(funcionario) != null) {
            %>
            <div class="single-item-container">
                <div class="p-3">
                    <p><b>Nome do Produto:</b> <%= funcionario.getNome_produto()%></p>
                    <p><b>Descrição do Produto:</b> <%= funcionario.getDescricao_produto()%></p>
                    <p><b>Preço do Produto:</b> <%= funcionario.getPreco_produto()%></p>
                </div>
            </div>
            <%
            } else {
            %>

            <div class="alert alert-danger" role="alert">
                Item não encontrado.
            </div>
            <script>
                setTimeout(function () {
                    window.location.replace("http://localhost:8080/Everymind/admin/consultar_ra");
                }, 2500);
            </script>
            <%
                }

            %>

        </div>




    </body>
</html>
