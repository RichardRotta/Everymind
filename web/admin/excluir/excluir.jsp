<%@page import="model.dao.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../assets/dist/css/bootstrap.min.css" rel="stylesheet" >
        <link href="../../styles/styles.css" rel="stylesheet" >
    </head>
    <body>

        <%
            int cod_produto = Integer.parseInt(request.getParameter("cod_produto"));

            Produto produto = new Produto();
            produto.setCod_produto(cod_produto);

            ProdutoDAO produtoDAO = new ProdutoDAO();

            if (produtoDAO.excluir(produto) == true) {
        %>

        <div class="container p-3">
            <div class="container p-4 mt-5">
                <h3 class="mt-5 mb-4 container">
                    Excluido com Sucesso!
                    <h6 class="text-muted ms-3 mb-5" href='login.html'>Você será redirecionado</small>
                </h3>
                <img class="img-fluid" src="../../imagem/mensagem/excluir.svg" alt="não há itens"  width="300" 
                     height="450" /> 
            </div>
        </div>
        <script>
            setTimeout(function () {
                window.location.replace("http://localhost:8080/Everymind/admin");
            }, 2500);
        </script>
        <%
        } else {
        %>
        <div class="alert alert-danger" role="alert">
            Produto não excluido!
        </div>
        <script>
            setTimeout(function () {
                window.location.replace("http://localhost:8080/Everymind/admin/excluir");
            }, 2500);
        </script>
        <%
        }
        %>

    </body>
</html>
