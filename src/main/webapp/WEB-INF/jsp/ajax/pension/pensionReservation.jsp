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

  			<%@ include file="/WEB-INF/jsp/ajax/pension/reservationContent.jsp" %>		
			
			<%@ include file="/WEB-INF/jsp/ajax/pension/footer.jsp" %>	
			



       </div>



       <script>




       </script>
    </body>
</html>