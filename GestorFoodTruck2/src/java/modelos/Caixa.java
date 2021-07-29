package modelos;

public class Caixa {

    private int id;
    private int nrMesa;
    private String formPagamento;
    private float preco;
    private int codProduto;

    public Caixa ConsultarPedido(int nrMesa) {
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codproduto, nomeproduto, tipoproduto, preco ";
                sql += "FROM pedidocliente ";
                sql += "WHERE nrmesa = ?";
        Caixa caixa = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, nrmesa);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                caixa = new Caixa();
                caixa.setNrMesa(nrMesa);
                caixa.setCodProduto(rs.getInt("codproduto"));
                caixa.setNomeProduto(rs.getString("nomeproduto"));
                caixa.setTipoProduto(rs.getString("tipoproduto"));
                caixa.setPreco(rs.getFloat("preco"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return cardapio;
    }
    
    public List<Caixa> lovItem() {
        List<Caixa> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "SELECT codproduto, nomeproduto, tipoproduto, preco ";
                sql += "FROM pedidocliente ";
                sql += "ORDER BY nrmesa";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Caixa caixa = new Caixa();
                caixa.setNrMesa(nrMesa);
                caixa.setCodProduto(rs.getInt("codproduto"));
                caixa.setNomeProduto(rs.getString("nomeproduto"));
                caixa.setTipoProduto(rs.getString("tipoproduto"));
                caixa.setPreco(rs.getFloat("preco"));
                lista.add(caixa);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean FecharPedido() {
        Connection con = Conexao.conectar();
        String  sql  = "UPDATE pedidocliente";
                sql += " SET status   = ?,";
                sql += " WHERE nrmesa  = ? ";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.status);
            stm.setInt   (2, this.nrMesa);
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

    public int getNrMesa() {
        return nrMesa;
    }

    public void setNrMesa(int nrMesa) {
        this.nrMesa = nrMesa;
    }

    public String getFormPagamento() {
        return formPagamento;
    }

    public void setFormPagamento(String formPagamento) {
        this.formPagamento = formPagamento;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }
    
    public int getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(int codProduto) {
        this.codProduto = codProduto;
    }

}
