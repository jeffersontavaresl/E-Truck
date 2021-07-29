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
    private int nrMesa;
    private String formPagamento;
    private float preco;
    private int codProduto;
    private String nomeProduto;
    private String tipoProduto;
    private String status;

    public Caixa ConsultarPedido(int nrMesa) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codproduto, nomeproduto, tipoproduto, preco ";
                sql += "FROM pedidocliente ";
                sql += "WHERE nrmesa = ?";
        Caixa caixa = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, nrMesa);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                caixa = new Caixa();
                caixa.setNrMesa(nrMesa);
                caixa.setCodProduto(rs.getInt("codproduto"));
                caixa.setNomeProduto(rs.getString("nomeproduto"));
                caixa.setTipoProduto(rs.getString("tipoproduto"));
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
        String  sql  = "SELECT codproduto, nomeproduto, tipoproduto, preco ";
                sql += "FROM pedidocliente ";
                sql += "ORDER BY nrmesa";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Caixa caixa = new Caixa();
                caixa.setNrMesa(nrMesa);
                caixa.setCodProduto(rs.getInt("codproduto"));
                caixa.setNomeProduto(rs.getString("nomeproduto"));
                caixa.setTipoProduto(rs.getString("tipoproduto"));
                caixa.setPreco(rs.getFloat("preco"));
                lista.add(caixa);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean FecharPedido() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE pedidocliente";
                sql += " SET status   = ?,";
                sql += " WHERE nrmesa  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.getStatus());
            stm.setInt   (2, this.nrMesa);
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

    public int getNrMesa() {
        return nrMesa;
    }

    public void setNrMesa(int nrMesa) {
        this.nrMesa = nrMesa;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
