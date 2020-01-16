<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../jiazai/jcpeizhibaohan.jsp"%>
<%
	Jcpeizhi newJcpeizhi = (Jcpeizhi)session.getAttribute("jcpeizhi");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><%=newJcpeizhi.getJcpeizhiName()%></title>
<link rel="stylesheet" href="<%=basePath%>shouye/login/css/style.css">
<script language="javascript">
function checklogin()
{
  if(document.login.userName.value=='')
     {alert('请输入帐户');
      document.login.userName.focus();
      return false
    }
  if (document.login.password.value=='')
   {alert('请输入密码');
    document.login.password.focus();
    return false
   }
}
</script>
</head>
<body>
<h1><%=newJcpeizhi.getJcpeizhiName()%></h1>

<div class="login" style="margin-top:50px;">
  <div class="web_qr_login" id="web_qr_login" style="display: block; height: 300px;">    
            <div class="web_login" id="web_login">
            <div class="login-box">
			<div class="login_form">
				<form action="<%=basePath%>login" name="login" method="post" class="loginForm" onSubmit="return checklogin();">
                <div class="uinArea" id="uinArea">
                <label class="input-tips" for="u">帐号：</label>
                <div class="inputOuter" id="uArea">
                    
                    <input type="text" name="userName" class="inputstyle"/>
                </div>
                </div>
                <div class="pwdArea" id="pwdArea">
               <label class="input-tips" for="p">密码：</label> 
               <div class="inputOuter" id="pArea">
                    
                    <input type="password" name="password" class="inputstyle"/>
                </div>
                </div>
                <div class="pwdArea" id="pwdArea">
               <label class="input-tips" for="p">类型：</label> 
               <div class="inputOuter" id="pArea">
                    <select name="loginType" class="inputstyle">
							<option value="admin">管理员</option>
							<option value="user"><%=newJcpeizhi.getUserBieming()%></option>
							<option value="yonghu"><%=newJcpeizhi.getYonghuBieming()%></option>
						</select>
                </div>
                </div>
                <div style="padding-left:50px;margin-top:20px;">
                <input type="submit" value="登 录" style="width:100px;" class="button_blue"/>&nbsp;<a href="<%=basePath%>user/zhuceuser.jsp"><input type="button" value="注 册" style="width:100px;" class="button_blue"/></a>
                </div>
              </form>
           </div>
           </div>
      </div>
  </div>
</div>
<div class="jianyi"><b><font color="red">${error }</font></b></div>
</body></html>