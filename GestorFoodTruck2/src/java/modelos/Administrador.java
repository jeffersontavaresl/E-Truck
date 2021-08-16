package modelos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;
public class Administrador {
    
    private int codFornecedor;
    private int codPedFornecedor;
    private int codInsumo;
    private float qtdInsumo;
    private float custoInsumo;
    private String cnpj;
    private String descInsumo;
    
    public boolean realizarPedidoItem() { 
        String  sql  = "INSERT INTO pedidofornecedoritem (codfornecedor, ";
                sql += " codpedfornecedor, codinsumo, qtdinsumo, custoinsumo) ";
                sql += "VALUES(?,?,?,?,?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1, this.codFornecedor);
            stm.setInt   (2, this.codPedFornecedor);
            stm.setInt(3, this.codInsumo);
            stm.setFloat(4, this.qtdInsumo);
            stm.setFloat(5, this.custoInsumo);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public Administrador consultarPedidoItem(int pCodFornecedor) { 
        Connection con = Conexao.conectar();
        String  sql  = "SELECT a.codfornecedor, c.codpedfornecedor, b.codinsumo, ";
                sql += "d.qtdinusmo, a.cnpj, b.descinsumo, b.custoinsumo ";
                sql += "FROM fornecedor a, insumo b, pedidofornecedor c, pedidofornecedoritem d ";
                sql += "WHERE a.codpedfornecedor = ? ";
                sql += "AND a.codfornecedor = c.codfornecedor ";
                sql += "AND c.codfornecedor = d.codfornecedor ";
                sql += "AND b.codinsumo = d.codinsumo ";
                sql += "AND c.codpedfornecedor = d.codfornecdor ";

        Administrador adm = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCodFornecedor);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                adm = new Administrador();
                adm.setCodFornecedor(rs.getInt("codfornecedor"));
                adm.setCodPedFornecedor(rs.getInt("codpedfornecedor"));
                adm.setCodInsumo(rs.getInt("codinsumo"));
                adm.setQtdInsumo(rs.getFloat("qtdinusmo"));
                adm.setCnpj(rs.getString("cnpj"));
                adm.setDescInsumo(rs.getString("descinsumo"));
                adm.setCustoInsumo(rs.getFloat("custoinsumo"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return adm;
    }
    
    public List<Administrador> consultaPedidoItem(int pCodPedFornecedor) {
        List<Administrador> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT a.codfornecedor, c.codpedfornecedor, b.codinsumo, ";
                sql += "d.qtdinusmo, a.cnpj, b.descinsumo, b.custoinsumo ";
                sql += "FROM fornecedor a, insumo b, pedidofornecedor c, pedidofornecedoritem d ";
                sql += "WHERE a.codpedfornecedor = ? ";
                sql += "AND a.codfornecedor = c.codfornecedor ";
                sql += "AND c.codfornecedor = d.codfornecedor ";
                sql += "AND b.codinsumo = d.codinsumo ";
                sql += "AND c.codpedfornecedor = d.codfornecdor ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCodPedFornecedor);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Administrador adm = new Administrador();
                adm.setCodFornecedor(rs.getInt("codfornecedor"));
                adm.setCodPedFornecedor(rs.getInt("codpedfornecedor"));
                adm.setCodInsumo(rs.getInt("codinsumo"));
                adm.setQtdInsumo(rs.getFloat("qtdinusmo"));
                adm.setCnpj(rs.getString("cnpj"));
                adm.setDescInsumo(rs.getString("descinsumo"));
                adm.setCustoInsumo(rs.getFloat("custoinsumo"));
                lista.add(adm);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }
    
    public boolean alterarPedidoItem() { 
        return false;
    }
    
    public boolean excluirPedidoItem(int pCodPedFornecedor) { 
        Connection con = Conexao.conectar();
        String  sql  = "DELETE FROM pedidofornecedor ";
                sql += " WHERE codpedfornecedor = ? ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCodPedFornecedor);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    

    public int getCodFornecedor() {
        return codFornecedor;
    }

    public void setCodFornecedor(int codFornecedor) {
        this.codFornecedor = codFornecedor;
    }

    public int getCodPedFornecedor() {
        return codPedFornecedor;
    }

    public void setCodPedFornecedor(int codPedFornecedor) {
        this.codPedFornecedor = codPedFornecedor;
    }

    public int getCodInsumo() {
        return codInsumo;
    }

    public void setCodInsumo(int codInsumo) {
        this.codInsumo = codInsumo;
    }

    public float getQtdInsumo() {
        return qtdInsumo;
    }

    public void setQtdInsumo(float qtdInsumo) {
        this.qtdInsumo = qtdInsumo;
    }

    public float getCustoInsumo() {
        return custoInsumo;
    }

    public void setCustoInsumo(float custoInsumo) {
        this.custoInsumo = custoInsumo;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getDescInsumo() {
        return descInsumo;
    }

    public void setDescInsumo(String descInsumo) {
        this.descInsumo = descInsumo;
    }
}
