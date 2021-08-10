package modelos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;
public class Cozinha extends PedidoCliente{
    
    private String observacao;
    private String descProduto;
    private String statusPedido;
    private int codProduto;
    private int codMesa;

    @Override
    public Cozinha consultarPedido(int pCodMesa) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT descproduto, observacao ";
                sql += "FROM pedidocliente ";
                sql += "WHERE codmesa = ? ";
        Cozinha cozinha = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCodMesa);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cozinha = new Cozinha();
                cozinha.setDescProduto(rs.getString("descproduto"));
                cozinha.setObservacao(rs.getString("observacao"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return cozinha;
    }
    
    public boolean atualizarPedido() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE pedidocliente ";
                sql += " SET statuspedido = ? ";
                sql += " WHERE codmesa  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.statusPedido);
            stm.setInt   (2, this.codMesa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public List<Cozinha> lovItem() {
        List<Cozinha> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT descproduto, observacao ";
                sql += "FROM pedidocliente ";
                sql += "ORDER BY codmesa";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Cozinha cozinha = new Cozinha();
                cozinha.setDescProduto(rs.getString("descproduto"));
                cozinha.setObservacao(rs.getString("observacao"));
                lista.add(cozinha);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    /* ÁREA DE GETTERS E SETTERS */ 
        

    @Override
    public String getObservacao() {
        return observacao;
    }

    @Override
    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }
    

    @Override
    public String getDescProduto() {
        return descProduto;
    }

    @Override
    public void setDescProduto(String descProduto) {
        this.descProduto = descProduto;
    }

    @Override
    public int getCodProduto() {
        return codProduto;
    }

    @Override
    public void setCodProduto(int codProduto) {
        this.codProduto = codProduto;
    }

    @Override
    public String getStatusPedido() {
        return statusPedido;
    }

    @Override
    public void setStatusPedido(String statusPedido) {
        this.statusPedido = statusPedido;
    }

    @Override
    public int getCodMesa() {
        return codMesa;
    }

    @Override
    public void setCodMesa(int codMesa) {
        this.codMesa = codMesa;
    }

}
