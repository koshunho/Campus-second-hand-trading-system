<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>ϵͳ����</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" rel=stylesheet>
<META content="MSHTML 6.00.2900.3243" name=GENERATOR>
</HEAD>
<SCRIPT language="JavaScript" type="text/JavaScript">
<!--
var array = new Array();//����˳��
 
function expand(id_value){
  var tmp;
  eval("tmp=document.getElementById('id_"+id_value+"').style.display");
  if(tmp==''){
    eval("document.getElementById('id_"+id_value+"').style.display='none'");
  }else{
   for(i=0;i<array.length;i++){
      eval("document.getElementById('id_"+array[i]+"').style.display='none'");
  }
    eval("document.getElementById('id_"+id_value+"').style.display=''");
  }  
 }
//-->
</SCRIPT>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
	List list=(List)session.getAttribute("list");
	String QX=list.get(4).toString();
	String temp[]=QX.split("/");
%>
<BODY  oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=<%=basePath %><%=dir %>/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE bgColor=#eef8fe  class=HeaderTdStyle height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD align=middle ><IMG height=17 src="<%=basePath %><%=dir %>/images/sys.gif" width=21>
          <a href="<%=basePath %><%=dir %>/iframe/main.jsp" target="MainFrame">������ҳ</a>
          </TD>
        </TR>
        </TBODY>
      </TABLE>
      <TABLE  bgColor=#eef8fe   height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top height="100%">
          <DIV style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 96%" align=center>
<TABLE  bgColor=#eef8fe cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
  <TBODY> 
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(1)>
    <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;����Ա����</TD></TR>
    </TABLE>
    <TABLE width="100%" border="0" align="center" id=id_1 style="display:none">
    <TR>
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> 
      <a href="<%=basePath %><%=dir %>/system/user.jsp" target="MainFrame">����Ա����</a></SPAN></TD></TR>
  	 <TR>
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> 
      <a href="<%=basePath %><%=dir %>/system/editpwd.jsp" target="MainFrame">�޸ĵ�¼����</a></SPAN></TD></TR>
  	
  </TABLE>
  </TD>
  </TR>
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(2)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;�����������</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_2 style="display:none">
 <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/affiche/index.jsp" target="MainFrame">�����������</a></SPAN></TD></TR>
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/affiche/edit.jsp?method=addAffiche" target="MainFrame">������������</a></SPAN></TD></TR>
  
  </TABLE>
  </TD>
  </TR>
  
   <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(9)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;������Ѷ����</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_9 style="display:none">
 <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/news/index.jsp" target="MainFrame">������Ѷ����</a></SPAN></TD></TR>
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/news/add.jsp?method=addnews" target="MainFrame">����������Ѷ</a></SPAN></TD></TR>
  
  </TABLE>
  </TD>
  </TR>
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(3)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;��Ʒ��Ϣ����</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_3 style="display:none">
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/sp/index.jsp" target="MainFrame">��Ʒ��Ϣ����</a></SPAN></TD></TR>
   </TABLE>
  </TD>
  </TR>
   <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(4)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;��Ʒ������</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_4 style="display:none">
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/hzp/type.jsp" target="MainFrame">��Ʒ������</a></SPAN></TD></TR>
  </TABLE>
  </TD>
  </TR>
   
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(5)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;ע���Ա����</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_5 style="display:none">
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/member/person.jsp" target="MainFrame">ע���Ա����</a></SPAN></TD></TR>
  </TABLE>
  </TD>
  </TR>
   
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(6)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;������Ϣ����</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_6 style="display:none">
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=basePath %><%=dir %>/guestbook/index.jsp" target="MainFrame">������Ϣ����</a></SPAN></TD></TR>
   </TABLE>
  </TD>
  </TR>
  <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
  <TD noWrap width="35%">
  <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(7)>
  <TR>
    <TD height="31" background="<%=basePath %><%=dir %>/images/linkbg1.gif">&nbsp;</td>
    <TD background="<%=basePath %><%=dir %>/images/linkbg1.gif" >&nbsp;&nbsp;&nbsp;&nbsp;�˳���½</TD></TR>
  </TABLE>
  <TABLE width="100%" border="0" align="center" id=id_7 style="display:none">
  <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
    <TD noWrap width="35%"><IMG src="<%=basePath %><%=dir %>/images/bullet.gif" 
      align=absMiddle><SPAN style="CURSOR: default"> <a href="<%=path%>/Admin.do?method=exit" target=_top>�˳���½</a></SPAN></TD></TR>
   </TABLE>
  </TD>
  </TR>
  
  </TBODY>
</TABLE>
</DIV>

    </TD>
    </TR>
    </TBODY>
    </TABLE>
    </TD></TR>
    </TBODY>
    </TABLE>
</BODY>
<%} %>
</HTML>