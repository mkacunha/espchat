<%-- 
    Document   : sala
    Created on : 30/01/2016, 11:20:54
    Author     : munif
--%>

<jsp:useBean id="lu" class="br.mkacunha.espchat.entidades.ListaUsuarios" scope="application"/>
<jsp:useBean id="usu" class="br.mkacunha.espchat.entidades.Usuario" scope="session"/>
<jsp:useBean id="lm" class="br.mkacunha.espchat.entidades.ListaMensagens" scope="application"/>
<jsp:useBean id="msg" class="br.mkacunha.espchat.entidades.Mensagem" scope="request"/>
<jsp:setProperty name="msg" property="*"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (!msg.isTextoVazio()) {
        msg.setUsuario(usu);
        lm.add(msg);
        lu.add(msg);
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <meta name="viewport" content="width=device-width"/>
        <title>EspChat</title>

        <link href='http://fonts.googleapis.com/css?family=Raleway:500' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css"  href="css/sala.css">
        <script type="text/javascript" src="js/jquery-2.2.0.min.js"></script>

        <script type="text/javascript">
            $(function () {
                function processaJSOMMensagens(data, status) {
                    console.log(data + '   |   ' + status);
                    if (status === "success") {
                        $.each(data, function (key, val) {
                            var texto = val.texto;
                            var data = val.quandoFormatado;

                            var usu = val.usuario;
                            var apelido = usu.apelido;
                            var ip = usu.ip;

                            adiciomarMensagem(texto, data, apelido, ip, null);
                        });
                    }
                }

                function processaJSOMUsuarios(data, status) {
                    if (status === "success") {
                        removeTodosUsuarios();
                        $.each(data, function (key, val) {
                            adicionarUsuario(val.apelido, val.ip);
                        });
                    }
                }
                function adiciomarMensagem(texto, data, apelido, ip, foto) {

                    var usuario = apelido + " | " + data;

                    var $mensagem = $("<li />").addClass("media").append($("<div />").addClass("media-body")
                            .append($("<div />").addClass("media").append($("<div />").addClass("media-body").append($("<small />").addClass("text-muted")
                                    .text(usuario)).append("<br />").append(texto)
                                    .append("<br />"))));
                    //.append("<hr />")
                    $("#listamensagens").append($mensagem);


                    $("mensagens").scrollHeight;
                }

                function adicionarUsuario(apelido, ip) {
                    var $usuario = $("<li />").addClass("media").addClass("usuario").append($("<div />").addClass("media-body").append($("<div />").addClass("media")
                            .append($("<div />").addClass("media-body").append($("<h5 />").text(apelido + "@" + ip)))));

                    //.append("<hr />")

                    $("#listausuarios").append($usuario);
                }

                function removeTodosUsuarios() {
                    $("li").remove(".usuario");
                }

                function onAtualizarMensagens() {
                    $.getJSON('listamensagens.jsp', processaJSOMMensagens);
                }
                setInterval(onAtualizarMensagens, 1000);

                function onAtualizarUsuarios() {
                    $.getJSON('listausuarios.jsp', processaJSOMUsuarios);
                }
                setInterval(onAtualizarUsuarios, 1000);

                function post() {
                    var $inMenagem = $('#mensagem');
                    var mensagem = $inMenagem.val();
                    $inMenagem.val('');
                    $inMenagem.focus();
                    $.post('sala.jsp', {texto: mensagem}, function (data, status) {
                        if (status === 'success') {
                            var obj = data[1];
                            obj.texto;
                            onAtualizarMensagens();
                        }
                    });
                }

                $('#submit').click(post);

                $('#mensagem').keydown(function (event) {
                    if (event.which === 13) {
                        post();
                    }
                });

                $("#sair").click(function () {
                    $(window.document.location).attr('href', 'tchau.jsp');
                });

                onAtualizarMensagens();
                onAtualizarUsuarios();
            });
        </script>
    </head>
    <body>
        <div class="container">

            <div class="row " style="padding-top:40px;">
                <div class="page-header">
                    <a href="http://www.espweb.uem.br/"> <h1 class="logo">ESPWEB  <small>Especialização em Web e Mobile</small></h1> </a>
                </div>
                <br /><br />
                <div class="col-md-8">
                    <div id="teste" class="panel panel-primary">
                        <div class="panel-heading">
                            Conversas
                        </div>

                        <div id="mensagens" class="panel-body pre-scrollable" style="height: 450px">
                            <ul id="listamensagens" class="media-list">

                            </ul>
                        </div>

                        <div class="panel-footer">
                            <div class="input-group">
                                <input id="mensagem" type="text" name="texto" class="form-control" placeholder="Mensagem" />
                                <span class="input-group-btn">
                                    <button class="btn btn-info" id="submit" type="button" name="submit">Enviar</button>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Usuários
                        </div>
                        <div id="usuarios" class="panel-body pre-scrollable" style="height: 450px">
                            <ul id="listausuarios" class="media-list">

                            </ul>
                        </div>
                    </div>

                </div>
            </div>
            <button id="sair" type="button" class="btn btn-primary" style="width: 200px; height:40px">Sair</button>
        </div>        
    </body>
</html>
