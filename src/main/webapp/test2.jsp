<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#result {
            white-space: pre-wrap;  /* 줄바꿈을 그대로 유지 */
            word-wrap: break-word;  /* 긴 단어가 화면을 벗어나지 않도록 줄바꿈 */
            font-family: 'Courier New', Courier, monospace;  /* 고정폭 폰트 사용 */
            font-size: 16px;  /* 적당한 크기 설정 */
            color: black;  /* 텍스트 색상 설정 */
        }
</style>
</head>
<body>
    <h1>이미지에서 텍스트 추출</h1>
    <form id="uploadForm" action="http://127.0.0.1:5000/extract_text" method="post" enctype="multipart/form-data">
        <input type="file" name="image" accept="image/*" required><br><br>
        <button type="submit">업로드</button>
    </form>

    <h2>추출된 텍스트</h2>
    <div id="result"></div>  <!-- 텍스트가 여기에 출력됩니다 -->

		<script >
		 const form = document.getElementById("uploadForm");

	        form.onsubmit = async (event) => {
	            event.preventDefault();  // 기본 폼 제출 동작을 막음

	            const formData = new FormData(form);  // 폼 데이터를 FormData 객체로 처리
	            try {
	                // Flask 서버로 POST 요청을 보내기
	                const response = await fetch('http://127.0.0.1:5000/extract_text', {
	                    method: 'POST',
	                    body: formData
	                });

	                // 응답 상태 로그 출력
	                console.log('응답 상태:', response.status);  // 상태 코드 확인

	                // 응답이 성공적으로 왔는지 확인
	                if (!response.ok) {
	                    console.error("서버에서 오류가 발생했습니다.");
	                    const resultDiv = document.getElementById('result');
	                    resultDiv.innerHTML = `<p style="color:red;">서버 오류: ${response.statusText}</p>`;
	                    return;
	                }

	                // 응답 본문을 JSON으로 파싱
	                const result = await response.json();
	                console.log('서버 응답:', result);  // 응답 내용 확인

	                // 결과 화면에 출력
	                const resultDiv = document.getElementById('result');
					if (result.error) {
					    resultDiv.textContent = result.error;  // error 메시지 출력
					} else {
					    resultDiv.textContent = result.text;  // 추출된 텍스트 출력
					}
	            } catch (error) {
	                console.error("fetch 요청 중 오류 발생:", error);
	            }
	        };
		</script>
</body>
</html>