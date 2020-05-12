<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/Common.js"></SCRIPT>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<script type="text/javascript">
function f1()
{
 	if(document.form1.sj.value=="")
 	{
 		alert("请填写时间！");
 		document.form1.sj.focus();
 		return false;
 	}
 	if(document.form1.dd.value=="")
 	{
 		alert("请填写地点！");
 		document.form1.dd.focus();
 		return false;
 	}
 	
 form1.submit();
}
</script>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>
<%
	String member=(String)session.getAttribute("member");
	if(member==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		String prepid=request.getParameter("prepid"); 
		String sj=cb.getString("select sj from prep where id='"+prepid+"'");
		String dd=cb.getString("select dd from prep where id='"+prepid+"'");
%>
<BODY><br><br><br><br><br>
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
<form action="<%=basePath %>ComServlet?method=tjdd&prepid=<%=prepid%>" method="post" name="form1" >
         <TABLE   cellSpacing=0 cellPadding=0 width="100%" border=0>
         <TBODY>
        <TR>
          <TD width=40% align=right>交货时间：</TD><TD align=left><input type=text name=sj size=30  value=<%=sj %>></TD>
		</TR>
		<TR>
          <TD  align=right>交货地点：</TD><TD align=left><input type=text name=dd size=30  value=<%=dd %>></TD>
		</TR>
		
		<TR>
          <TD  align=center colspan=2><input type=button onclick="f1()" value="提交"></TD>
		</TR>
				</TBODY>
			</TABLE>
			</form>		
	</td>
	</tr>
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
