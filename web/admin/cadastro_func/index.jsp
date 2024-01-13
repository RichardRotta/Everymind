<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../assets/dist/css/bootstrap.min.css" rel="stylesheet" >
        <link href="../../styles/styles.css" rel="stylesheet" >

    </head>
    <body class="body-container p-4">
        <div class="container p-5">
            <form class="form-container" name="FormCadFun" method="post" action="cadastro.jsp">
                <h1 class="h3 mb-3">Cadastro de Produtos</h1>
                <div class="mb-3">
                    <label for="nome" class="form-label">Código do Produto</label>
                    <input type="text" class="form-control" id="cod_produto" name="cod_produto">
                </div>
                <div class="mb-3">
                    <label for="descricao" class="form-label">Nome do Produto</label>
                    <input type="text" class="form-control" id="nome_produto" name="nome_produto">
                </div>
                <div class="mb-3">
                    <label for="image" class="form-label">Descrição do Produto</label>
                    <input type="text" class="form-control" id="descricao_produto" name="descricao_produto">
                </div>
                <div class="mb-3">
                    <label for="recomendacaoUso" class="form-label">Preço do Produto</label>
                    <input type="text" class="form-control" id="preco_produto" name="preco_produto">
                </div>

                <div class="d-flex  justify-content-center">
                    <button type="reset" class="btn btn-primary ">Limpar</button>
                    <button type="submit" class="btn btn-success ms-3">Salvar</button>
                </div>
            </form>
        </div>
    </body>
</html>
