<%@page import="model.dao.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../assets/dist/css/bootstrap.min.css" rel="stylesheet" >
        <link href="../../styles/styles.css" rel="stylesheet" >
    </head>
    <body class="body-container p-4">
        <%
            int cod_produto = Integer.parseInt(request.getParameter("cod_produto"));

            Produto produto = new Produto();
            produto.setCod_produto(cod_produto);

            ProdutoDAO produtoDAO = new ProdutoDAO();

            if (produtoDAO.consultarCodAtualizarProd(produto) != null) {
        %>
        <div class="container p-5">
            <form class="form-container" name="frmAltFunc" method="post" action="atualizar.jsp">
                <h3 class="mt-5 mb-3">Atualização Funcionário</h3> 
                <label for="descricao">Nome do Produto:</label>
                <input type="text"  name="nome_produto" class="form-control mb-3" id="nome_produto"  value="<%= produto.getNome_produto()%>">

                <label for="image">Descrição do Produto:</label>
                <input type="text"  name="descricao_produto" class="form-control mb-3" id="descricao_produto" value="<%= produto.getDescricao_produto()%>">

                <label for="recomendacaoUso">Preço do Produto:</label>
                <input type="text"  name="preco_produto" class="form-control mb-3" id="preco_produto"  value="<%= produto.getPreco_produto()%>">

                <div class="d-flex  justify-content-center">
                    <button type="reset" class="btn btn-primary ">Limpar</button>
                    <button type="submit" class="btn btn-success ms-3">Alterar</button>
                </div>
            </form>

        </div>

        <%
        } else {
        %>
        <div class="alert alert-danger" role="alert">
            Produto não encontrado!
        </div>
        <script>
            setTimeout(function () {
                window.location.replace("http://localhost:8080/Everymind/admin/atualizar_prod");
            }, 2500);
        </script>
        <%
        }
        %>
    </body>
</html>
