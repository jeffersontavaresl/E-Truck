package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

public class PedidoCliente {

    
    private int codPedido;
    private String observacao;
    private String produto;
    private String statusPedido;
    private String statusPagto;
    private int codProduto;

    public boolean realizarPedido() {
        String  sql  = "INSERT INTO pedidocliente (codpedido, codproduto, produto, ";
                sql += " observacao, statuspedido, statuspagto) ";
                sql += "VALUES(?,?,?,?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1, this.codPedido);
            stm.setInt   (2, this.codProduto);
            stm.setString(3, this.produto);
            stm.setString(4, this.observacao);
            stm.setString(5, this.statusPedido);
            stm.setString(6, this.statusPagto);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterarPedido() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE pedidocliente ";
                sql += " SET codproduto    = ?, ";
                sql += "     produto      = ?, ";
                sql += "     observacao   = ?, ";
                sql += "     statuspedido = ? ";
                sql += " WHERE codpedido  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1, this.codProduto);
            stm.setString(2, this.produto);
            stm.setString(3, this.observacao);
            stm.setString(4, this.statusPedido);
            stm.setInt   (5, this.codPedido);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public PedidoCliente consultarPedido(int codPedido) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codproduto, produto, observacao, statuspedido";
                sql += "statuspagto ";
                sql += "FROM pedidocliente ";
                sql += "WHERE codpedido = ?";
        PedidoCliente pedcliente = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, codPedido);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                pedcliente = new PedidoCliente();
                pedcliente.setCodProduto(codProduto);
                pedcliente.setProduto(rs.getString("produto"));
                pedcliente.setObservacao(rs.getString("observacao"));
                pedcliente.setStatusPedido(rs.getString("statuspedido"));
                pedcliente.setStatusPagto(rs.getString("statuspagto"));

            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return pedcliente;
    }
    
    public List<PedidoCliente> lovPedidos() {
        List<PedidoCliente> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codpedido, produto ";
                sql += "FROM pedidocliente ";
                sql += "ORDER BY codpedido";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                PedidoCliente pedcliente = new PedidoCliente();
                pedcliente.setCodProduto(rs.getInt("codpedido"));
                pedcliente.setProduto(rs.getString("produto"));
                lista.add(pedcliente);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean cancelarPedido() {
        Connection con = Conexao.conectar();
        String  sql  = "DELETE FROM pedidocliente ";
                sql += " WHERE codpedido = ?" ;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.codPedido);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
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
    
    public String getStatusPedido() {
        return statusPedido;
    }

    public void setStatusPedido(String statusPedido) {
        this.statusPedido = statusPedido;
    }
    
        public int getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(int codProduto) {
        this.codProduto = codProduto;
    }

    public String getStatusPagto() {
        return statusPagto;
    }

    public void setStatusPagto(String statusPagto) {
        this.statusPagto = statusPagto;
    }

}
