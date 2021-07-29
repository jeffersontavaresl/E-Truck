package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

public class PedidoCliente {

    private int id;
    private int nrMesa;
    private String observacao;
    private String produto;
    private String status;

    public boolean RealizarPedido() {
        String  sql  = "INSERT INTO pedidocliente (nrmesa,";
                sql += "produto,observacao, status) ";
                sql += "VALUES(?,?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1, this.nrMesa);
            stm.setString(2, this.produto);
            stm.setString(3, this.observacao);
            stm.setString(4, this.status);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean AlterarPedido() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE pedidocliente";
                sql += " SET produto       = ?,";
                sql += "     observacao    = ?,";
                sql += "     status        = ? ";
                sql += " WHERE nrmesa = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.produto);
            stm.setString(2, this.observacao);
            stm.setString(3, this.status);
            stm.setInt(4, this.nrMesa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public PedidoCliente ConsultarPedido(int nrMesa) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT nrmesa, produto, observacao, ";
                sql += "status ";
                sql += "FROM pedidocliente ";
                sql += "WHERE nrmesa = ?";
        PedidoCliente pedcliente = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, nrMesa);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                pedcliente = new PedidoCliente();
                pedcliente.setNrMesa(nrMesa);
                pedcliente.setProduto(rs.getString("produto"));
                pedcliente.setObservacao(rs.getString("observacao"));
                pedcliente.setStatus(rs.getString("status"));

            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return pedcliente;
    }
    
        public List<PedidoCliente> lovPedidos() {
        List<PedidoCliente> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT nrmesa, produto ";
                sql += "FROM pedidocliente ";
                sql += "ORDER BY nrmesa";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                PedidoCliente pedcliente = new PedidoCliente();
                pedcliente.setNrMesa(rs.getInt("nrmesa"));
                pedcliente.setProduto(rs.getString("produto"));
                lista.add(pedcliente);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean CancelarPedido() {
        Connection con = Conexao.conectar();
        String  sql  = "DELETE FROM pedidocliente ";
                sql += " WHERE nrmesa = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.nrMesa);
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
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}