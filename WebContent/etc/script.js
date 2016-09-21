/**
 * 
 */
function checkForm(writeform){
	
	if(!writeform.book_kind.value){
		alert("책의 kind를 선택하십시오.");
		writeform.book_kind.focus();
		return false;
	}
	if(!writeform.book_title.value){
		alert("책의 title를 선택하십시오.");
		writeform.book_title.focus();
		return false;
	}
	if(!writeform.book_price.value){
		alert("책의 price를 선택하십시오.");
		writeform.book_price.focus();
		return false;
	}
	if(!writeform.book_count.value){
		alert("책의 count를 선택하십시오.");
		writeform.book_count.focus();
		return false;
	}
	if(!writeform.author.value){
		alert("책의 author를 선택하십시오.");
		writeform.author.focus();
		return false;
	}
	if(!writeform.publishing_com.value){
		alert("책의 분류를 선택하십시오.");
		writeform.publishing_com.focus();
		return false;
	}
	if(!writeform.book_content.value){
		alert("책의 content를 선택하십시오.");
		writeform.book_content.focus();
		return false;
	}
	
	writeform.action="bookRegisterPro.jsp";
	writeform.submit();
}
