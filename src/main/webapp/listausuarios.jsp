<jsp:useBean id="lu" class="br.mkacunha.espchat.entidades.ListaUsuarios" scope="application"/>

<%
    out.print(lu.toJSON());
%>