document.addEventListener("DOMContentLoaded", () => {
	// MY 챌린지 버튼 클릭 시 팝업 토글
	document.querySelector('.nav-links a').addEventListener('click', function(event) {
		event.preventDefault(); // 기본 동작 방지

		const popup = document.getElementById('myChallengePopup');
		const container = document.querySelector('.container');
		const myChallengeButton = event.currentTarget;

		// 팝업 위치를 MY 챌린지 버튼 바로 아래로 설정
		const rect = myChallengeButton.getBoundingClientRect();
		popup.style.top = `${rect.bottom + window.scrollY}px`; // 화면 상단 기준으로 버튼 아래
		popup.style.left = `${rect.left}px`; // 화면 왼쪽 기준으로 버튼 위치에 맞추기

		// 팝업 상태 확인 후 열기/닫기
		if (popup.classList.contains('hidden')) {
			popup.classList.remove('hidden');
			container.classList.add('blur-background');
		} else {
			popup.classList.add('hidden');
			container.classList.remove('blur-background');
		}
	});

	// 팝업 외부 클릭 시 닫기
	document.addEventListener('click', function(event) {
		const popup = document.getElementById('myChallengePopup');
		const myChallengeButton = document.querySelector('.nav-links a');

		// 팝업과 "MY 챌린지" 버튼을 클릭한 경우가 아니면 팝업을 닫기
		if (!popup.contains(event.target) && event.target !== myChallengeButton) {
			popup.classList.add('hidden');
			document.querySelector('.container').classList.remove('blur-background');
		}
	});

	// 팝업 내부 버튼 클릭 이벤트
	document.querySelectorAll('.popup-button').forEach(button => {
		button.addEventListener('click', function() {
			alert(`${this.textContent} 버튼을 클릭했습니다.`);
			// 여기에 원하는 추가 작업을 넣을 수 있습니다.
		});
	});
});