<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../../js/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	1111
	<a href="createUser?userId=hshshshs&type=教务">s</a>
	
</body>
<script type="text/javascript">
	 $.post("selectRoleList",{"userId":"jjjj"},function(data){
		 var role=data.roleList;
		 alert(role.length);			//查询出的用户总数
		 alert(data.totalPage);		//查询出的总页数
		 alert(role[5].type);
		 /* for(var i=0; i<role.length; i++){
			 alert(role[i].type); 	 //第i位用户的id号
		 } */
	}) 
	 $.post("createUserssss", {
			 "user.userId":Math.random()*9999+""
			 ,"user.type":"学生","user.sex":"女"
			 ,"user.phone":"15078843569"
			 ,"user.psw":"000000"
	}, function(r){
		 alert(r['result']);
	});
</script>
</html>