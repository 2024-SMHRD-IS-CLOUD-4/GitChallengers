<%@page import="com.smhrd.model.Review"%>
<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.Join"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.JoinDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>CodePen - Little book of hey w/ ScrollTrigger (Scroll &amp;&amp; Click pages!)</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./css/reviewBook.css">

</head>
<body>

<!-- partial:index.partial.html -->
<div class="book">
  <div class="book__spine"></div>
  <div class="page book__page book__cover book__cover--front" style="--page-index: 1;">
    <div class="page__half page__half--front">
    <span> ${review.review_title}</span>
<%--     <span class="code">set(FOLD,{transformOrigin:"50% 100%",scaleY:0}),set(CLIPS,{transformOrigin:"50% 0"}),set(".cannon__shirt",{opacity:0}),set(".cannon",{y:28}),set(".text--ordered .char",{y:"100%"});const SPEED=.15,FOLD_TL=()=>new timeline().to(LEFT_ARM,{duration:SPEED,rotateY:-180,transformOrigin:`${100*(22/65.3)}% 50%`},0).to(RIGHT_ARM,{duration:SPEED,rotateY:-180,transformOrigin:`${100*((65.3-22)/65.3)}% 50%`},SPEED).to(FOLD,{duration:SPEED/4,scaleY:1},2*SPEED).to(FOLD,{duration:SPEED,y:-47},2*SPEED+.01).to(CLIPS,{duration:SPEED,scaleY:.2},2*SPEED).to(".cannon",{duration:SPEED,y:0},2*SPEED),LOAD_TL=()=>new timeline().to(".button__shirt",{transformOrigin:"50% 13%",rotate:90,duration:.15}).to(".button__shirt",{duration:.15,y:60}).to(".t-shirt__cannon",{y:5,repeat:1,yoyo:!0,duration:.1}).to(".t-shirt__cannon",{y:50,duration:.5,delay:.1}),FIRE_TL=()=>new timeline().set(".t-shirt__cannon",{rotate:48,x:-85,scale:2.5}).set(".cannon__shirt",{opacity:1}).to(".t-shirt__cannon-content",{duration:1,y:-35}).to(".t-shirt__cannon-content",{duration:.25,y:-37.5}).to(".t-shirt__cannon-content",{duration:.015,y:-30.5}).to(".cannon__shirt",{onStart:()=>CLIP.play(),duration:.5,y:"-25vmax"},"<").to(".text--ordered .char",{duration:.15,stagger:.1,y:"0%"}).to("button",{duration:.15*7,"--hue":116,"--lightness":55},"<"),ORDER_TL=new timeline({paused:!0});ORDER_TL.set(".cannon__shirt",{opacity:0}),ORDER_TL.set("button",{"--hue":260,"--lightness":20}),ORDER_TL.to("button",{scale:300/BUTTON.offsetWidth,duration:SPEED}),ORDER_TL.to(".text--order .char",{stagger:.1,y:"100%",duration:.1}),ORDER_TL.to(SHIRT,{x:BUTTON.offsetWidth/2-33,duration:.2}),ORDER_TL.add(FOLD_TL()),ORDER_TL.add(LOAD_TL()),ORDER_TL.add(FIRE_TL()),BUTTON.addEventListener("click",()=>{1===ORDER_TL.progress()?(document.documentElement.style.setProperty("--hue",360*Math.random()),ORDER_TL.time(0),ORDER_TL.pause()):0===ORDER_TL.progress()&&ORDER_TL.play()});</span>
 --%>      <svg class="sticker" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 316 306">
        <path d="M155 0c-37 0-63 8-85 30-6-6-21-7-29-7C22 23 6 38 6 56c1 24 9 34 24 40l-9 2-21 4 3 22c3 0 8 1 9 4 6 7 2 14 3 26 2 21 7 33 14 40 14 67 62 112 127 112 70 0 118-45 132-112 6-7 11-20 13-40 1-12-3-19 3-26 2-3 6-4 9-4l3-22-21-4-10-2c17-7 24-26 24-40 0-18-15-33-34-33-9 0-23 1-30 7-23-22-51-30-90-30z" fill="hsl(0, 0%, 96%)"></path>
        <g transform="matrix(1.34105 0 0 1.34105 -43 -1047)">
          <path d="M243 894c0 61-36 106-94 106-55 0-92-45-92-106s38-86 91-86 95 25 95 86z" fill="#803300"></path>
          <path d="M212 958c0 20-29 39-63 39-35 0-61-19-61-39s26-33 61-33 63 13 63 33z" fill="#e9c6af"></path>
          <path d="M181 932c0 7-19 24-30 24s-32-17-32-24c0-8 20-13 31-13 12 0 31 5 31 13z"></path>
          <ellipse cx="68.3" cy="827.7" rx="23.8" ry="23.1" fill="#803300"></ellipse>
          <path d="M85 826a17 16 0 00-17-14 17 16 0 00-16 16 17 16 0 0016 16 17 16 0 001 0l3-4a66 66 0 0111-12l2-2z" fill="#e9c6af"></path>
          <ellipse ry="23.1" rx="23.8" cy="827.7" cx="-231.2" transform="scale(-1 1)" fill="#803300"></ellipse>
          <path d="M215 826a17 16 0 0116-14 17 16 0 0117 16 17 16 0 01-17 16 17 16 0 01-1 0l-2-4a66 66 0 00-11-12l-2-2z" fill="#e9c6af"></path>
          <path d="M148 815c-14 0-26 1-38 4v11a199 199 0 0180 1v-11c-13-3-27-5-42-5z" fill="red"></path>
          <path d="M165 816a16 8 0 015 5 16 8 0 01-6 6l26 4v-11l-25-4z" fill="#e50000"></path>
          <path d="M148 789c-43 0-76 20-83 64 12-11 28-19 45-23 0 0-2-12 10-16 15-4 19-4 28-4 10 0 15 0 30 4s12 17 12 17c18 5 32 11 45 22-8-46-43-64-87-64z" fill="#1a1a1a"></path>
          <circle cx="97.2" cy="894.1" r="11.2" fill="#faa" fill-opacity=".6"></circle>
          <circle cy="894.1" cx="201.9" r="11.2" fill="#faa" fill-opacity=".6"></circle>
          <path d="M97 864a21 21 0 01-7 16 21 21 0 01-16 5M204 864a21 21 0 006 16 21 21 0 0016 5" fill="none" stroke="#e9afaf" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"></path>
          <g>
            <path d="M77 855c-6 0-13 0-23 2l-14 3 2 15 7 2c3 5 1 10 2 18 3 28 12 34 26 35 8 1 23 3 33-1s19-10 25-18c6-9 6-18 10-26 3-5 8-4 10 0 3 8 4 17 10 26 6 8 15 14 24 18 11 4 26 2 34 1 14-1 23-7 26-35 1-8-2-13 2-18l7-2 2-15-15-3c-15-3-23-2-34-2h-13l-25 4c-8 2-15 7-23 6-8 0-15-5-23-6l-25-4H77z"></path>
            <path d="M85 860c-10 1-25 1-28 13-3 15-3 32 6 45 7 11 23 9 35 9 19-1 35-16 40-34 2-8 4-14 1-19-6-10-20-12-31-13l-23-1z" fill="#333"></path>
            <path d="M56 864a4 2 0 01-4 2 4 2 0 01-4-2 4 2 0 014-1 4 2 0 014 1" fill="#b3b3b3"></path>
            <path d="M215 860c10 1 24 1 28 13 3 15 3 32-6 45-7 11-23 9-35 9-19-1-35-16-40-34-2-8-4-14-1-19 6-10 20-12 31-13l23-1z" fill="#333"></path>
            <path d="M244 864a4 2 0 004 2 4 2 0 004-2 4 2 0 00-4-1 4 2 0 00-4 1" fill="#b3b3b3"></path>
            <path d="M101 861l-19 66h17l18-65-16-1zM89 860h-4l-3 1-18 59 6 5z" fill="#fff"></path>
          </g>
        </g>
      </svg>
    </div>
    <div class="page__half page__half--back">
    
    	
      <div class="book__insert"></div>
    </div>
  </div>
  <div class="page book__page" style="--page-index: 2;">
    <div class="page__half page__half--front" id="FirstPage">
      <div class="page__number">1</div>
    </div>
    <div class="page__half page__half--back" id="SecondPage">
      <div class="page__number">2</div>
    </div>
  </div>
  <div class="page book__page" style="--page-index: 3;">
    <div class="page__half page__half--front">
      <div class="page__number">3</div>
    </div>
    <div class="page__half page__half--back">
      <div class="page__number">4</div>
    </div>
  </div>
  <div class="page book__page" style="--page-index: 4;">
    <div class="page__half page__half--front">
      <div class="page__number">5</div>
    </div>
    <div class="page__half page__half--back">
      <div class="page__number">6</div>
    </div>
  </div>
  <div class="page book__page" style="--page-index: 5;">
    <div class="page__half page__half--front">
      <div class="page__number">7</div>
    </div>
    <div class="page__half page__half--back">
      <div class="page__number">8</div>
    </div>
  </div>
  <div class="page book__page" style="--page-index: 6;">
    <div class="page__half page__half--front">
      <div class="page__number">9</div>
    </div>
    <div class="page__half page__half--back">
      <div class="page__number">10</div>
    </div>
  </div>
  <div class="page book__page" style="--page-index: 7;">
    <div class="page__half page__half--front">
      <div class="page__number">11</div>
    </div>
    <div class="page__half page__half--back">
      <div class="page__number">12</div>
    </div>
  </div>
  <div class="page book__page" style="--page-index: 8;">
    <div class="page__half page__half--front">
      <div class="page__number">13</div>
    </div>
    <div class="page__half page__half--back">
      <div class="page__number">14</div>
    </div>
  </div>
  <div class="page book__page" style="--page-index: 9;">
    <div class="page__half page__half--front">
      <div class="page__number">15</div>
    </div>
    <div class="page__half page__half--back">
      <div class="page__number">16</div>
    </div>
  </div>
  <div class="page book__page" style="--page-index: 10;">
    <div class="page__half page__half--front">
      <div class="page__number">17</div>
    </div>
    <div class="page__half page__half--back">
      <div class="page__number">18</div>
    </div>
  </div>
  <div class="page book__page" style="--page-index: 11;">
    <div class="page__half page__half--front">
      <div class="page__number">19</div>
    </div>
    <div class="page__half page__half--back">
      <div class="page__number">20</div>
    </div>
  </div>
  <div class="page book__page book__cover book__cover--back" style="--page-index: 12;">
    <div class="page__half page__half--front"></div>
<%--     <div class="page__half page__half--back"><span class="code">set(FOLD,{transformOrigin:"50% 100%",scaleY:0}),set(CLIPS,{transformOrigin:"50% 0"}),set(".cannon__shirt",{opacity:0}),set(".cannon",{y:28}),set(".text--ordered .char",{y:"100%"});const SPEED=.15,FOLD_TL=()=>new timeline().to(LEFT_ARM,{duration:SPEED,rotateY:-180,transformOrigin:`${100*(22/65.3)}% 50%`},0).to(RIGHT_ARM,{duration:SPEED,rotateY:-180,transformOrigin:`${100*((65.3-22)/65.3)}% 50%`},SPEED).to(FOLD,{duration:SPEED/4,scaleY:1},2*SPEED).to(FOLD,{duration:SPEED,y:-47},2*SPEED+.01).to(CLIPS,{duration:SPEED,scaleY:.2},2*SPEED).to(".cannon",{duration:SPEED,y:0},2*SPEED),LOAD_TL=()=>new timeline().to(".button__shirt",{transformOrigin:"50% 13%",rotate:90,duration:.15}).to(".button__shirt",{duration:.15,y:60}).to(".t-shirt__cannon",{y:5,repeat:1,yoyo:!0,duration:.1}).to(".t-shirt__cannon",{y:50,duration:.5,delay:.1}),FIRE_TL=()=>new timeline().set(".t-shirt__cannon",{rotate:48,x:-85,scale:2.5}).set(".cannon__shirt",{opacity:1}).to(".t-shirt__cannon-content",{duration:1,y:-35}).to(".t-shirt__cannon-content",{duration:.25,y:-37.5}).to(".t-shirt__cannon-content",{duration:.015,y:-30.5}).to(".cannon__shirt",{onStart:()=>CLIP.play(),duration:.5,y:"-25vmax"},"<").to(".text--ordered .char",{duration:.15,stagger:.1,y:"0%"}).to("button",{duration:.15*7,"--hue":116,"--lightness":55},"<"),ORDER_TL=new timeline({paused:!0});ORDER_TL.set(".cannon__shirt",{opacity:0}),ORDER_TL.set("button",{"--hue":260,"--lightness":20}),ORDER_TL.to("button",{scale:300/BUTTON.offsetWidth,duration:SPEED}),ORDER_TL.to(".text--order .char",{stagger:.1,y:"100%",duration:.1}),ORDER_TL.to(SHIRT,{x:BUTTON.offsetWidth/2-33,duration:.2}),ORDER_TL.add(FOLD_TL()),ORDER_TL.add(LOAD_TL()),ORDER_TL.add(FIRE_TL()),BUTTON.addEventListener("click",()=>{1===ORDER_TL.progress()?(document.documentElement.style.setProperty("--hue",360*Math.random()),ORDER_TL.time(0),ORDER_TL.pause()):0===ORDER_TL.progress()&&ORDER_TL.play()});</span></div> --%>
    <div class="book__insert"><a href="https://jhey.dev" target="_blank" rel="noopener noreferrer"><img class="logo" src="https://assets.codepen.io/605876/bear-with-cap.svg"/></a></div>
  </div>
</div>
<!-- partial -->
  <script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/ScrollTrigger.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/gsap-latest-beta.min.js'></script><script  src="./js/reviewBook.js"></script>

<script>
	let reviewContent = "${review.review_content}";
	
	console.log('reviewCon', reviewContent);
	
	const maxLength = 282;
	let contentFront = reviewContent.slice(0, maxLength); // 0~282 까지
	let contentBack = reviewContent.slice(maxLength); // 282부터

	document.getElementById('FirstPage').textContent = contentFront;
	document.getElementById('SecondPage').textContent = contentBack;


</script>

</body>
</html>

