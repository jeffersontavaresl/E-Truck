package modelos;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;
public class Caixa {

    private int codProduto;
    private int codMesa;
    private int codFormPagto;
    private float vlrTotal;
    private String produto;
    private String statusPagto;
    private Date dataMovimento;


    public Caixa consultarPedido(int pCodMesa) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT b.codmesa, a.codproduto, a.produto, c.preco ";
                sql += "FROM pedidocliente a, cardapio c, mesa b ";
                sql += "WHERE a.codmesa  = ? ";
                sql += "AND a.statuspagto = ? ";
                sql += "AND a.codproduto = c.codproduto ";
                sql += "AND a.codmesa = b.codmesa ";
        Caixa caixa = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCodMesa);
            stm.setString(2, this.statusPagto);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                caixa = new Caixa();
                caixa.setCodMesa(rs.getInt("codmesa"));
                caixa.setCodProduto(rs.getInt("codproduto"));
                caixa.setProduto(rs.getString("produto"));
                caixa.setVlrTotal(rs.getFloat("preco"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return caixa;
    }
    
    public List<Caixa> consultaPedido(int pCodMesa) {
        List<Caixa> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT b.codmesa, a.codproduto, a.produto, c.preco ";
                sql += "FROM pedidocliente a, cardapio c, mesa b ";
                sql += "WHERE a.codmesa = ? ";
                sql += "AND a.statusPagto = ? ";
                sql += "AND a.codproduto = c.codproduto";
                sql += "AND a.codmesa = b.codmesa";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCodMesa);
            stm.setString(2, this.statusPagto);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Caixa caixa = new Caixa();
                caixa.setCodProduto(rs.getInt("codproduto"));
                caixa.setProduto(rs.getString("produto"));
                caixa.setVlrTotal(rs.getFloat("preco"));
                caixa.setStatusPagto(rs.getString("statuspagto"));
                lista.add(caixa);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }
    
    public List<Caixa> lovItem() {
        List<Caixa> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT b.codmesa, a.codproduto, a.produto, ";
		sql += "c.preco, a.statuspagto "; 
                sql += "FROM pedidocliente a, cardapio c, mesa b ";
                sql += "ORDER BY codmesa";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Caixa caixa = new Caixa();
                caixa.setCodProduto(rs.getInt("codproduto"));
                caixa.setProduto(rs.getString("produto"));
                caixa.setVlrTotal(rs.getFloat("preco"));
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
                sql += " SET statuspagto   = ? ";
                sql += " WHERE codmesa  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.statusPagto);
            stm.setInt   (2, this.codMesa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public boolean InserirFormaPagto(){
        Caixa caixa = new Caixa();
        caixa.fecharPedido();
        Connection con = Conexao.conectar();
        String sql  = "INSERT INTO caixa ";
               sql += "datamovimento, codformpagto, vlrtotal ";
               sql += "VALUES (?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setDate  (1, this.getDataMovimento());
            stm.setInt   (2, this.codFormPagto);
            stm.setFloat (3, this.vlrTotal);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    
    /* ÁREA DE GETTERS E SETTERS */ 

    public int getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(int codProduto) {
        this.codProduto = codProduto;
    }

    public int getCodMesa() {
        return codMesa;
    }

    public void setCodMesa(int codMesa) {
        this.codMesa = codMesa;
    }

    public int getCodFormPagto() {
        return codFormPagto;
    }

    public void setCodFormPagto(int codFormPagto) {
        this.codFormPagto = codFormPagto;
    }

    public float getVlrTotal() {
        return vlrTotal;
    }

    public void setVlrTotal(float vlrTotal) {
        this.vlrTotal = vlrTotal;
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

    public Date getDataMovimento() {
        return dataMovimento;
    }

    public void setDataMovimento(Date dataMovimento) {
        this.dataMovimento = dataMovimento;
    }
    
}
