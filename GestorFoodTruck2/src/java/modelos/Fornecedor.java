package modelos;

public class Fornecedor {

    private int id;
    private String nome;
    private String telefone;
    private String email;
    private int idProduto;
    
    public void AdicionarFornecedor() {
        // TODO implement here
    }

    public void AlterarFornecedor() {
        // TODO implement here
    }

    public void ExcluirFornecedor() {
        // TODO implement here
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