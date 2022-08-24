<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

			<header class="name d-flex align-items-center justify-content-center">
               <!-- vertical-alignment는 사용 불가! 왜냐하면 h1자체가 높이가 텍스트에 맞춰져있어서 움직이질 않음 그러면 d-flex줘서 header안에 있는 인라인 속성을 가로배치 중앙(justify), 세로배치 중앙(align)해주면 됨-->
               <!-- d-flex는 너비를 줄여주는 속성도 포함되어있음!-->
               <a href="/ajax/pension/main" id="mainLogo"><h1>통나무 펜션</h1></a>
           </header>

           <nav class="main-menu">
               <ul class="nav nav-fill">
                   <li class="nav-item"><a href="#" class="nav-link text-light">펜션소개</a></li>
                   <li class="nav-item"><a href="#" class="nav-link text-light">객실보기</a></li>
                   <li class="nav-item"><a href="/ajax/pension/reservation" class="nav-link text-light">예약하기</a></li>
                   <li class="nav-item"><a href="/ajax/pension/list" class="nav-link text-light">예약목록</a></li>
               </ul>
           </nav>
           
