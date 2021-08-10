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
    private String descProduto;
    private float preco;
    
        public boolean cadastrarItem() {
        String  sql  = "INSERT INTO cardapio (descproduto, preco) ";
                sql += "VALUES(?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.descProduto);
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
        String  sql  = "UPDATE cardapio ";
                sql += " SET descproduto = ?, ";
                sql += "     preco      = ? ";
                sql += " WHERE codproduto = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.descProduto);
            stm.setFloat (2, this.preco);
            stm.setInt   (3, this.codProduto);
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
                sql += " WHERE codproduto = ? ";
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

    public Cardapio consultarItem(int pCodProduto) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codproduto, descproduto, preco ";
                sql += "FROM cardapio ";
                sql += "WHERE codproduto = ?";
        Cardapio cardapio = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCodProduto);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cardapio = new Cardapio();
                cardapio.setCodProduto(rs.getInt("codProduto"));
                cardapio.setDescProduto(rs.getString("descProduto"));
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
        String  sql  = "SELECT * from cardapio ";
                sql += "ORDER BY codproduto";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Cardapio cardapio = new Cardapio();
                cardapio.setCodProduto(rs.getInt("codProduto"));
                cardapio.setDescProduto(rs.getString("descProduto"));
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

    public String getDescProduto() {
        return descProduto;
    }

    public void setDescProduto(String descProduto) {
        this.descProduto = descProduto;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }
    
    
}
