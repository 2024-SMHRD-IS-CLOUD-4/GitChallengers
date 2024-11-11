// 리뷰 내용 표시 함수
function showReview() {
    const reviewContent = document.getElementById("review-content");
    reviewContent.innerHTML = `

    `;
}

function showScrollMessage() {
    alert("리뷰를 클릭하셨습니다. 마우스 스크롤로 페이지를 넘길 수 있습니다.");
}

// MY 챌린지 버튼 클릭 시 팝업 토글
document.querySelector('.nav-links a').addEventListener('click', function (event) {
    event.preventDefault(); // 기본 동작 방지
    const popup = document.getElementById('myChallengePopup');
    const myChallengeButton = event.currentTarget;
    const rect = myChallengeButton.getBoundingClientRect();
    popup.style.top = `${rect.bottom + window.scrollY}px`;
    popup.style.left = `${rect.left}px`;

    popup.classList.toggle('hidden');
});

// 팝업 외부 클릭 시 닫기
document.addEventListener('click', function (event) {
    const popup = document.getElementById('myChallengePopup');
    const myChallengeButton = document.querySelector('.nav-links a');

    if (!popup.contains(event.target) && event.target !== myChallengeButton) {
        popup.classList.add('hidden');
    }
});

// 팝업 내부 버튼 클릭 이벤트
document.querySelectorAll('.popup-button').forEach(button => {
    button.addEventListener('click', function () {
        alert(`챌린지 ${this.textContent} 을 선택했습니다.`);
    });
});
// Chart.js 라이브러리 로드
const script = document.createElement('script');
script.src = "https://cdn.jsdelivr.net/npm/chart.js";
document.head.appendChild(script);

script.onload = function () {
    const ctx = document.getElementById('challengeCompletionChart').getContext('2d');
    const data = {
        labels: ['완료된 챌린지', '미완료된 챌린지'],
        datasets: [{
            data: [75, 25], // 예시로 75% 완료된 상태를 표시합니다.
            backgroundColor: ['#4caf50', '#e8e4de'],
            hoverBackgroundColor: ['#45a049', '#ccc'],
            borderWidth: 1
        }]
    };

    const options = {
        cutout: '70%', // 도넛형 그래프로 만들기 위해 가운데 부분을 잘라냅니다.
        responsive: true,
        plugins: {
            legend: {
                position: 'bottom'
            }
        }
    };

    new Chart(ctx, {
        type: 'doughnut',
        data: data,
        options: options
    });
};


/*// 팔로우 버튼 클릭 시 팔로워 숫자 업데이트
const followButton = document.getElementById('followButton');
const followerCountElement = document.getElementById('followerCount'); // 팔로워 수를 표시하는 요소의 ID
const followingCountElement = document.getElementById('followingCount'); // 팔로잉 수를 표시하는 요소의 ID

followButton.addEventListener('click', function () {
    const button = this;
    let followerCount = parseInt(followerCountElement.textContent, 10); // 현재 팔로워 수를 가져오기

    if (button.classList.contains('followed')) {
        // 언팔로우 상태로 변경
        button.classList.remove('followed');
        button.textContent = '팔로우';
        followerCount -= 1; // 팔로워 수 감소
    } else {
        // 팔로우 상태로 변경
        button.classList.add('followed');
        button.textContent = '언팔로우';
        followerCount += 1; // 팔로워 수 증가
    }

    followerCountElement.textContent = followerCount; // 변경된 팔로워 수 업데이트
});*/
// 돋보기 버튼 클릭 시 검색창 및 옵션 표시
document.getElementById('searchIcon').addEventListener('click', function () {
    const navLinks = document.querySelector('.nav-links');
    const searchOptions = document.getElementById('searchOptions');
    const searchInput = document.getElementById('searchInput');

    if (searchInput.classList.contains('hidden')) {
        navLinks.classList.add('hidden'); // 챌린지 링크 숨기기
        searchOptions.classList.remove('hidden'); // 검색 옵션 보이기
        searchInput.classList.remove('hidden'); // 검색창 보이기

        // 검색 옵션과 검색창을 헤더의 중앙으로 위치시키고 검색창 왼쪽에 검색 옵션 배치
        searchOptions.style.position = 'absolute';
        searchOptions.style.left = '50%';
        searchOptions.style.transform = 'translateX(-50%)';
        searchInput.style.position = 'relative';
        searchInput.style.left = '0';
        searchInput.style.marginLeft = '10px'; // 검색 옵션 옆으로 위치
        searchInput.focus(); // 검색창에 포커스
    } else {
        navLinks.classList.remove('hidden'); // 챌린지 링크 보이기
        searchOptions.classList.add('hidden'); // 검색 옵션 숨기기
        searchInput.classList.add('hidden'); // 검색창 숨기기

        // 위치 초기화
        searchOptions.style.position = '';
        searchOptions.style.left = '';
        searchOptions.style.transform = '';
        searchInput.style.position = '';
        searchInput.style.left = '';
        searchInput.style.marginLeft = '';
    }
});

// 검색창 이외 영역 클릭 시 검색창 및 옵션 숨기기
document.addEventListener('click', function (event) {
    const searchInput = document.getElementById('searchInput');
    const searchIcon = document.getElementById('searchIcon');
    const searchOptions = document.getElementById('searchOptions');
    const navLinks = document.querySelector('.nav-links');

    if (!searchInput.classList.contains('hidden') && event.target !== searchInput && event.target !== searchIcon && event.target !== searchOptions && !searchOptions.contains(event.target)) {
        searchInput.classList.add('hidden'); // 검색창 숨기기
        navLinks.classList.remove('hidden'); // 챌린지 링크 보이기
        searchOptions.classList.add('hidden'); // 검색 옵션 숨기기

        // 위치 초기화
        searchOptions.style.position = '';
        searchOptions.style.left = '';
        searchOptions.style.transform = '';
        searchInput.style.position = '';
        searchInput.style.left = '';
        searchInput.style.marginLeft = '';
    }
});
const searchInput = document.getElementById('searchInput');
searchInput.style.width = '600px';
searchInput.style.height = '30px';
const searchOptions = document.getElementById('searchOptions');
searchOptions.style.height = '30px';
