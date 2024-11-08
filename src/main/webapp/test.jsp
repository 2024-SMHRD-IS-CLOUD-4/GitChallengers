<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="js/jquery-3.7.1.min.js"></script>

		<input type="text" name="isbn" id="isbn">
		<button class="go">제출</button>


<script type="text/javascript">
$(document).on('click', '.go', function() {
	var input = $('#isbn').val();
	
	$.ajax({
		url : "SearchAPIServlet",
		type : "post",
		data : {isbn: input},
		success : function(data){
			console.log(data);
			if (data && data.items && data.items.length > 0) { // 데이터가 있으면
				var book = data.items[0];
				if(book.isbn == input){
					alert("인증성공")
				}
			}
		},
		error : function(){
			alert("통신실패")
		}
		
	})  		
})

</script>


</body>
</html>