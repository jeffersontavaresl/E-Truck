package modelos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;
public class Insumo {

    private int codInsumo;
    private String descInsumo;
    private float custoInsumo;
    private float sldEstqInsumo;
    private float qtdEstqAlerta;
    private String undMedida;

    
    public boolean cadastrarItem() {
        String  sql  = "INSERT INTO insumo (descinsumo, ";
                sql += "custoinsumo, sldestqinsumo, undMedida, qtdestqalerta) ";
                sql += "VALUES(?,?,?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.descInsumo);
            stm.setFloat (2, this.custoInsumo);
            stm.setFloat (3, this.sldEstqInsumo);
            stm.setString   (4, this.undMedida);
            stm.setFloat (5, this.qtdEstqAlerta);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean atualizarSldEstoque() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE insumo ";
                sql += " SET sldestqinsumo  = ?, ";
                sql += " custoinsumo = ?, ";
                sql += " qtdestqalerta = ? ";
                sql += " WHERE codinsumo  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setFloat(1, this.sldEstqInsumo);
            stm.setFloat(2, this.custoInsumo);
            stm.setFloat(3, this.qtdEstqAlerta);
            stm.setInt  (4, this.codInsumo);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public Insumo consultarInsumo(int pCodInsumo) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codinsumo, descinsumo, ";
		sql += "custoinsumo, sldestqinsumo, undMedida, qtdestqalerta ";
                sql += "FROM insumo ";
                sql += "WHERE codinsumo = ?";
        Insumo estoque = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCodInsumo);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                estoque = new Insumo();
                estoque.setCodInsumo(rs.getInt("codinsumo"));
                estoque.setDescInsumo(rs.getString("descinsumo"));
                estoque.setCustoInsumo(rs.getFloat("custoinsumo"));
                estoque.setSldEstqInsumo(rs.getFloat("sldestqinsumo"));
                estoque.setUndMedida(rs.getString("undMedida"));
                estoque.setQtdEstqAlerta(rs.getFloat("qtdestqalerta"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return estoque;
    }
    
    public List<Insumo> lovItem() {
        List<Insumo> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codinsumo, descinsumo, ";
		sql += "custoinsumo, sldestqinsumo, undMedida, qtdestqalerta ";
                sql += "FROM insumo ";
                sql += "ORDER BY codinsumo";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Insumo estoque = new Insumo();
                estoque.setCodInsumo(rs.getInt("codinsumo"));
                estoque.setDescInsumo(rs.getString("descinsumo"));
                estoque.setCustoInsumo(rs.getFloat("custoinsumo"));
                estoque.setSldEstqInsumo(rs.getFloat("sldestqinsumo"));
                estoque.setUndMedida(rs.getString("undMedida"));
                estoque.setQtdEstqAlerta(rs.getFloat("qtdestqalerta"));
                lista.add(estoque);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

   public boolean excluirItem() {
        Connection con = Conexao.conectar();
        String  sql  = "DELETE FROM insumo ";
                sql += " WHERE codinsumo = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.codInsumo);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    /* ÁREA DE GETTERS E SETTERS */ 

    public int getCodInsumo() {
        return codInsumo;
    }

    public void setCodInsumo(int codInsumo) {
        this.codInsumo = codInsumo;
    }

    public String getDescInsumo() {
        return descInsumo;
    }

    public void setDescInsumo(String descInsumo) {
        this.descInsumo = descInsumo;
    }

    public float getCustoInsumo() {
        return custoInsumo;
    }

    public void setCustoInsumo(float custoInsumo) {
        this.custoInsumo = custoInsumo;
    }

    public float getSldEstqInsumo() {
        return sldEstqInsumo;
    }

    public void setSldEstqInsumo(float sldEstqInsumo) {
        this.sldEstqInsumo = sldEstqInsumo;
    }

    public float getQtdEstqAlerta() {
        return qtdEstqAlerta;
    }

    public void setQtdEstqAlerta(float qtdEstqAlerta) {
        this.qtdEstqAlerta = qtdEstqAlerta;
    }

    public String getUndMedida() {
        return undMedida;
    }

    public void setUndMedida(String undMedida) {
        this.undMedida = undMedida;
    }
  
}
