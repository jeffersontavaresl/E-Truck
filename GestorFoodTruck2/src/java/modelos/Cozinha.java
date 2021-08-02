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
    private int codPedido;
    private String observacao;
    private String produto;
    private int codProduto;
    private String tipoProduto;
    private float preco;
    private String statusPedido;

    public Cozinha consultarPedido(int codPedido) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT a.produto, a.observacao, a.statuspedido ";
                sql += " FROM pedidocliente a, cozinha b";
                sql += " WHERE a.codpedido = ? ";
                sql += " AND a.codpedido = b.codpedido ";
        Cozinha cozinha = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, codPedido);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cozinha = new Cozinha();
                cozinha.setProduto(rs.getString("produto"));
                cozinha.setNomeProduto(rs.getString("observacao"));
                cozinha.setTipoProduto(rs.getString("statuspedido"));
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

    public boolean atualizarPedido() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE pedidocliente a, cozinha b ";
                sql += " SET a.statuspedido   = ?, ";
                sql += "     b.statuspedido = ? ";
                sql += " WHERE a.codPedido  = ? ";
                sql += " AND a.codpedido = b.codpedido ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.statusPedido);
            stm.setString(2, this.statusPedido);
            stm.setInt   (3, this.codPedido);
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

    public int getCodPedido() {
        return codPedido;
    }

    public void setCodPedido(int codPedido) {
        this.codPedido = codPedido;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }
    

    public String getProduto() {
        return produto;
    }

    public void setProduto(String produto) {
        this.produto = produto;
    }

    public int getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(int codProduto) {
        this.codProduto = codProduto;
    }

    public String getStatusPedido() {
        return statusPedido;
    }

    public void setStatusPedido(String status) {
        this.statusPedido = statusPedido;
    }

}
