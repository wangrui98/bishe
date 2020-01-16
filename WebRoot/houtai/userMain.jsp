<%@ page language="java" contentType="text/html; charset=utf-8" import="com.model.*,java.util.List"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    
<%
	// 权限验证
	User user = (User)session.getAttribute("user");
	if(user==null){
		System.out.println("没有得到userId");
		response.sendRedirect("shouye/index.jsp");
		return;
	}
	Jcpeizhi newJcpeizhi = (Jcpeizhi)session.getAttribute("jcpeizhi");
	List<Jcbiaoti> jcbiaotis = (List<Jcbiaoti>)session.getAttribute("jcbiaotis");
	List<List<Jcdaohang>> jcdaohangslist = (List<List<Jcdaohang>>)session.getAttribute("jcdaohangslist");
	String userName = user.getUserName();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title><%=newJcpeizhi.getJcpeizhiName()%></title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="<%=basePath%>houtai/muban1/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath%>houtai/muban1/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="<%=basePath%>houtai/muban1/matrix-style.css" />
    <link rel="stylesheet" href="<%=basePath%>houtai/muban1/matrix-media.css" />
</head>
<body>
    <!--Header-part-->
    <div id="header">
      <h1><a href="#"><%=newJcpeizhi.getJcpeizhiName()%></a></h1>
    </div>
    <!--close-Header-part--> 

    <!--top-Header-menu-->
    <div id="user-nav" class="navbar navbar-inverse">
        <ul class="nav">
        	<li  class="dropdown" id="profile-messages" >
                <a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle">
                    <i class="icon icon-user"></i>&nbsp;
                    <span class="text">欢迎你，<%=userName %></span>&nbsp;
                    <span id=sTime><script>setInterval("document.all.sTime.innerText=new Date().toLocaleString()",1000)</script></span>
                    <b class="caret"></b>
                </a>
            </li>
			<li class=""><a target = "_blank" title="" href="<%=basePath%>"><i class="icon icon-share-alt"></i> 	<span class="text">&nbsp;返回网站</span></a></li>
			<li class=""><a title="" href="<%=basePath%>shouye/tuichu.jsp"><i class="icon icon-share-alt"></i> 	<span class="text">&nbsp;退出系统</span></a></li>
        </ul>
    </div>
    <!--close-top-Header-menu-->

    <!--sidebar-menu-->
    <div id="sidebar" style="OVERFLOW-Y: auto; OVERFLOW-X:hidden;">
        <ul>
            <li class="submenu active">
                <a class="menu_a" link="<%=basePath%>shouye/neiye.jsp"><i class="icon icon-home"></i> <span>欢迎登陆</span></a> 
            </li>
            <li class="submenu"> 
                <a href="#">
                    <i class="icon icon-table"></i> 
                    <span>个人信息</span> 
                    <span class="label label-important"></span>
                </a>
                <ul>
                	<li><a class="menu_a" link="<%=basePath%>user/user.jsp"><i class="icon icon-caret-right"></i>个人信息</a></li>
                	<li><a class="menu_a" link="<%=basePath%>user/usermima.jsp"><i class="icon icon-caret-right"></i>修改密码</a></li>
                </ul>
            </li>
			<%for(int i = 0; i < jcbiaotis.size(); i++){ %>
            <li class="submenu"> 
                <a href="#">
                    <i class="icon icon-table"></i> 
                    <span><%=jcbiaotis.get(i).getJcbiaotiName() %></span> 
                    <span class="label label-important"></span>
                </a>
                <ul>
				<%for(int j = 0; j < jcdaohangslist.get(i).size(); j++){ %>
                	<li><a class="menu_a" link="<%=basePath%>user/<%=jcdaohangslist.get(i).get(j).getJcdaohangNeirong() %>"><i class="icon icon-caret-right"></i><%=jcdaohangslist.get(i).get(j).getJcdaohangName() %></a></li>
                <%} %>
				</ul>
            </li>
			<%} %>
        </ul>
    </div>
    <!--sidebar-menu-->

    <!--main-container-part-->
    <div id="content">
        <iframe src="<%=basePath%>shouye/neiye.jsp" id="iframe-main" frameborder='0' style="width:100%;"></iframe>
    </div>
    <!--end-main-container-part-->

    <script src="<%=basePath%>houtai/muban1/excanvas.min.js"></script> 
    <script src="<%=basePath%>houtai/muban1/jquery.min.js"></script> 
    <script src="<%=basePath%>houtai/muban1/jquery.ui.custom.js"></script> 
    <script src="<%=basePath%>houtai/muban1/bootstrap.min.js"></script> 
    <script src="<%=basePath%>houtai/muban1/nicescroll/jquery.nicescroll.min.js"></script> 
    <script src="<%=basePath%>houtai/muban1/matrix.js"></script> 


    <script type="text/javascript">

    //初始化相关元素高度
    function init(){
        $("body").height($(window).height()-80);
        $("#iframe-main").height($(window).height()-90);
        $("#sidebar").height($(window).height()-50);
    }

    $(function(){
        init();
        $(window).resize(function(){
            init();
        });
    });

    // This function is called from the pop-up menus to transfer to
    // a different page. Ignore if the value returned is a null string:
    function goPage (newURL) {
        // if url is empty, skip the menu dividers and reset the menu selection to default
        if (newURL != "") {
            // if url is "-", it is this page -- reset the menu:
            if (newURL == "-" ) {
                resetMenu();            
            } 
            // else, send page to designated URL            
            else {  
                document.location.href = newURL;
            }
        }
    }

    // resets the menu selection upon entry to this page:
    function resetMenu() {
        document.gomenu.selector.selectedIndex = 2;
    }

    // uniform使用示例：
    // $.uniform.update($(this).attr("checked", true));
    </script>
</body>
</html>