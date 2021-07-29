package modelos;

public class Estoque {

    private int id;
    private String nomeProduto;
    private String tipoProduto;
    private float valorProduto;
    
    public void CadastrarItem() {
        // TODO implement here
    }

    public void AtualizarItem() {
        // TODO implement here
    }
    
    public void ConsultarItem() {
        // TODO implement here
    }

    public void ExcluirItem() {
        // TODO implement here
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public String getTipoProduto() {
        return tipoProduto;
    }

    public void setTipoProduto(String tipoProduto) {
        this.tipoProduto = tipoProduto;
    }

    public float getValorProduto() {
        return valorProduto;
    }

    public void setValorProduto(float valorProduto) {
        this.valorProduto = valorProduto;
    }
}