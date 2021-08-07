package modelos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;
public class Cardapio {

    private int codProduto;
    private String produto;
    private float preco;
    
        public boolean cadastrarItem() {
        String  sql  = "INSERT INTO cardapio (produto, preco)";
                sql += "VALUES(?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.produto);
            stm.setFloat (2, this.preco);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterarItem() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE cardapio";
                sql += " SET produto = ?,";
                sql += "     preco      = ? ";
                sql += " WHERE codproduto = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.produto);
            stm.setFloat (2, this.preco);
            stm.setString(3, this.codProduto);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean excluirItem() {
        Connection con = Conexao.conectar();
        String  sql  = "DELETE FROM cardapio ";
                sql += " WHERE codproduto = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.codProduto);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public Cardapio consultarItem(String pCodProduto) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codproduto, produto, preco ";
                sql += "FROM cardapio ";
                sql += "WHERE codproduto= ?";
        Cardapio cardapio = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pCodProduto);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cardapio = new Cardapio();
                cardapio.setCodProduto(rs.getInt("codproduto"));
                cardapio.setProduto(rs.getString("produto"));
                cardapio.setPreco(rs.getFloat("preco"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return cardapio;
    }
    
    public List<Cardapio> lovCardapio() {
        List<Cardapio> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codproduto, produto, preco ";
                sql += "FROM cardapio ";
                sql += "ORDER BY codproduto";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Cardapio cardapio = new Cardapio();
                cardapio.setCodProduto(rs.getInt("codproduto"));
                cardapio.setProduto(rs.getString("produto"));
                cardapio.setPreco(rs.getFloat("preco"));
                lista.add(cardapio);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }
    
    /* ÁREA DE GETTERS E SETTERS */ 

    public int getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(int codProduto) {
        this.codProduto = codProduto;
    }

    public String getProduto() {
        return produto;
    }

    public void setProduto(String produto) {
        this.produto = produto;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }
    
    
}
