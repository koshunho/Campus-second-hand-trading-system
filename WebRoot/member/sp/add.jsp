<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="tb" scope="page" class="com.bean.HzpBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
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
</HEAD>
<script type="text/javascript">
function sub()
{//String mc = "";	String type="请选择";String pic="";String jg="";String sl="";
	if(document.form1.mc.value.replace(/\s+$|^\s+/g,"").length<=0||document.form1.type.value=="请选择"
	||document.form1.pic.value.replace(/\s+$|^\s+/g,"").length<=0||document.form1.jg.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.sl.value.replace(/\s+$|^\s+/g,"").length<=0 )
	{
		alert("所有项目必须填写！");
		return false;
	}
	if(isNaN(form1.sl.value))
	{
		alert("数量只能为数字！");
		form1.sl.focus();
		return false;
	}
	if(document.form1.pic.value.replace(/\s+$|^\s+/g,"").length>0)
	{
		var fileext=form1.pic.value.substring(form1.pic.value.length-4,form1.pic.value.length); 
		fileext=fileext.toLowerCase(); 
		if(!(fileext=='.jpg')&&!(fileext=='.gif')) 
		{
			alert("对不起，文件格式不对,必须为jpg或gif格式文件!"); 
			form1.pic.focus(); 
			return false; 
		} 
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
	String username=(String)session.getAttribute("member");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		String method=request.getParameter("method"); String id=""; 
		String mc = "";	String type="请选择";String pic="";String jg="";String sl="";String js="";
		if(method.equals("upsp")){
			id=request.getParameter("id");
			List list=cb.get1Com("select * from sp where id='"+id+"'",8);
			mc=list.get(1).toString();
			type=list.get(2).toString();
			pic=list.get(3).toString();			
			jg=list.get(4).toString();
			sl=list.get(5).toString();
			js=list.get(6).toString(); 
		}		

%>
<BODY >
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top ><form name="form1" action="<%=basePath %>News.do" method="post"  enctype="multipart/form-data" >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
 
	
  <tr bgcolor='#FFFFFF'> <input type="hidden" name="method" value="<%=method %>"> <input type="hidden" name="id" value="<%=id %>">
    <td width='30%'><div align="right">商品名称：</div></td>
    <td ><input name="mc" type="text" size="40" maxlength="100" value="<%=mc %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">商品分类：</div></td>
    <td ><select name="type" >
    <option value="<%=type %>"><%=type %></option>
    <%
    	List pagelist3=tb.getType();
			if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
     %>
     <option value="<%=pagelist2.get(1).toString() %>"><%=pagelist2.get(1).toString() %></option>
     <%}}%>
    </select></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">缩&nbsp;略&nbsp;图：</div></td>
    <td ><input name="pic" type="file"   size="40" maxlength="150" > </td>
  </tr> 
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">商品价格：</div></td>
    <td ><input name="jg" type="text" size="15" maxlength="100" value="<%=jg %>" onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"> 元 </TD>
  </tr> 
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">商品数量：</div></td>
    <td ><input name="sl" type="text"  size="15" maxlength="100" value="<%=sl %>" >  </TD>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">商品介绍：</div></td>
    <td ><TEXTAREA  NAME="js" ROWS="8" COLS="50"><%=js %></TEXTAREA>	</TD>
  </tr>
   
  <tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='button' name='button' value='提交数据' onclick='sub()'>
      </td>
    </tr>
	
</table></form>
   </TD>
	</TR>
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
