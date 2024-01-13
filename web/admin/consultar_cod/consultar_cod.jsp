<%@page import="model.dao.ProdutoDAO"%>
<%@page import="model.Produto"%>
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

            <h1 class="sigle-item-title">Consulta de Produto</h1>

            <%
                int cod_produto = Integer.parseInt(request.getParameter("cod_produto"));

                Produto produto = new Produto();
                produto.setCod_produto(cod_produto);

                ProdutoDAO produtoDAO = new ProdutoDAO();

                if (produtoDAO.consultarCod(produto) != null) {
            %>
            <div class="single-item-container">
                <div class="p-3">
                    <p><b>Nome do Produto:</b> <%= produto.getNome_produto()%></p>
                    <p><b>Descrição do Produto:</b> <%= produto.getDescricao_produto()%></p>
                    <p><b>Preço do Produto:</b> R$<%= produto.getPreco_produto()%></p>
                </div>
                <button class="btn btn-primary" onclick="voltar()">Voltar</button>
            </div>
            <script>
                function voltar()
                {
                    window.location.href = "http://localhost:8080/Everymind/admin";
                }
            </script>
            <%
            } else {
            %>

            <div class="alert alert-danger" role="alert">
                Produto não encontrado.
            </div>
            <script>
                setTimeout(function () {
                    window.location.replace("http://localhost:8080/Everymind/admin");
                }, 2500);
            </script>
            <%
                }

            %>

        </div>




    </body>
</html>
