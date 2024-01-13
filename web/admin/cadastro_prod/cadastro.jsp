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
            request.setCharacterEncoding("UTF-8");

            int cod_produto = Integer.parseInt(request.getParameter("cod_produto"));
            String nome_produto = request.getParameter("nome_produto");
            String descricao_produto = request.getParameter("descricao_produto");
            double preco_produto = Double.parseDouble(request.getParameter("preco_produto"));

            Produto produto = new Produto();

            produto.setCod_produto(cod_produto);
            produto.setNome_produto(nome_produto);
            produto.setDescricao_produto(descricao_produto);
            produto.setPreco_produto(preco_produto);

            ProdutoDAO produtoDAO = new ProdutoDAO();

            if (produtoDAO.cadastrarProduto(produto) == true) {
        %>
        <div class="container p-3">
            <div class="container p-4 mt-5">
                <h3 class="mt-5 mb-4 container">
                    Produto cadastrado com sucesso!
                    <h6 class="text-muted ms-3 mb-5" href='login.html'>Você será redirecionado</small>
                </h3>
                <img class="img-fluid" src="../../imagem/mensagem/cadastro.svg" alt="sucesso"  width="300" 
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
            Falha ao cadastrar Prdouto.
        </div>
        <script>
            setTimeout(function () {
                window.location.replace("http://localhost:8080/Everymind/admin/cadastro_prod");
            }, 2500);
        </script>
        <%
            }
        %>

    </body>
</html>
