<%@ LANGUAGE= VBscript %>
<HTML>
<HEAD>
<TITLE> Um simples pagina HTML estática </TITLE>
</HEAD>
<BODY>
Boa tarde , agora sao <%=time%> do dia <%=day(now)%><p>
Esta e uma pagina usando ASP<P>
<%for contador = 1 to 5%>
   <font size = <%=contador%>> FONTE TAMANHO      <%=contador%></FONT><br>
<%next%>
--------------------------------------------
<BR><BR><BR>

<%

	dim objCon 
	dim strConexao
	
	'strConexao = "Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security Info=False;User ID="";Initial Catalog=teste;Data Source=VLADIMR-NOTE;Initial File Name="";Server SPN="";"
	'strConexao = "Provider=SQLNCLI11;Server=localhost;Database=teste;Integrated Security=SSPI;"
	strConexao = "Provider=SQLOLEDB;Data Source=VLADIMIR-NOTE;Initial Catalog=teste;trusted_connection=yes"
	
	Set objCon = Server.CreateObject("ADODB.Connection")
	objCon.Open strConexao

	response.write("acesso garantido")



%>


</BODY>
</HTML>