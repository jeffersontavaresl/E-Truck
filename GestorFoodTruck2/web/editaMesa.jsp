<%@page import="modelos.Mesa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar mesa</title>
    </head>
    <body>
         <h1>Editar Item</h1>
                    <hr />
                    
                    <%
                      String idMesa = request.getParameter("codmesa");
                      int mesa = 0;
                      Mesa m = new Mesa();
                       if (idMesa != null){
                          m = m.consultaMesa(Integer.parseInt(idMesa));
                      }   
                    %>
                    <form action="recebeEditaMesa.jsp" method="POST">
                        
                        <label>Código da mesa</label>
                        <input type="text" name="codMesa" readonly="true"
                               value="<%out.write("" + m.getCodmesa());%>" />
                        <br />
                        <label>Nome da mesa</label>
                        <input type="text" name="nomMesa" 
                               value="<%out.write("" + m.getMesa());%>" />
                        
                        <hr />
                        <input type="submit" value="Alterar" />
                    </form>
                </body>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>                
    </body>
</html>
