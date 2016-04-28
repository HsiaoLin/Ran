<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title></title>
<%@ include file="system/admin/top.jsp"%> 
<link rel="stylesheet" href="static/js/lib//zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<style type="text/css">
	footer {
		height: 50px;
		position: fixed;
		bottom: 0px;
		left: 0px;
		width: 100%;
		text-align: center;
	}
</style>
</head>
<body>
	<div id="zhongxin">
		<ul id="tree" class="tree" style="overflow:auto;"></ul>
	</div>
	<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	<script type="text/javascript" src="static/js/lib/zTree/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="static/js/lib/zTree/js/jquery.ztree.core.min.js"></script>
	<script type="text/javascript">
		$(top.shutdown());
		var zTree;
		$(document).ready(function(){
			var setting = {
				showLine: true,
				checkable: true
			};
			var zn = '${zTreeNodes}';
			var zTreeNodes = eval(zn);
			zTree = $("#tree").zTree(setting, zTreeNodes);
		});
	</script>
	<script type="text/javascript">
		function save(){
			var nodes = zTree.getCheckedNodes();
			var tmpNode;
			var ids = "";
			for(var i=0; i<nodes.length; i++){
				tmpNode = nodes[i];
				if(i!=nodes.length-1){
					ids += tmpNode.id+",";
				}else{
					ids += tmpNode.id;
				}
			}
			var roleId = "${roleId}";
			var url = "<%=basePath%>role/auth/save.do";
			var postData;
			
			postData = {"ROLE_ID":roleId,"menuIds":ids};
			
			$("#zhongxin").hide();
			$("#zhongxin2").show();
			$.post(url,postData,function(data){
				//if(data && data=="success"){
					top.Dialog.close();
				//}
			});
		}
	</script>
	<footer>
		<div style="width: 100%;" class="center">
			<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
			<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
		</div>
	</footer>
</body>
</html>