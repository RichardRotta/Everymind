package model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Produto;
import util.ConectaDB;

public class ProdutoDAO {

    //Métodos
    public boolean cadastrarProduto(Produto produto) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();

            String sql = "INSERT into produtos(cod_prod, nome_prod, descricao_prod, preco_prod) "
                    + "values('" + produto.getCod_produto()+ "','" + produto.getNome_produto()+ "','" + produto.getDescricao_produto()
                    + "','" + produto.getPreco_produto() + "')";

            stmt.executeUpdate(sql); // Insert, Delete ou Update            
            conexao.close();
            return true;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Exception: " + ex.toString());
            return false;
        }
    }

    public Produto consultarCod(Produto produto) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT nome_prod, descricao_prod, preco_prod from produtos WHERE cod_prod = '" + produto.getCod_produto() + "'";
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                // lendo as linhas do banco de dados e colocando nas variáveis da classe produto
                produto.setNome_produto(rs.getString("nome_prod"));
                produto.setDescricao_produto(rs.getString("descricao_prod"));
                produto.setPreco_produto(rs.getDouble("preco_prod"));
                n_reg++;
            }
            conexao.close();

            if (n_reg == 0) {
                return null;
            } else {
                return produto;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }

    public Produto consultarCodAtualizarProd(Produto produto) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT nome_prod, descricao_prod, preco_prod from produtos WHERE cod_prod = '" + produto.getCod_produto() + "'";
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                // 
                produto.setNome_produto(rs.getString("nome_prod"));
                produto.setDescricao_produto(rs.getString("descricao_prod"));
                produto.setPreco_produto(rs.getDouble("preco_prod"));
                n_reg++;
            }
            conexao.close();

            if (n_reg == 0) {
                return null;
            } else {
                return produto;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }

    public boolean excluir(Produto produto) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();

            //DELETE FROM produto WHERE matric = '333';;            
            String sql = "DELETE FROM produtos WHERE cod_prod = '" + produto.getCod_produto() + "'";

            stmt.executeUpdate(sql);           
            conexao.close();
            return true;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Erro: " + ex.toString());
            return false;
        }
    }

    public boolean atualizarProduto(Produto produto) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();

            String sql = "UPDATE produtos SET nome_prod='" + produto.getNome_produto()
                    + "', descricao_prod='" + produto.getDescricao_produto() 
                    + "', preco_prod=" + produto.getPreco_produto()
                    + "" + " WHERE cod_prod = '" + produto.getCod_produto() + "'";

            stmt.executeUpdate(sql); //Update        

            conexao.close();
            return true;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Erro: " + ex.toString());
            return false;
        }
    }
}
