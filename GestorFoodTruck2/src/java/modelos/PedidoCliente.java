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
    private int codProduto;

    public boolean RealizarPedido() {
        String  sql  = "INSERT INTO pedidocliente (codproduto, nrmesa,";
                sql += "produto,observacao, status) ";
                sql += "VALUES(?,?,?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1, this.codProduto);
            stm.setInt   (2, this.nrMesa);
            stm.setString(3, this.produto);
            stm.setString(4, this.observacao);
            stm.setString(5, this.status);
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
                sql += " SET codproduto    = ?,";
                sql += "     produto       = ?,";
                sql += "     observacao    = ?,";
                sql += "     status        = ? ";
                sql += " WHERE nrmesa  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1, this.codproduto);
            stm.setString(2, this.produto);
            stm.setString(3, this.observacao);
            stm.setString(4, this.status);
            stm.setInt   (5, this.nrMesa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public PedidoCliente ConsultarPedido(int codProduto) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codproduto, produto, observacao, ";
                sql += "status ";
                sql += "FROM pedidocliente ";
                sql += "WHERE codproduto = ?";
        PedidoCliente pedcliente = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, codProduto);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                pedcliente = new PedidoCliente();
                pedcliente.setCodProduto(codProduto);
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
        String  sql  = "SELECT codproduto, produto ";
                sql += "FROM pedidocliente ";
                sql += "ORDER BY codproduto";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                PedidoCliente pedcliente = new PedidoCliente();
                pedcliente.setCodProduto(rs.getInt("codproduto"));
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
                sql += " WHERE codproduto = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.codProduto);
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
    
        public int getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(int codProduto) {
        this.codProduto = codProduto;
    }

}
