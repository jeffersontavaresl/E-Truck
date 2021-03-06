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
    private int idProduto;
    private int idEstoque;
    private int idFornecedor;
    private String nomeProduto;
    private String tipoProduto;
    private float preco;

    public boolean CadastrarItem() {
        String  sql  = "INSERT INTO cardapio (nomeproduto,";
                sql += "tipoproduto,preco) ";
                sql += "VALUES(?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nomeProduto);
            stm.setString(2, this.tipoProduto);
            stm.setFloat (3, this.preco);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean AlterarItem() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE cardapio";
                sql += " SET nomeproduto   = ?,";
                sql += "     tipoproduto   = ?,";
                sql += "     preco         = ? ";
                sql += " WHERE nomeproduto = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nomeProduto);
            stm.setString(2, this.tipoProduto);
            stm.setFloat (3, this.preco);
            stm.setString(4, this.nomeProduto);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean ExcluirItem() {
        Connection con = Conexao.conectar();
        String  sql  = "DELETE FROM cardapio ";
                sql += " WHERE nomeproduto = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nomeProduto);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public void ConsultarItem() {
        // TODO implement here
    }

    public void PedirItem() {
        // TODO implement here
    }

    public void ConsultarPedidoItem() {
        // TODO implement here
    }

    public void CancelarPedidoItem() {
        // TODO implement here
    }

    public void AlterarPedidoItem() {
        // TODO implement here
    }

    public void AdicionarFornecedor() {
        // TODO implement here
    }

    public void AlterarFornecedor() {
        // TODO implement here
    }

    public void ExcluirFornecedor() {
        // TODO implement here
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public int getIdEstoque() {
        return idEstoque;
    }

    public void setIdEstoque(int idEstoque) {
        this.idEstoque = idEstoque;
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

    public String getTipoProduto() {
        return tipoProduto;
    }

    public void setTipoProduto(String tipoProduto) {
        this.tipoProduto = tipoProduto;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

}