package modelos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;
public class Cozinha {
    
    private int id;
    private int idPedido;
    private String observacao;
    private int nrMesa;
    private String nomeProduto;
    private int codProduto;
    private String tipoProduto;
    private float preco;
    private String status;

    public Cozinha ConsultarPedido(int nrMesa) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codproduto, nomeproduto, tipoproduto, preco ";
                sql += "FROM pedidocliente ";
                sql += "WHERE nrmesa = ?";
        Cozinha cozinha = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, nrMesa);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cozinha = new Cozinha();
                cozinha.setNrMesa(nrMesa);
                cozinha.setCodProduto(rs.getInt("codproduto"));
                cozinha.setNomeProduto(rs.getString("nomeproduto"));
                cozinha.setTipoProduto(rs.getString("tipoproduto"));
                cozinha.setPreco(rs.getFloat("preco"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return cozinha;
    }
    
    public List<Cozinha> lovItem() {
        List<Cozinha> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codproduto, nomeproduto, tipoproduto, preco ";
                sql += "FROM pedidocliente ";
                sql += "ORDER BY nrmesa";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Cozinha cozinha = new Cozinha();
                cozinha.setNrMesa(nrMesa);
                cozinha.setCodProduto(rs.getInt("codproduto"));
                cozinha.setNomeProduto(rs.getString("nomeproduto"));
                cozinha.setTipoProduto(rs.getString("tipoproduto"));
                cozinha.setPreco(rs.getFloat("preco"));
                lista.add(cozinha);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean AtualizarPedido() {
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

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }
    
    public int getNrMesa() {
        return nrMesa;
    }

    public void setNrMesa(int nrMesa) {
        this.nrMesa = nrMesa;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public int getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(int codProduto) {
        this.codProduto = codProduto;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
