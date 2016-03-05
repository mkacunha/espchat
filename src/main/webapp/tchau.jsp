<jsp:useBean id="lu" class="br.mkacunha.espchat.entidades.ListaUsuarios" scope="application"/>
<jsp:useBean id="lm" class="br.mkacunha.espchat.entidades.ListaMensagens" scope="application"/>
<jsp:useBean id="usu" class="br.mkacunha.espchat.entidades.Usuario" scope="session"/>


<%
  lu.getUsuarios().remove(usu);
  session.invalidate();
  response.sendRedirect("index.html");
%>