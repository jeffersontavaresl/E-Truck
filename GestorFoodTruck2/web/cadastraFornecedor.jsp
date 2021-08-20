<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de fornecedores</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="styles/realizar.css" rel="stylesheet"/>
    </head>

    <body>
        <div class="container-fluid">
            <div class="container-fluid border w-50 h-75 mt-3 mb-4" id="head">
                <div class="container-fluid d-flex justify-content-center mt-4">
                    <h2>Cadastro de fornecedores</h2><br>  
                </div>
                <div class="container-fluid mt-2 mr-4">
                    <form action="recebeForn.jsp" method="POST">
                        <p class="font-weight-bold">
                            <%                        if (request.getParameter("pmensagem") != null)
                                    out.write(request.getParameter("pmensagem"));
                            %>
                        </p>

                        <label class="form-label">CNPJ</label>
                        <input type="text" maxlength="40" class="form-control" name="cdCnpj" placeholder="CNPJ"> <br>

                        <label class="form-label">Razão social</label>
                        <input type="text" maxlength="40" class="form-control" name="cdSoc" placeholder="Razão Social"> <br>

                        <label class="form-label">Telefone</label>
                        <input type="text" maxlength="20" class="form-control" name="cdTel" placeholder="Telefone"> <br>

                        <label class="form-label">E-mail</label>
                        <input type="email" maxlength="45" class="form-control" name="cdEml" placeholder="E-mail"> <br>

                        <label class="form-label">Nome</label>
                        <input type="text" maxlength="20" class="form-control" name="cdNom" placeholder="Nome"> <br>

                        <div class="text-center mb-3">
                            <a href="functions.jsp" class="btn btn-primary">Início</a>
                            <input type="submit" value="Confirmar" class="btn btn-success"/>
                            <input type="reset" value="Cancelar" class="btn btn-danger"/>
                        </div>
                    </form>  
                </div>
            </div>
        </div>


        <script>
            function enviarDados() {

                var cnpj = document.getElementsByName("cdCnpj");
                if (cnpj[0].value === "") {
                    cnpj[0].focus();
                    alert("Informe o CNPJ");
                    exit();
                }

                var rzSoc = document.getElementsByName("cdSoc");
                if (rzSoc[0].value === "") {
                    rzSoc[0].focus();
                    alert("Informe a razão social");
                    exit();
                }

                var eml = document.getElementsByName("cdTel");
                if (eml[0].value === "") {
                    eml[0].focus();
                    alert("Informe o telefone");
                    exit();
                }

                var tel = document.getElementsByName("cdEml");
                if (tel[0].value === "") {
                    tel[0].focus();
                    alert("Informe o e-mail");
                    exit();
                }

                var nomF = document.getElementsByName("cdNom");
                if (nomF[0].value === "") {
                    nomF[0].focus();
                    alert("Informe o Nome");
                    exit();
                }

                document.forms[0].submit();
            }

        </script> 
    </body>
</html>
