<jsp:useBean id="lm" class="br.mkacunha.espchat.entidades.ListaMensagens" scope="application"/>
<jsp:useBean id="lu" class="br.mkacunha.espchat.entidades.ListaUsuarios" scope="application"/>
<jsp:useBean id="usu" class="br.mkacunha.espchat.entidades.Usuario" scope="session"/>

<%
    out.print(lu.getMensagensAsJSON(usu));
%>