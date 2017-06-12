function idCheck(){
	alert("자스 불러왔음!");
	if(document.frm.u_id.value.length == 0){
		alert("아이디를 입력해주세요.");
		return false;
	}
	if(document.frm.u_pw.value.length == 0){
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	if(document.frm.u_pw.value.length > 12){
		alert("비밀번호가 너무 깁니다.(비밀번호는 8자리 이상, 12자리 이하입니다.)");
		return false;
	}
	if(document.frm.u_pw.value.length < 8){
		alert("비밀번호가 너무 짧습니다.(비밀번호는 8자리 이상, 12자리 이하입니다.)");
		return false;
	}
	if(document.frm.u_pw.value != document.frm.passcheck.value){
		alert("비밀번호가 동일하지 않습니다.");
		return false;
	}
	
	return true;
}