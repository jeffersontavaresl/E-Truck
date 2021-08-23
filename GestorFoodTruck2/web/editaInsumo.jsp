<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Insumo"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edita Insumo</title>
    </head>
    <p id="login">
        <%
            String login = (String) session.getAttribute("login");
            if (login == null) {
                response.sendRedirect("login.jsp");
            }
        %>
    </p>
    <body>
        <%
            String idCodInsumo = request.getParameter("codInsumo");
            Insumo i = new Insumo();
            if (idCodInsumo != null) {
                i = i.consultarInsumo(Integer.parseInt(idCodInsumo));
            }
        %>
        <form action="recebeEditaInsumo.jsp" method="POST">

            <label>Código do Insumo</label>
            <input type="text" name="codInsumo" readonly
                   value="<%out.write("" + i.getCodInsumo());%>" />
            <br/>

            <label>Nome do Insumo</label>
            <input type="text" name="nome" readonly
                   value="<%out.write(i.getDescInsumo());%>" />
            <br />
            <label>Saldo em Estoque</label>
            <input type="text" maxlength="6" name="sldEstoque"  />
            <br />
            <label>Qtde de Estoque Alerta</label>
            <input type="text" maxlength="6" name="qtdEstqAlerta" 
                   value="<%out.write("" + i.getQtdEstqAlerta());%>" />
            <br />

            <label>Valor</label>
            <input type="text" maxlength="6" name="vlr" 
                   value="<%out.write("" + i.getCustoInsumo());%>" />

            <hr />
            <input type="submit" value="Alterar" />
        </form>
    </body>
</html>
