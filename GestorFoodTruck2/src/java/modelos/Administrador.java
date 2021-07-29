package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;


public class Administrador {

    private int id;
    private String usuario;
    private String senha;
    private int idFornecedor;
    private String nomeProduto;
    private int quantidade;

    public boolean PedirItem() {
        String  sql  = "INSERT INTO pedidofornecedor (nomeproduto, quantidade, idfornecedor) ";
                sql += "VALUES(?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nomeProduto);
            stm.setInt(2, this.quantidade);
            stm.setInt (3, this.idFornecedor);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public Administrador ConsultarPedidoItem(String nomeProduto) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT nomeproduto, quantidade, idfornecedor ";
                sql += "FROM pedidofornecedor ";
                sql += "WHERE nomeproduto = ?";
        Administrador adm = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, nomeProduto);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                adm = new Administrador();
                adm.setNomeProduto(rs.getString("nomeProduto"));
                adm.setQuantidade(rs.getInt("quantidade"));
                adm.setIdFornecedor(rs.getInt("idfornecedor"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return adm;
    }
    
    public List<Administrador> lovItem() {
        List<Administrador> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT nomeproduto, quantidade, idfornecedor ";
                sql += "FROM pedidofornecedor ";
                sql += "ORDER BY idfornecedor";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Administrador adm = new Administrador();
                adm.setNomeProduto(rs.getString("nomeProduto"));
                adm.setQuantidade(rs.getInt("quantidade"));
                adm.setIdFornecedor(rs.getInt("idfornecedor"));
                lista.add(adm);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean CancelarPedidoItem() {
        Connection con = Conexao.conectar();
        String  sql  = "DELETE FROM pedidofornecedor ";
                sql += " WHERE id = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean AlterarPedidoItem() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE pedidofornecedor";
                sql += " SET nomeproduto   = ?,";
                sql += "     quantidade   = ?,";
                sql += " WHERE id  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nomeProduto);
            stm.setInt(2, this.quantidade);
            stm.setInt(3, this.id);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdFornecedor() {
        return idFornecedor;
    }

    public void setIdFornecedor(int idFornecedor) {
        this.idFornecedor = idFornecedor;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }
    
    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

}
