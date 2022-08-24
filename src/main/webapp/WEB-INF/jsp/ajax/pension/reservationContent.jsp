<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="container col-6">
	    <h3 class="text-center font-weight-bold mt-3">예약하기</h3>
	    
	    <div class="mt-2">
		    <label>이름</label>
		    <input type="text" class="form-control" id="nameInput">    
	    </div>
	    
	    <div class="mt-2">
		    <label>예약날짜</label>
		    <input type="text" class="form-control" id="dateInput">
	    </div>
	
		<div class="mt-2">
		    <label>숙박일수</label>
		    <input type="text" class="form-control" id="dayInput">
		</div>	    

		<div class="mt-2">
		    <label>숙박인원</label>
		    <input type="text" class="form-control" id="headcountInput">
		</div>	    

		<div class="mt-2">
		    <label>전화번호</label>
		    <input type="text" class="form-control" id="phoneNumberInput">
		</div>	    
	    
	    <button type="button" class="btn form-control btn-warning mt-3" id="btnReservation">예약하기</button>
    </div>
    
    <script>
    	$(document).ready(function() {
    		
    		$("#btnReservation").on("click", function(){
    			
    			let name = $("#nameInput").val();
    			let date = $("#dateInput").val();
    			let day = $("#dayInput").val();
    			let headcount = $("#headcountInput").val();
    			let phoneNumber = $("#phoneNumberInput").val();
    			
    			if(name == "") {
    				alert("이름을 입력하세요.");
    				return;
    			}
    			
    			if(date == "") {
    				alert("예약날짜를 선택하세요.");
    				return;
    			}
    			
    			if(day == "") {
    				alert("숙박일수를 입력하세요.");
    				return;
    			}
    			
    			// 숙박일수 숫자로만 표현되었는지 확인
    			// 간단하게 확인 할수 있는 방법이 javascript 에 있다 : isNaN (= Not a Number)
    			if(isNaN(day)) {   // true 이면 숫자가 아닌 것
    				alert("숙박일수는 숫자만 입력 가능합니다.");
    				return;
    			}
    			
    			if(headcount == "") {
    				alert("숙박인원을 입력하세요.");
    				return;
    			}
    			
    			if(isNaN(headcount)) {
    				alert("숙박인원은 숫자만 입력 가능합니다.");
    				return;
    			}
    			
    			if(phoneNumber == "") {
    				alert("전화번호를 입력하세요.");
    				return;
    			}
    			
    			$.ajax({
    				type:"post"
    				, url:"/ajax/pension/add"
    				, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
    				, success:function(data){
    					if(data.result == "success") {
    						location.href="/ajax/pension/list";
    					} else {
    						alert("예약실패");
    					}
    				}
    				, error:function(){
    					alert("예약에러");
    				}
    			});
    			
    		});
    		
    	});
    </script>