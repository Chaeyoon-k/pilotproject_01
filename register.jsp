<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script type="text/javascript"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// 04.10 이메일 중복 처리
function fn_submit() {
	var formData = $("#frm").serialize();//form 요소 자체
	$.ajax({
		type:"post"
		,data:formData
		,url:"registerOk"
		,success: function(data) {
			alert("가입이 완료되었습니다")
			location.href="login";
		}
		,error: function(){
			alert("중복된 이메일입니다. 다시 입력해주세요")
			location.href="register";
		}
	});
}



    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                 
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
//                     표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
//                     조합된 참고항목을 해당 필드에 넣는다. //address1 사용안해서 주석처리 04.10
//                     document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>
	<table border="1" align="center">
		<form name="reg_frm" id="frm" method="post" action="registerOk">
			<tr height="50">
				<td colspan="2">
					<h1>회원 가입 신청</h1>
				</td>
			<tr height="30">
				<td width="80">
					이름
				</td>
				<td>
					<input type="text" size="20" name="name">
				</td>
			</tr>
			<tr height="30">
				<td width="80">
					USERID(이메일)
				</td>
				<td>
					<input type="text" size="20" name="email">
				</td>
			</tr>

			<tr height="30">
				<td width="80">
					암호
				</td>
				<td>
					<input type="text" size="20" name="password">
				</td>
			</tr>
			<tr height="30">
				<td width="80">
					암호 확인
				</td>
				<td>
					<input type="text" size="20" name="password_check">
				</td>
			</tr>
			<tr height="30">
				<td width="80">
					연락처
				</td>
				<td>
					<input type="text" size="20" name="phone">
				</td>
			</tr>
		<tr height="30">
				<td colspan="2" width="80">
				<input type="text" name="zipcode" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" name="address" id="sample6_address" placeholder="주소"><br>
				<input type="text" name="address2" id="sample6_extraAddress" placeholder="상세주소">
<!-- 				address1 사용안해서 히든처리 (없으면 팝업창 안뜸) 04.10 -->
				<input type="hidden" name="address1" id="sample6_detailAddress" placeholder="참고">
				</td>
				
			</tr>
			<tr height="30">
				<td colspan="2">
					<input type="button" onclick="check_ok()" value="등록">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>