<%@page import="model.dao.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../assets/dist/css/bootstrap.min.css" rel="stylesheet" >
        <link href="../../styles/styles.css" rel="stylesheet" >
    </head>
    <body class="body-container">
        <div class="container p-5">
            <h1 class="h3 mb-3">Excluir</h1>
            <form name="FormCliCons form-container" method="post" action="excluir.jsp">
                <div class="mb-3">
                    <input type="text"  placeholder="Insira o Código do Produto desejado" class="form-control" id="cod_produto" name="cod_produto">
                </div>
                <div class="d-flex  justify-content-center">
                    <button type="reset" class="btn btn-primary">Limpar</button>
                    <button type="submit" class="btn btn-success ms-3">Excluir</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
