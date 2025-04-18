<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<!-- * 25.04.09 권준우 최초 작성 -->

<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/info.css ">
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
</head>
<body>
<div class ="container">
<div class ="form-box">
    <h2 class="text-center" font-weight: bold;">비밀번호 확인</h2>

    <form name="pwd_frm" method="post" action="checkPwdOk">
        <label class="form-label mt-4">비밀번호:</label>
        <input type="password" class="form-control" name="input_pwd" />
        <input type="button"  class="btn btn-primary w-100" style="margin-top:30px;" value="확인" onclick="check_pwd()"/>
    </form>
    
<!--     <form name="pwd_frm" method="post" action="checkPwdOk"> -->
<!--         <label>비밀번호:</label> -->
<!--         <input type="password" name="input_pwd" /> -->
<!--         <br><br> -->
<!--         <input type="button" value="확인" onclick="check_pwd()"/> -->
<!--     </form> -->
    
    <br>
    
    
    
<!--     아래는 sesssion 확인용 임시정보 -->
	<c:choose>
	    <c:when test="${not empty sessionScope.loginCustomer}">
	        <h3>세션에 저장된 로그인 정보</h3>
	        <ul>
	            <li>ID: ${sessionScope.loginCustomer.id}</li>
	            <li>이름: ${sessionScope.loginCustomer.name}</li>
	            <li>비밀번호: ${sessionScope.loginCustomer.password}</li>
	            <li>이메일: ${sessionScope.loginCustomer.email}</li>
	            <li>전화번호: ${sessionScope.loginCustomer.phone}</li>
	            <li>주소: ${sessionScope.loginCustomer.address}</li>
	            <li>주소상세: ${sessionScope.loginCustomer.address1}</li>
	            <li>우편번호: ${sessionScope.loginCustomer.zipcode}</li>
	        </ul>
	    </c:when>
	    <c:when test="${not empty sessionScope.loginSeller}">
	        <h3>세션에 저장된 로그인 정보</h3>
	        <ul>
	            <li>ID: ${sessionScope.loginSeller.id}</li>
	            <li>이름: ${sessionScope.loginSeller.name}</li>
	            <li>비밀번호: ${sessionScope.loginSeller.password}</li>
	            <li>이메일: ${sessionScope.loginSeller.email}</li>
	            <li>전화번호: ${sessionScope.loginSeller.phone}</li>
	        </ul>
	    </c:when>	    
	    <c:otherwise>
	        <p>로그인 세션이 없습니다.</p>
	    </c:otherwise>
	</c:choose>
	
	<c:choose>
	    <c:when test="${sessionScope.userType == 'customer'}">
	        <p>당신의 로그인 타입 : <b>customer</b></p>
	    </c:when>
	    <c:when test="${sessionScope.userType == 'seller'}">
	        <p>당신의 로그인 타입 : <b>seller</b></p>
	    </c:when>
	    <c:otherwise>
	        <p>로그인 상태가 아닙니다.</p>
	    </c:otherwise>
	</c:choose>
</body>
</html>