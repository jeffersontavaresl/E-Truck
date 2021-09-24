package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.Conexao;

public class Mesa {

    private int codmesa;
    private String mesa;

    public boolean cadastraMesa() {
        String sql = "INSERT INTO mesa (mesa) ";
        sql += "values (?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.mesa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alteraMesa() {
        Connection con = Conexao.conectar();
        String sql = "UPDATE mesa ";
        sql += "Set mesa = ? ";
        sql += "WHERE codmesa = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.mesa);
            stm.setInt(2, this.codmesa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean excluiMesa() {
        Connection con = Conexao.conectar();
        String sql = "delete from mesa ";
        sql += "where codmesa = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.codmesa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public Mesa consultaMesa(int pCodMesa) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codmesa, mesa ";
                sql += "FROM mesa ";
                sql += "WHERE codmesa = ?";
        Mesa mesa = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCodMesa);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                mesa = new Mesa();
                mesa.setCodmesa(rs.getInt("codmesa"));
                mesa.setMesa(rs.getString("mesa"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return mesa;
    }
    
    public List<Mesa> lovMesa() {
        List<Mesa> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "Select * from mesa order by mesa";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Mesa mesa = new Mesa();
                mesa.setCodmesa(rs.getInt("codmesa"));
                mesa.setMesa(rs.getString("mesa"));
                lista.add(mesa);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public int getCodmesa() {
        return codmesa;
    }

    public void setCodmesa(int codmesa) {
        this.codmesa = codmesa;
    }

    public String getMesa() {
        return mesa;
    }

    public void setMesa(String mesa) {
        this.mesa = mesa;
    }

}
