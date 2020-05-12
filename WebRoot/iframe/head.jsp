<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<jsp:useBean id="sys" scope="page" class="com.bean.SystemBean" /> 
<jsp:useBean id="abc" scope="page" class="com.bean.AfficheBean"/>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean"/>
<jsp:useBean id="tb" scope="page" class="com.bean.HzpBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List sysList=sys.getSiteInfo(); 
List affList=abc.getAllAffiche(); 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE><%=sysList.get(0).toString() %></TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META name="keywords" content="<%=sysList.get(2).toString() %>" />
<META name="description" content="<%=sysList.get(3).toString() %>" />

<META content="MSHTML 6.00.2900.3243" name=GENERATOR>
<LINK href="<%=basePath %>images/css.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %>images/default.css" type=text/css rel=stylesheet>
</HEAD>
<SCRIPT language=JavaScript src="<%=basePath %>images/Common.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %>images/index.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %>images/calendar.js"></SCRIPT>
 
 
<BODY text=#000000   leftMargin=0 topMargin=0>
 
<TABLE id=toplogin cellSpacing=0 cellPadding=0 width="950" align=center border=0>
  <TBODY>
  <TR>
    <TD vAlign=center align=left>
      <DIV class=jstime style="FLOAT: left; WIDTH: 45%">
       
      </DIV>
      <DIV class=jstime style="FLOAT: right; WIDTH: 45%; TEXT-ALIGN: right">
	  <!--****************时间日历开始****************-->
      <SCRIPT>setInterval("clock.innerHTML=new Date().toLocaleString()+'&nbsp;&nbsp;星期'+'日一二三四五六'.charAt(new Date().getDay());",1000)</SCRIPT>
      <SPAN id=clock></SPAN>
	  <!--****************时间日历结束****************-->&nbsp;&nbsp; 
      <A href="javascript:javascript:window.external.AddFavorite('<%=basePath %>','<%=sysList.get(0).toString() %>');"> </A> 
      <A onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('<%=basePath %>');" href="http://localhost/#"> </A> 
	  <A href="mailto:<%=sysList.get(4).toString() %>"> </A> 
	  </DIV>
	</TD>
   </TR>
   </TBODY>
</TABLE>
<TABLE  cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
<TBODY>
  <TR>
    <TD align=center><DIV class=ad id=banner><img src="images/a11.gif" width="950" height="100" border=0></DIV></TD>
  </TR>
 </TBODY>
</TABLE>
<TABLE id=guide cellSpacing=0 cellPadding=0 width="950" align=center border=0>
<TBODY>
  <TR>
    <TD align=middle>
	<!--****************主菜单开始****************-->
	
	<A href="index.jsp" target="">首    页</A> |
	<A href="news.jsp" target="">新闻资讯</A> |
	<A href="sp.jsp" target="">商品信息</A> | 
	<A href="fenlei.jsp" target="">商品分类</A> |
	<A href="search.jsp" target="">商品查询</A> | 
	
	
	<A href="guestbook.jsp" target="">交换信息</A> |
	<A href="member/index.jsp" target="">会员中心</A> | 
	<A href="admin/login.jsp" target="">管理登陆</A> 
	<!--****************主菜单结束****************-->
	</TD>
  </TR>
</TBODY>
</TABLE>



