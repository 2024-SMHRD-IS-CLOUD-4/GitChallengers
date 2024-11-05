<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캐시 충전</title>
    <link rel="stylesheet" href="./css/pay.css">
   
</head>
<body>
    
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

    <div class="container">
        <button class="back-button" onclick="history.back()">&#8592;</button>
        <h1>캐시 충전</h1>
        <div class="button-container">
            <button class="amount-button" onclick="selectAmount(1000)">1,000원</button>
            <button class="amount-button" onclick="selectAmount(5000)">5,000원</button>
            <button class="amount-button" onclick="selectAmount(10000)">10,000원</button>
			</div>
            <!-- 결제하기 버튼 -->
            <button class="pay-button" onclick="initiatePayment()">결제하기</button>
</div>
            <script>
                let selectedAmount = 0;

                // 금액 선택 함수
                function selectAmount(amount) {
                    selectedAmount = amount;
                    const buttons = document.querySelectorAll(".amount-button");
                    buttons.forEach(btn => btn.classList.remove("selected"));  // 선택 스타일 제거
                    event.target.classList.add("selected");  // 클릭한 버튼에 선택 스타일 추가
                }

                // 결제 요청 함수
                function initiatePayment() {
                    // 금액이 선택되지 않은 경우 경고 표시
                    if (selectedAmount === 0) {
                        alert('결제 금액을 선택해주세요.');
                        return;
                    }

                    // 결제 요청
                    IMP.init("imp61620428");  // 상점 식별코드로 변경 필요
                    IMP.request_pay({
                        pg: 'html5_inicis',
                        pay_method: 'card',  // 결제 방식
                        merchant_uid: 'order_' + new Date().getTime(),  // 주문번호
                        name: '상품 이름',
                        amount: selectedAmount,  // 선택된 결제 금액
                        buyer_email: 'user@example.com',
                        buyer_name: '홍길동',
                        buyer_tel: '010-1234-5678',
                        buyer_addr: '서울특별시 강남구',
                        buyer_postcode: '123-456'
                    }, function (rsp) {
                        if (rsp.success) {
                            alert('결제가 완료되었습니다.');
                            location.href = "/success-page";  // 성공 시 이동할 페이지
                        } else {
                            alert('결제에 실패하였습니다. 에러: ' + rsp.error_msg);
                        }
                    });
                }
            </script>
            
            
     


   
</body>
</html>
