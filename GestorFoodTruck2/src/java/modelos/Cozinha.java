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
    private String statusPedido;

    public Cozinha consultarPedido(int codPedido) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codpedido, codproduto, produto, observacao, statuspedido ";
                sql += "FROM pedidocliente ";
                sql += "WHERE codpedido = ? ";
        Cozinha cozinha = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.codPedido);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cozinha = new Cozinha();
                cozinha.setCodPedido(rs.getInt("codpedido"));
                cozinha.setCodProduto(rs.getInt("codproduto"));
                cozinha.setProduto(rs.getString("produto"));
                cozinha.setObservacao(rs.getString("observacao"));
                cozinha.setStatusPedido(rs.getString("statuspedido"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return cozinha;
    }
    
    public List<Cozinha> lovItem() {
        List<Cozinha> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codpedido, codproduto, produto, observacao, statuspedido ";
                sql += "FROM pedidocliente ";
                sql += "ORDER BY codpedido";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Cozinha cozinha = new Cozinha();
                cozinha.setCodPedido(rs.getInt("codpedido"));
                cozinha.setCodProduto(rs.getInt("codproduto"));
                cozinha.setProduto(rs.getString("produto"));
                cozinha.setObservacao(rs.getString("observacao"));
                cozinha.setStatusPedido(rs.getString("statuspedido"));
                lista.add(cozinha);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean atualizarPedido() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE pedidocliente ";
                sql += " SET statuspedido   = ? ";
                sql += " WHERE codpedido  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.statusPedido);
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

    public void setStatusPedido(String statusPedido) {
        this.statusPedido = statusPedido;
    }

}
