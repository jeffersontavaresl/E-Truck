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
    private String produto;
    private int codProduto;
    private int quantidade;

    public boolean pedirItem() {
        String  sql  = "INSERT INTO pedidofornecedor (codproduto, produto, quantidade, idfornecedor) ";
                sql += "VALUES(?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1, this.codProduto);
            stm.setString(2, this.produto);
            stm.setInt   (3, this.quantidade);
            stm.setInt   (4, this.idFornecedor);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public Administrador consultarPedidoItem(int id) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codproduto, produto, quantidade, idfornecedor ";
                sql += "FROM pedidofornecedor ";
                sql += "WHERE id = ?";
        Administrador adm = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                adm = new Administrador();
                adm.setCodProduto(rs.getInt("codproduto"));
                adm.setProduto(rs.getString("produto"));
                adm.setQuantidade(rs.getInt("quantidade"));
                adm.setIdFornecedor(rs.getInt("idfornecedor"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return adm;
    }
    
    public List<Administrador> lovPedidos() {
        List<Administrador> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codproduto, produto, quantidade, idfornecedor ";
                sql += "FROM pedidofornecedor ";
                sql += "ORDER BY idfornecedor";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Administrador adm = new Administrador();
                adm.setCodProduto(rs.getInt("codproduto"));
                adm.setProduto(rs.getString("nomeProduto"));
                adm.setQuantidade(rs.getInt("quantidade"));
                adm.setIdFornecedor(rs.getInt("idfornecedor"));
                lista.add(adm);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean cancelarPedidoItem() {
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

    public boolean alterarPedidoItem() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE pedidofornecedor";
                sql += " SET codproduto   = ?,";
                sql += "     produto      =?" ;
                sql += "     quantidade   = ?,";
                sql += " WHERE id  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1, this.codProduto);
            stm.setString(2, this.produto);
            stm.setInt   (3, this.quantidade);
            stm.setInt   (4, this.id);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public boolean cadastrarUsuario() {
        String  sql  = "INSERT INTO Usuario (login, senha) ";
                sql += "VALUES(?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.usuario);
            stm.setString(2, this.senha);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public boolean excluirUsuario() {
        Connection con = Conexao.conectar();
        String  sql  = "DELETE FROM usuario ";
                sql += " WHERE usuario = ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.usuario);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    /* ÁREA DE GETTERS E SETTERS */ 
    
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

    public String getProduto() {
        return produto;
    }

    public void setProduto(String produto) {
        this.produto = produto;
    }
    
    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public int getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(int codProduto) {
        this.codProduto = codProduto;
    }

     public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

}
