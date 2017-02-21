<%@page import="com.ovs.db.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ovs.model.*"%>
<%@ page import="com.ovs.beans.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>网上投票系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<link href="../admin.css" rel="stylesheet" type="text/css" /> 
  <script src="/OVS/js/clock.js"></script>
</head>
<jsp:useBean id="admcurrentUser" class="com.ovs.model.Admin" scope="session"/>
<%
	/* if(admcurrentUser.getAdminID()==null){
  		admcurrentUser.setAdmin(session.getAttribute("userID").toString());
  	} */
  	admcurrentUser.setAdmin(session.getAttribute("userID").toString());
  	if(admcurrentUser.getAdminID()== null){
		out.println("<script type=\"text/javascript\">");
		out.println("var flag = confirm(\"亲爱的用户，您没有登录管理员角色，是否立即登录？\");");
		out.println("if(flag==true){");
		out.println("window.open('/OVS/login/login.jsp','_self','');");
		out.println("}else{");
		out.println("window.open('/OVS/login/checkOut.jsp','_self','');");
		out.println("}");
		out.println("</script>"); 
	}
	 %>
	<header>
	<div id="sitebranding">
		<h1>
			<font face="楷体" size="10">网上投票系统</font>
		</h1>
	</div>
	<div id="tagline">
		<p>
			<span
				class="right" style="font-size: 15px; font-style: normal;"> <c>你好！
				</c> <d><jsp:getProperty property="name" name="admcurrentUser"/> </d> <d id="txt"></d> <a
				href="/OVS/login/checkOut.jsp"> <b>退出</b>
			</a>
			</span>
		</p>
	</div>
	</header>
	<nav>
	<ul>
		<li><a href="admin_notice_list.jsp">通知公告</a></li>
		<li><a href="admin_vote_list.jsp">投票管理</a></li>
		<li><a href="admin_id_list.jsp">角色管理</a></li>
		<li><a href="admin_info_show.jsp">个人信息</a></li>
	</ul>
	</nav>
	<div id="bodycontent">
		<h5>
			<a><span style="color: black; font-weight: normal; font-size: 15px;">您当前的位置：</span></a>
			<a href="admin_index.jsp"><span style="color:black;font-weight:normal;font-size:15px;">首页</span></a>->
			<a href="#"><span style="color: black; font-weight: normal; font-size: 15px;">个人信息</span></a>
			
			<br><br>
</h5>

		<fieldset>
			<legend>管理员个人信息</legend>

			<table width="715" height="192" border="0">
				<tr>
					<th width="300" scope="col"><center>&nbsp;</center></th>
					<th width="300" scope="col"><center>&nbsp;</center></th>
					<th width="300" scope="col"><center>&nbsp;</center></th>
				</tr>
				<%
								out.println("<tr>");
								out.println("<td><div align=\"center\"><font color=\"red\">账号</font></div></td>");
								out.println("<td><div align=\"center\"><font color=\"black\">"+admcurrentUser.getAdminID()+"</font></div></td>");
								out.println("<td><font color=\"red\">&nbsp;</font></td>"); 
							 	out.println("</tr>");
							 	
							 	out.println("<tr>");
								out.println("<td><div align=\"center\"><font color=\"red\">用户名</font></div></td>");
								out.println("<td><div align=\"center\"><font color=\"black\">"+admcurrentUser.getName()
								+"</font></div></td>");
								out.println("<td><font color=\"blue\"><a href=\"admin_info_editUserName.jsp\">修改用户名</a></font></td>"); 
							 	out.println("</tr>");
							 	
							 	out.println("<tr>");
								out.println("<td>&nbsp;</td>");
								out.println("<td><div align=\"center\"><a href=\"admin_info_editPWD.jsp\">修改密码</a></div></td>");
								out.println("<td>&nbsp;</td>");
							 	out.println("</tr>");			
				%>
			</table>
		</fieldset>

	</div>
</body>
</html>