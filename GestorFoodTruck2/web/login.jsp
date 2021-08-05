<%@page import="modelos.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles/login.css" />
    </head>
    <body>
        <div>
            <div class="container" >
                <div class="content">      
                  <!--FORMULÁRIO DE LOGIN-->
                  <div id="login">
                    <form method="POST" action=""> 
                      <h1 class="text-center"><b>Entrada</h1> 
                        <div class="usuario">
                            <p> 
                              <label for="usuario">Usuário</label>
                              <input id="login" name="usuario" required="required" type="text" placeholder="Informe o Usuário" maxlength="25"/>
                            </p>
                      </div>
        
                      <div class="senha">
                        <p> 
                          <label for="senha">Senha</label>
                          <input id="senha" name="senha" required="required" type="password" placeholder="Informe a senha" maxlength="20"/> 
                        </p>
                      </div>
                      
                      <p> 
                        <input type="submit" value="Logar"/> 
                      </p>

                      <p class="link">Não tem conta?<a href="cadastraconfig.jsp">Cadastre-se</a></p>
                    </form>
                  </div>
                </div>                  
            </div>
        </div>            
        <%
        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");
        Login log = new Login();
        //crie a seção 
        if(log.podeLogar(usuario,senha)){            
            session.setAttribute("usuario", usuario);
            session.setAttribute("senha", senha);
            response.sendRedirect("index.html");
        }
        
        %>
    </body>
</html>