package modelos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.Conexao;
public class Fornecedor {

    private String razaoSocial;
    private String telefone;
    private String email;
    private String nomeContato;
    private int codFornecedor;

    
    public boolean adicionarFornecedor() {
        String  sql  = "INSERT INTO fornecedor (razaosocial, telefone, email, nomecontato) ";
                sql += "VALUES(?,?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.razaoSocial);
            stm.setString(2, this.telefone);
            stm.setString(3, this.email);
            stm.setString(4, this.nomeContato);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterarFornecedor() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE fornecedor ";
                sql += " SET email   = ?,";
                sql += "     telefone = ?, ";
                sql += " nomecontato = ? ";
                sql += " WHERE codfornecedor  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.email);
            stm.setString(2, this.telefone);
            stm.setString(3, this.nomeContato);
            stm.setInt(4, this.getCodFornecedor());
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean excluirFornecedor() {
        Connection con = Conexao.conectar();
        String  sql  = "DELETE FROM fornecedor ";
                sql += " WHERE codfornecedor = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.codFornecedor);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public Fornecedor consultarFonecedor(int pCodFornecedor) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codfornecedor, razaosocial, telefone, ";
                sql += " email, nomecontato ";
                sql += "FROM fornecedor ";
                sql += "WHERE codfornecedor  = ? ";
        Fornecedor fornecedor = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCodFornecedor);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                fornecedor = new Fornecedor();
                fornecedor.setCodFornecedor(rs.getInt("codfornecedor"));
                fornecedor.setRazaoSocial(rs.getString("razaosocial"));
                fornecedor.setTelefone(rs.getString("telefone"));
                fornecedor.setEmail(rs.getString("email"));
                fornecedor.setNomeContato(rs.getString("nomecontato"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return fornecedor;
    }
       
    /* ÁREA DE GETTERS E SETTERS */ 

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNomeContato() {
        return nomeContato;
    }

    public void setNomeContato(String nomeContato) {
        this.nomeContato = nomeContato;
    }

    public int getCodFornecedor() {
        return codFornecedor;
    }

    public void setCodFornecedor(int codFornecedor) {
        this.codFornecedor = codFornecedor;
    }
    
}
