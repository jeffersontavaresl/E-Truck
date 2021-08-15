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
    private String descProduto;
    private String statusPagto;
    private String mesa;
    private String descFormPagto;
    private String descBandeira;
    private Date dataMovimento;


    public Caixa consultarPedido(int pCodMesa, String pStatusPagto) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT b.codmesa, a.codproduto, c.descproduto, c.preco ";
                sql += "FROM pedidocliente a, cardapio c, mesa b ";
                sql += "WHERE a.codmesa  = ? ";
                sql += "AND a.statuspagto = ? ";
                sql += "AND a.codproduto = c.codproduto ";
                sql += "AND a.codmesa = b.codmesa ";
        Caixa caixa = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCodMesa);
            stm.setString(2, pStatusPagto);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                caixa = new Caixa();
                caixa.setCodMesa(rs.getInt("codmesa"));
                caixa.setCodProduto(rs.getInt("codproduto"));
                caixa.setDescProduto(rs.getString("descproduto"));
                caixa.setVlrTotal(rs.getFloat("preco"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return caixa;
    }
    
    public List<Caixa> consultaPedido(int pCodMesa, String pStatusPagto) {
        List<Caixa> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT b.codmesa, a.codproduto, c.descproduto, c.preco, ";
                sql += " a.statuspagto, b.mesa ";
                sql += "FROM pedidocliente a, cardapio c, mesa b ";
                sql += "WHERE a.codmesa = ? ";
                sql += "AND a.statuspagto = ? ";
                sql += "AND a.codproduto = c.codproduto ";
                sql += "AND a.codmesa = b.codmesa";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCodMesa);
            stm.setString(2, pStatusPagto);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Caixa caixa = new Caixa();
                caixa.setCodProduto(rs.getInt("codproduto"));
                caixa.setDescProduto(rs.getString("descproduto"));
                caixa.setVlrTotal(rs.getFloat("preco"));
                caixa.setStatusPagto(rs.getString("statuspagto"));
                caixa.setCodMesa(rs.getInt("codmesa"));
                caixa.setMesa(rs.getString("mesa"));
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
        String  sql  = "SELECT b.codmesa, a.codproduto, c.descproduto, ";
		sql += "c.preco, a.statuspagto "; 
                sql += "FROM pedidocliente a, cardapio c, mesa b ";
                sql += "ORDER BY a.codmesa";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Caixa caixa = new Caixa();
                caixa.setCodProduto(rs.getInt("codproduto"));
                caixa.setDescProduto(rs.getString("descproduto"));
                caixa.setVlrTotal(rs.getFloat("preco"));
                caixa.setStatusPagto(rs.getString("statuspagto"));
                lista.add(caixa);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean fecharPedido(int pCodMesa) {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE pedidocliente";
                sql += " SET statuspagto   = ? ";
                sql += " WHERE codmesa  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.statusPagto);
            stm.setInt   (2, pCodMesa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public boolean InserirFormaPagto(){
        Connection con = Conexao.conectar();
        String sql  = "INSERT INTO caixa ";
               sql += "(datamovimento, codformpagto, vlrtotal) ";
               sql += "VALUES (?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setDate  (1, this.dataMovimento);
            stm.setInt   (2, this.codFormPagto);
            stm.setFloat (3, this.vlrTotal);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
        public List<Caixa> lovPagtos() {
        List<Caixa> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT * from formapagamento";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Caixa caixa = new Caixa();
                caixa.setCodFormPagto(rs.getInt("codformpagto"));
                caixa.setDescFormPagto(rs.getString("descformpagto"));
                caixa.setDescBandeira(rs.getString("descbandeira"));
                lista.add(caixa);
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

    public String getDescProduto() {
        return descProduto;
    }

    public void setDescProduto(String descProduto) {
        this.descProduto = descProduto;
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

    public String getMesa() {
        return mesa;
    }

    public void setMesa(String mesa) {
        this.mesa = mesa;
    }

    public String getDescFormPagto() {
        return descFormPagto;
    }

    public void setDescFormPagto(String descFormPagto) {
        this.descFormPagto = descFormPagto;
    }

    public String getDescBandeira() {
        return descBandeira;
    }

    public void setDescBandeira(String descBandeira) {
        this.descBandeira = descBandeira;
    }
    
}
