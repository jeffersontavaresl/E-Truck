<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de mesas</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="styles/realizar.css" rel="stylesheet"/>
    </head>
    <body>

    <body>
        <label class="cabecalho" id="msg"> 
            <%
                if (request.getParameter("pmensagem") != null)
                    out.write(request.getParameter("pmensagem"));
            %>
        </label>   
        <div class="container-fluid">
            <div class="container-fluid border w-50 h-75 mt-3 mb-4" id="head">
                <div class="container-fluid d-flex justify-content-center mt-4">
                    <h2>Cadastro de Mesas</h2><br>
                </div>
                <div class="container-fluid mt-2 mr-4">
                    <form action="recebeDadosMesa.jsp" method="POST">
                        <label class="form-label"><b>Nome da mesa</b></label> <br>
                        <input type="text" maxlength="10" class="form-control" name="nomMesa" placeholder="Nome da mesa"> <br><br>
                        <div class="text-center mb-3">
                            <input type="button" class="btn btn-success"value="Salvar" onclick="enviarDados()" />
                            <input type="reset" class="btn btn-danger" value="Cancelar" />
                        </div>
                    </form> 
                </div>
            </div>
        </div> 


        <script>
            function enviarDados() {

                var cnpj = document.getElementsByName("nomMesa");
                if (cnpj[0].value === "") {
                    cnpj[0].focus();
                    alert("Informe o Nome da mesa");
                    exit();
                }


                document.forms[0].submit();
            }

        </script> 
    </body>
</html>
