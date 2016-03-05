<jsp:useBean id="lu" class="br.mkacunha.espchat.entidades.ListaUsuarios" scope="application"/>
<jsp:useBean id="lm" class="br.mkacunha.espchat.entidades.ListaMensagens" scope="application"/>
<jsp:useBean id="usu" class="br.mkacunha.espchat.entidades.Usuario" scope="session"/>
<jsp:useBean id="msg" class="br.mkacunha.espchat.entidades.Mensagem" scope="request"/>
<jsp:setProperty name="msg" property="*"/>

<%
    msg.setUsuario(usu);
    lm.getMensagens().add(msg);
    response.sendRedirect("sala.jsp");
%>

