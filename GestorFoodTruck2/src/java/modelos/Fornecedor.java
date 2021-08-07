package modelos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import utils.Conexao;
public class Fornecedor {

    private int id;
    private String nome;
    private String telefone;
    private String email;
    private int codProduto;
    
    public boolean adicionarFornecedor() {
        String  sql  = "INSERT INTO fornecedor (nome, telefone, email) ";
                sql += "VALUES(?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.telefone);
            stm.setString(3, this.email);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterarFornecedor() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE fornecedor";
                sql += " SET email   = ?,";
                sql += "     telefone = ?";
                sql += " WHERE nome  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.email);
            stm.setString(2, this.telefone);
            stm.setString(3, this.nome);
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
                sql += " WHERE nome = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
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

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
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

    public int getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(int codProduto) {
        this.codProduto = codProduto;
    }
}
