<%@page import="modelos.Cardapio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <title>Edita Item</title>
    </head>
     <header>
            <script src="scripts/cabecalho.js"></script> 
        </header>
        <section>
            <nav>
                <script src="scripts/menu.js"></script> 
            </nav>
            <article>
                <body>
                    <h1>Editar Item</h1>
                    <hr />
                    
                    <%
                      String idcodPedido = request.getParameter("codProduto");
                      Cardapio c = new Cardapio();
                       if (idcodPedido != null){
                          c = c.consultarItem(Integer.parseInt(idcodPedido));
                      }   
                    %>
                    <form action="recebeEditaItens.jsp" method="POST">
                        
                        <label>Nome do produto</label>
                        <input type="text" name="nome" 
                               value="<%out.write(c.getDescProduto());%>" />
                        <br />
                        <label>Preço</label>
                        <input type="text" name="vlr" 
                               value="<%out.write("" + c.getPreco());%>" />
                        <br />
                        <label>Codigo Produto</label>
                        <input type="text" name="codProduto" 
                               value="<%out.write("" + c.getCodProduto());%>" />
                        <br />
                        
                        <hr />
                        <input type="submit" value="Alterar" />
                    </form>
                </body>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>                    
</html>
