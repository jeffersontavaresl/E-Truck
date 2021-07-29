package modelos;

public class Estoque {

    private int id;
    private String nomeProduto;
    private String tipoProduto;
    private float valorProduto;
    private int quantidade;
    
    public boolean CadastrarItem() {
        String  sql  = "INSERT INTO estoque (nomeproduto, ";
                sql += "tipoproduto,valorProduto, quantidade) ";
                sql += "VALUES(?,?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1, this.codProduto);
            stm.setString(2, this.nomeProduto);
            stm.setString(3, this.tipoProduto);
            stm.setFloat (4, this.preco);
            stm.setInt   (5, this.quantidade);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean AtualizarItem() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE estoque";
                sql += " SET quantidade   = ?, ";
                sql += " WHERE nomeproduto  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1, this.quantidade);
            stm.setString(2, this.nomeProduto);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public Estoque ConsultarItem(String nomeProduto) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT nomeproduto, tipoproduto, valorProduto, quantidade ";
                sql += "FROM estoque ";
                sql += "WHERE nomeproduto = ?";
        Cardapio cardapio = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, nomeProduto);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                estoque = new Estoque();
                estoque.setNomeProduto(nomeProduto);
                estoque.setValorProduto(rs.getFloat("valorProduto"));
                estoque.setTipoProduto(rs.getString("tipoproduto"));
                estoque.setQuantidade(rs.getInt("quantidade"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return estoque;
    }
    
    public List<Estoque> lovItem() {
        List<Estoque> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT nomeproduto, tipoproduto, valorProduto, quantidade ";
                sql += "FROM cardapio ";
                sql += "ORDER BY codproduto";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Estoque estoque = new Estoque();
                estoque.setNomeProduto(rs.getString("nomeproduto"));
                estoque.setValorProduto(rs.getFloat("valorProduto"));
                estoque.setTipoProduto(rs.getString("tipoproduto"));
                estoque.setQuantidade(rs.getInt("quantidade"));
                lista.add(estoque);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

   public boolean ExcluirItem() {
        Connection con = Conexao.conectar();
        String  sql  = "DELETE FROM estoque ";
                sql += " WHERE nomeproduto = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nomeProduto);
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
    
    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
}
