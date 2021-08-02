package modelos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;
public class Cardapio extends Administrador {

    private int id;
    private String nomeProduto;
    private String tipoProduto;
    private float preco;
    private int idEstoque;
    private int codProduto;
    
        public boolean cadastrarItem() {
        String  sql  = "INSERT INTO cardapio (codproduto, nomeproduto, ";
                sql += "tipoproduto,preco) ";
                sql += "VALUES(?,?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1, this.codProduto);
            stm.setString(2, this.nomeProduto);
            stm.setString(3, this.tipoProduto);
            stm.setFloat (4, this.preco);
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
                sql += " SET codproduto   = ?,";
                sql += "     nomeproduto   = ?,";
                sql += "     tipoproduto   = ?,";
                sql += "     preco         = ? ";
                sql += " WHERE codproduto  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1, this.codProduto);
            stm.setString(2, this.nomeProduto);
            stm.setString(3, this.tipoProduto);
            stm.setFloat (4, this.preco);
            stm.setInt(5, this.codProduto);
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

    public Cardapio consultarItem(String nomeProduto) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codproduto, nomeproduto, tipoproduto, preco ";
                sql += "FROM cardapio ";
                sql += "WHERE nomeproduto = ?";
        Cardapio cardapio = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, nomeProduto);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cardapio = new Cardapio();
                cardapio.setCodProduto(rs.getInt("codproduto"));
                cardapio.setNomeProduto(nomeProduto);
                cardapio.setTipoProduto(rs.getString("tipoproduto"));
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
        String  sql  = "SELECT codproduto, nomeproduto, tipoproduto, preco ";
                sql += "FROM cardapio ";
                sql += "ORDER BY codproduto";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Cardapio cardapio = new Cardapio();
                cardapio.setCodProduto(rs.getInt("codproduto"));
                cardapio.setNomeProduto(rs.getString("nomeproduto"));
                cardapio.setTipoProduto(rs.getString("tipoproduto"));
                cardapio.setPreco(rs.getFloat("preco"));
                lista.add(cardapio);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String getNomeProduto() {
        return nomeProduto;
    }

    @Override
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

    public int getIdEstoque() {
        return idEstoque;
    }

    public void setIdEstoque(int idEstoque) {
        this.idEstoque = idEstoque;
    }
    
    public int getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(int codProduto) {
        this.codProduto = codProduto;
    }
}
