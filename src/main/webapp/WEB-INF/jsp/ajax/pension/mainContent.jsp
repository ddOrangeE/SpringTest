<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                        <%-- <label class="ml-3 text-light">회원<input type="radio" class="ml-1" name="check"></label>
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
   						--%>
                       
                           <div class="d-flex">
                               <div class="col-3">
                                   <div><label class="text-light mt-3">이름</label></div>
                                   <div><label class="text-light mt-4">전화번호</label></div>
                               </div>
                               <div class="col-9 mt-2 mr-3">    
                                   <div><input type="text" class="btn w-75"></div>
                                   <div><input type="password" class="btn w-75 mt-4"></div>
                                   
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