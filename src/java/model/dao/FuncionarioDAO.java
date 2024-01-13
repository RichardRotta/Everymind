package model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Funcionario;
import util.ConectaDB;

public class FuncionarioDAO {

    //Métodos
    public boolean cadastrarProduto(Funcionario funcionario) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();

            String sql = "INSERT into produtos(cod_prod, nome_prod, descricao_prod, preco_prod) "
                    + "values('" + funcionario.getCod_produto()+ "','" + funcionario.getNome_produto()+ "','" + funcionario.getDescricao_produto()
                    + "','" + funcionario.getPreco_produto() + "')";

            stmt.executeUpdate(sql); // Insert, Delete ou Update            
            conexao.close();
            return true;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Exception: " + ex.toString());
            return false;
        }
    }

    public Funcionario consultarRa(Funcionario funcionario) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT nome_prod, descricao_prod, preco_prod from produtos WHERE cod_prod = '" + funcionario.getCod_produto() + "'";
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                // lendo as linhas do banco de dados e colocando nas variáveis da classe produto
                funcionario.setNome_produto(rs.getString("nome_produto"));
                funcionario.setDescricao_produto(rs.getString("descricao_produto"));
                funcionario.setPreco_produto(rs.getDouble("preco_produto"));
                n_reg++;
            }
            conexao.close();

            if (n_reg == 0) {
                return null;
            } else {
                return funcionario;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }

    public Funcionario consultarCodAtualizarProd(Funcionario funcionario) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT nome_prod, descricao_prod, preco_prod from produtos WHERE cod_prod = '" + funcionario.getCod_produto() + "'";
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                // 
                funcionario.setNome_produto(rs.getString("nome_produto"));
                funcionario.setDescricao_produto(rs.getString("descricao_produto"));
                funcionario.setPreco_produto(rs.getDouble("preco_produto"));
                n_reg++;
            }
            conexao.close();

            if (n_reg == 0) {
                return null;
            } else {
                return funcionario;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }

    public boolean excluir(Funcionario funcionario) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();

            //DELETE FROM funcionario WHERE matric = '333';;            
            String sql = "DELETE FROM funcionario WHERE ra = '" + funcionario.getCod_produto() + "'";

            stmt.executeUpdate(sql); // Insert, Delete ou Update            
            System.out.println(" Registro Excluído! ");
            conexao.close();
            return true;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Erro: " + ex.toString());
            return false;
        }
    }

    public boolean atualizarFuncionario(Funcionario funcionario) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();

            String sql = "UPDATE funcionario SET nome_prod='" + funcionario.getNome_produto()
                    + "', descricao_prod='" + funcionario.getDescricao_produto() 
                    + "', preco_prod='" + funcionario.getPreco_produto()
                    + "'" + " WHERE ra = '" + funcionario.getCod_produto() + "'";

            stmt.executeUpdate(sql); //Update        

            System.out.println(" Registro Alterado com sucesso! ");
            conexao.close();
            return true;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Erro: " + ex.toString());
            return false;
        }
    }
}
