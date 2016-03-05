<%-- 
    Document   : bemvido
    Created on : 30/01/2016, 11:16:25
    Author     : munif
--%>



<jsp:useBean id="lu" class="br.mkacunha.espchat.entidades.ListaUsuarios" scope="application"/>
<jsp:useBean id="lm" class="br.mkacunha.espchat.entidades.ListaMensagens" scope="application"/>
<jsp:useBean id="usu" class="br.mkacunha.espchat.entidades.Usuario" scope="session"/>
<jsp:setProperty name="usu" property="apelido"/>

<%
    lu.add(usu);
    usu.setIp(request.getRemoteHost());
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <meta name="viewport" content="width=device-width"/>
        <title>Bem Vindo!</title>

        <link href='http://fonts.googleapis.com/css?family=Raleway:500' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="css/espchat.css">
        <link rel="stylesheet" type="text/css" href="css/bemvindo.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
    </head>
    <body>
        <div class="middlePage">
            <div class="page-header">
                <a href="http://www.espweb.uem.br/"> <h1 class="logo">ESPWEB  <small>Especialização em Web e Mobile</small></h1> </a>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Entrar</h3>
                </div>
                <div class="panel-body">

                    <div class="row">
                        <div class="col-md-12" style="border-left:1px solid #ccc;height:160px">
                            <form class="form-horizontal" action="sala.jsp">
                                <fieldset>
                                    <label  id="lbsejabemvindo">Seja bem vindo ${usu}</label>
                                    <button id="btnentrar"  class="btn btn-primary btn-lg center-block btn-block">Entrar na sala</button>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
