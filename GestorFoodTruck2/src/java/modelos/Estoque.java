package modelos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;
public class Estoque {

    private int codestoque;
    private String produto;
    private String descricao;
    private float valorProduto;
    private int quantidade;
    private int codProduto;
    
    public boolean cadastrarItem() {
        String  sql  = "INSERT INTO estoque (codproduto, ";
                sql += "produto, descricao, valorproduto, quantidade) ";
                sql += "VALUES(?,?,?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1, this.codProduto);
            stm.setString(2, this.produto);
            stm.setString(3, this.descricao);
            stm.setFloat (4, this.valorProduto);
            stm.setInt   (5, this.quantidade);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean atualizarItem() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE estoque";
                sql += " SET quantidade   = ?, ";
                sql += " WHERE codproduto  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.quantidade);
            stm.setInt(2, this.codProduto);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public Estoque consultarItem(int pCodProduto) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codproduto, produto, ";
		sql += "descricao, valorproduto, quantidade ";
                sql += "FROM estoque ";
                sql += "WHERE codproduto = ?";
        Estoque estoque = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCodProduto);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                estoque = new Estoque();
                estoque.setCodProduto(rs.getInt("codproduto"));
                estoque.setProduto(rs.getString("produto"));
                estoque.setDescricao(rs.getString("descricao"));
                estoque.setValorProduto(rs.getFloat("valorproduto"));
                estoque.setQuantidade(rs.getInt("quantidade"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return estoque;
    }
    
    public List<Estoque> lovItem() {
        List<Estoque> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codproduto, produto, ";
		sql += "descricao, valorproduto, quantidade ";
                sql += "FROM estoque ";
                sql += "ORDER BY codproduto";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Estoque estoque = new Estoque();
                estoque.setCodProduto(rs.getInt("codproduto"));
                estoque.setProduto(rs.getString("produto"));
                estoque.setDescricao(rs.getString("descricao"));
                estoque.setValorProduto(rs.getFloat("valorProduto"));
                estoque.setQuantidade(rs.getInt("quantidade"));
                lista.add(estoque);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

   public boolean excluirItem() {
        Connection con = Conexao.conectar();
        String  sql  = "DELETE FROM estoque ";
                sql += " WHERE codproduto = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.codProduto);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    /* ÁREA DE GETTERS E SETTERS */ 

    public int getCodestoque() {
        return codestoque;
    }

    public void setCodestoque(int codestoque) {
        this.codestoque = codestoque;
    }

    public String getProduto() {
        return produto;
    }

    public void setProduto(String produto) {
        this.produto = produto;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public float getValorProduto() {
        return valorProduto;
    }

    public void setValorProduto(float valorProduto) {
        this.valorProduto = valorProduto;
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

    
}
