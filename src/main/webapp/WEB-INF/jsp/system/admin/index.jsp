﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="top.jsp"%>
	<script type="text/javascript">
		function iFrameHeight() {   
var ifm= document.getElementById("mainFrame");   
var subWeb = document.frames ? document.frames["mainFrame"].document : ifm.contentDocument;   
if(ifm != null && subWeb != null) {
   ifm.height = subWeb.body.scrollHeight;
}   
}   
	</script>
</head>
<body>
	<!-- 页面顶部¨ -->
	<%@ include file="head.jsp"%>
	<div class="container-fluid" id="content-container">
	<div class="content-wrapper">
	<div class="row">
	<div class="side-nav-content">
		<%@ include file="left.jsp"%>
		<!-- <iframe name="mainFrame" id="mainFrame" frameborder="0" src="login/tab.do" style="margin:0 auto;width:100%;height:100%;"></iframe> -->
		<iframe name="mainFrame" id="mainFrame" scrolling="no" frameborder="0" src="<%=basePath%>login/login_default.do" style="margin:0 auto;width:100%;" onLoad="iFrameHeight()"></iframe>
	</div>
	</div>
	</div>
	</div>
	<%@ include file="footer.jsp"%>
		<%-- <div id="main-content" class="clearfix">
			<div id="jzts" style="display:none; width:100%; position:fixed; z-index:99999999;">
				<div class="commitopacity" id="bkbgjz"></div>
				<div class="my-center">
					<div class="my-center" style="padding-top: 80%;display: inline;">
						<h4 style="display: inline;" class="lighter block red">
							<img src="static/images/loading.gif" style="display: inline;" />
							&nbsp;加载中 ...
						</h4>
					</div>
				</div>
			</div>
			<div>
				<iframe name="mainFrame" id="mainFrame" frameborder="0" src="login/tab.do" style="margin:0 auto;width:100%;height:100%;"></iframe>
			</div>
			<!-- 换肤 -->
			<div id="ace-settings-container">
				<div class="btn btn-app btn-mini btn-warning" id="ace-settings-btn">
					<i class="icon-cog"></i>
				</div>
				<div id="ace-settings-box">
					<div>
						<div class="pull-left">
							<select id="skin-colorpicker" class="hidden">
								<option data-class="default" value="#438EB9"
									<c:if test="${user.userSkin =='default' }">selected</c:if>>#438EB9</option>
								<option data-class="skin-1" value="#222A2D"
									<c:if test="${user.userSkin =='skin-1' }">selected</c:if>>#222A2D</option>
								<option data-class="skin-2" value="#C6487E"
									<c:if test="${user.userSkin =='skin-2' }">selected</c:if>>#C6487E</option>
								<option data-class="skin-3" value="#D0D0D0"
									<c:if test="${user.userSkin =='skin-3' }">selected</c:if>>#D0D0D0</option>
							</select>
						</div>
						<span>&nbsp; 选择皮肤</span>
					</div>
					<div>
						<label><input type='checkbox' name='menusf' id="menusf"
							onclick="menusf();" /><span class="lbl" style="padding-top: 5px;">菜单缩放</span></label>
					</div>
				</div>
			</div>
		</div> --%>
	<!-- <script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.11.3.min.js'>\x3C/script>");</script>
	<script src="static/js/ace.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script type="text/javascript" src="static/js/myjs/index.js"></script>
	<script type="text/javascript" src="static/js/myjs/menusf.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script> -->
</body>
</html>
