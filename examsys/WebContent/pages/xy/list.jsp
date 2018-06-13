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