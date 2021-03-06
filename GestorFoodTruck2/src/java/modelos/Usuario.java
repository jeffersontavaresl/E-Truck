package modelos;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import utils.Conexao;

public class Usuario {

    private int codusuario;
    private String login;
    private String senha;

    public boolean cadastrarUsuario() {
        
        String  sql  = "INSERT INTO usuario (login, senha) ";
                sql += "VALUES(?, ?)";
        Connection con = Conexao.conectar();
        
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.login);
            stm.setString(2, this.senha);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    
    
    public boolean podeLogar(String login, String senha) {
        Connection con = Conexao.conectar();
        String sql = "select * from usuario where login = ? and senha = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, login);
            stm.setString(2, senha);
            ResultSet rs = stm.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;
    }

    public boolean usuarioExiste(String login) {
        Connection con = Conexao.conectar();
        String sql = "select * from usuario where login = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, login);
            ResultSet rs = stm.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;
    }

    /* ÁREA DE GETTERS E SETTERS */
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getCodusuario() {
        return codusuario;
    }

    public void setCodusuario(int codusuario) {
        this.codusuario = codusuario;
    }
}
