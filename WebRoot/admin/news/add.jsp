<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%@ page language="java" import="com.fredck.FCKeditor.*" %> 
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="FCK" %> 
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="<%=path %>FCKeditor/fckeditor.js"></script> 
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
<link rel="stylesheet" href="<%=basePath %>editor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=basePath %>editor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=basePath %>editor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '<%=basePath %>editor/plugins/code/prettify.css',
				uploadJson : '<%=basePath %>editor/jsp/upload_json.jsp',
				fileManagerJson : '<%=basePath %>editor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
</HEAD>
<script type="text/javascript">
function sub()
{
	if(document.form1.title.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入标题！");
		document.form1.title.focus();
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
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		String method=request.getParameter("method"); 
		String title="";String content="";
		String id=""; 
		if(method.equals("upnews")){
			id=request.getParameter("id").trim();
			List newsList=cb.get1Com("select * from news where id='"+id+"'",4);
			title=newsList.get(1).toString();
			content=newsList.get(2).toString(); htmlData=content;
		} 
%>
<BODY onload="document.form1.infoContent.value=document.form1.content.value" >
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top ><form name="form1" action="<%=basePath %>ComServlet" method="post" onsubmit="return sub()" >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
 
	
  <tr bgcolor='#FFFFFF'> <input type="hidden" name="method" value="<%=method %>"> <input type="hidden" name="id" value="<%=id %>">
    <td width='30%'><div align="right">标题：</div></td>
    <td ><input name="title" type="text" id="title" size="40" maxlength="100" value="<%=title %>"></td>
  </tr> 
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">标题：</div></td>
    <td align=left><textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
     </td>
    </tr>
  <tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='submit' name='button' value='提交数据' >
      </td>
    </tr>
	
</table></form>
   </TD>
	</TR>
  </TBODY>
</TABLE>
</BODY>
<%} %>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>
