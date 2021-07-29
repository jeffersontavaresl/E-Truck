package modelos;

public class Estoque {

    private int id;
    private String nomeProduto;
    private String tipoProduto;
    private float valorProduto;
    
    public boolean CadastrarItem() {
        String  sql  = "INSERT INTO estoque (nomeproduto, ";
                sql += "tipoproduto,valorProduto) ";
                sql += "VALUES(?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1, this.codProduto);
            stm.setString(2, this.nomeProduto);
            stm.setString(3, this.tipoProduto);
            stm.setFloat (4, this.preco);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
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
