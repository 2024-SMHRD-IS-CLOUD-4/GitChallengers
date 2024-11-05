<%@ page contentType="text/html;charset=UTF-8" language="ko" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캐시 충전</title>
    <link rel="stylesheet" href="./css/pay.css">
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const buttons = document.querySelectorAll(".amount-button");
            buttons.forEach(button => {
                button.addEventListener("click", function() {
                    buttons.forEach(btn => btn.classList.remove("selected"));
                    this.classList.add("selected");
                });
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <button class="back-button" onclick="history.back()">&#8592;</button>
        <h1>캐시 충전</h1>
        <div class="button-container">
            <button class="amount-button">₩ 1000</button>
            <button class="amount-button">₩ 5000</button>
            <button class="amount-button">₩ 10000</button>
        </div>
        <form action="pay.jsp" method="post">
            <input type="hidden" name="amount" id="selectedAmount" value="">
            <button type="submit" class="pay-button">결제하기</button>
        </form>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const buttons = document.querySelectorAll(".amount-button");
            const amountInput = document.getElementById("selectedAmount");
            buttons.forEach(button => {
                button.addEventListener("click", function() {
                    buttons.forEach(btn => btn.classList.remove("selected"));
                    this.classList.add("selected");
                    amountInput.value = this.textContent.trim();
                });
            });
        });
    </script>
</body>
</html>
