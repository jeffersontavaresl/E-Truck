package modelos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;
public class Caixa {

    private int id;
    private int codPedido;
    private String formPagamento;
    private float preco;
    private int codProduto;
    private String produto;
    private String statusPagto;

    public Caixa consultarPedido(int codPedido) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT a.codpedido, a.codproduto, a.produto, c.preco ";
                sql += "FROM pedidocliente a, cardapio c ";
                sql += "WHERE codpedido  = ? ";
                sql += "AND statusPagto = ? ";
                sql += "AND a.codproduto = c.codproduto";
        Caixa caixa = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, codPedido);
            stm.setString(2, this.statusPagto);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                caixa = new Caixa();
                caixa.setCodPedido(rs.getInt("codpedido"));
                caixa.setCodProduto(rs.getInt("codproduto"));
                caixa.setProduto(rs.getString("produto"));
                caixa.setPreco(rs.getFloat("preco"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return caixa;
    }
    
    public List<Caixa> lovItem() {
        List<Caixa> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT a.codpedido, a.codproduto, a.produto, ";
                sql += "c.preco, a.statuspagto ";
                sql += "FROM pedidocliente a, cardapio c";
                sql += "ORDER BY codpedido";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Caixa caixa = new Caixa();
                caixa.setCodPedido(rs.getInt("codpedido"));
                caixa.setCodProduto(rs.getInt("codproduto"));
                caixa.setProduto(rs.getString("produto"));
                caixa.setPreco(rs.getFloat("preco"));
                caixa.setStatusPagto(rs.getString("statuspagto"));
                lista.add(caixa);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean fecharPedido() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE pedidocliente";
                sql += " SET statuspagto   = ?,";
                sql += " WHERE codpedido  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.statusPagto);
            stm.setInt   (2, this.codPedido);
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

    public int getCodPedido() {
        return codPedido;
    }

    public void setCodPedido(int codPedido) {
        this.codPedido = codPedido;
    }

    public String getFormPagamento() {
        return formPagamento;
    }

    public void setFormPagamento(String formPagamento) {
        this.formPagamento = formPagamento;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }
    
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

    public String getStatusPagto() {
        return statusPagto;
    }

    public void setStatusPagto(String statusPagto) {
        this.statusPagto = statusPagto;
    }

}
