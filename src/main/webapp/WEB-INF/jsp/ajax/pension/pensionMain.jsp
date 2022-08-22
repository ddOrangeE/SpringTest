<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

       <title>통나무 펜션</title>

       <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       
       <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
       <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

       <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


       <link rel="stylesheet" href="style.css" type="text/css">
       
       <link rel="stylesheet" href="/ajax/pension/pensionStyle.css" type="text/css">
   </head>

   <body>
   
   <%-- include 는 다른 jsp가지고 오는 것 
   <%@ include file="/ajax/pension/pensionStyle.css" %>  --%>
   
       <div id="wrap">
           <%@ include file="/WEB-INF/jsp/ajax/pension/header.jsp" %>

               <section class="bannerImg">
                   <img src="/ajax/pension/pensionImg.jpg">
               </section>

               <article class="contents d-flex">
                   <div class="reservation col-4 d-flex justify-content-center align-items-center">
                       <h1 class="text-light mr-4">실시간 <br> 예약하기</h1>
                   </div>
                   <div class="check-reservation col-5">
                       <div class="checkMember mt-4">
                           <label><h4 class="text-light font-weight-bold">예약 확인</h4></label> 
                           <label class="ml-3 text-light">회원<input type="radio" class="ml-1" name="check"></label>
                           <label class="ml-3 text-light">비회원<input type="radio" class="ml-1" name="check"></label>
                           
                           <div class="d-none">
                               <div class="d-flex">
                                   <div class="col-3">
                                       <div><label class="text-light mt-3">아이디 : </label></div>
                                       <div><label class="text-light mt-4">비밀번호 : </label></div>
                                   </div>
                                   <div class="col-9 mt-3 mr-3">    
                                       <div><input type="text" class="btn w-75"></div>
                                       <div><input type="password" class="btn w-75 mt-3"></div>
                                   </div>
   
                               </div>
                               <button type="button" style="float:right;" class="btn bg-success text-light mt-3 mr-5">조회 하기</button>

                           </div>
                       
                           <div class="d-flex">
                               <div class="col-3">
                                   <div><label class="text-light mt-3">이름</label></div>
                                   <div><label class="text-light mt-2">전화번호</label></div>
                                   <div><label class="text-light mt-2">날짜</label></div>
                               </div>
                               <div class="col-9 mt-2 mr-3">    
                                   <div><input type="text" class="btn w-75"></div>
                                   <div><input type="password" class="btn w-75 mt-2"></div>
                                   <div><input type="text" class="btn w-75 mt-2"></div>
                               </div>

                           </div>
                           <button type="button" style="float:right;" class="btn bg-success text-light mt-3 mr-5">조회 하기</button>
                       </div>
                       
                   </div>
                   <div class="inquiry col-3 d-flex justify-content-center align-items-center">
                       <div>
                           <h4 class="text-light">예약문의 :</h4>
                           <h1 class="text-light">010- <br> 000-1111</h1>
                       </div>
                   </div>
               </article>
				
				<footer>
					제주특별자치도 제주시 애월읍 <br>
					사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목 <br>
					Copyright 2025 tongnamu All right reserved
				</footer>



       </div>



       <script>




       </script>
    </body>
</html>