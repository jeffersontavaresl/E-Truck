<%@page import="modelos.Mesa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar mesa</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="styles/editar.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="container-fluid">
            <div class="container-fluid border w-50 h-75 mt-5 mb-4" id="tabela">
                <div class="container-fluid d-flex justify-content-center mt-4">
                    <h1>Editar Mesa</h1>
                    <hr />

                    <%
                        String idMesa = request.getParameter("codmesa");
                        int mesa = 0;
                        Mesa m = new Mesa();
                        if (idMesa != null) {
                            m = m.consultaMesa(Integer.parseInt(idMesa));
                        }
                    %>
                </div>
                <div class="container-fluid mt-3 mr-4">
                    <form action="recebeEditaMesa.jsp" method="POST">

                        <label>Código da mesa</label>
                        <input type="text" class="form-control" name="codMesa" readonly="true"
                               value="<%out.write("" + m.getCodmesa());%>" />
                        <br />
                        <label>Nome da mesa</label>
                        <input type="text" class="form-control" name="nomMesa" 
                               value="<%out.write("" + m.getMesa());%>" />

                        <hr />
                        <div class="text-center mb-3">
                            <input type="submit" class="btn btn-primary" value="Alterar" class="btn btn-primary"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>


</body>
</html>
