package modelos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;
public class Fornecedor {

    private int id;
    private String nome;
    private String telefone;
    private String email;
    private int idProduto;
    
    public boolean AdicionarFornecedor() {
        String  sql  = "INSERT INTO fornecedor (nome, telefone, email) ";
                sql += "VALUES(?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.telefone);
            stm.setString (3, this.email);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean AlterarFornecedor() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE fornecedor";
                sql += " SET nome   = ?,";
                sql += "     email   = ?,";
                sql += "     telefone = ?";
                sql += " WHERE nome  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.email);
            stm.setString(3, this.telefone);
            stm.setString(4, this.nome);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean ExcluirFornecedor() {
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

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }
}
