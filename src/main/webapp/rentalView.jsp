<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<style>
.container {
  margin-right: auto;
  margin-left: auto;
  margin-top: 20px;
}
@media (min-width: 992px) { .container {width: 970px;} }
@media (min-width: 1200px) { .container { width: 1060px; } }

</style>

    <script>
        
        function openModal(){
            var startDateTimeValue = $('#datetime-start').val();
            var endDateTimeValue = $('#datetime-end').val();
            $('.calendar-modal').css('display', 'block');
            $('.modal-mask').css('display', 'block');
            $('body').css('overflow', 'hidden');
            if(startDateTimeValue != '' && endDateTimeValue != ''){
                setStartDateTime(inputDateTimeFormatToDateObject(startDateTimeValue));
                setEndDateTime(inputDateTimeFormatToDateObject(endDateTimeValue));
                setCalendarModalForSelectingStartDateTime();
                $(startDeliveryType).addClass('active');
                $(endDeliveryType).removeClass('active');
            }
        }

        
        function closeModal(){
            $('.calendar-modal').css('display', 'none');
            $('.modal-mask').css('display', 'none');
            $('body').css('overflow', 'visible');
        }

        
        
        
        function beautifyDateObject(input_date_obj){
            var monthDate = getMonthDate(input_date_obj);
            var dayName = getDayName(input_date_obj);
            return monthDate+"("+dayName+")";
        }

        var daysName = ['일', '월', '화', '수', '목', '금', '토'];
        function getDayName(input_date_obj){
            return daysName[input_date_obj.getDay()];
        }

        function getMonthDate(input_date_obj){
            var monthIndex = input_date_obj.getMonth();
            var day = input_date_obj.getDate();
            return (monthIndex+1).toString()+"/"+day;
        }

        function beautifyDateTimeObject(datetimeObj){
            return getMonthDate(datetimeObj) + "(" + getDayName(datetimeObj) + ") " + addZero(datetimeObj.getHours()) + ":" + addZero(datetimeObj.getMinutes());
        }

        
        function addZero(i){
            if(i<10){
                i = "0"+i;
            }
            return i;
        }

        function input_datetime(){
        	
            var start_hour = startDateTimeObject.getHours();
            var start_min = startDateTimeObject.getMinutes();
            var end_hour = endDateTimeObject.getHours();
            var end_min = endDateTimeObject.getMinutes();
            var start_year = startDateTimeObject.getFullYear();
            var start_month = startDateTimeObject.getMonth()+1; 
            var start_day = startDateTimeObject.getDate();
            var end_year = endDateTimeObject.getFullYear();
            var end_month = endDateTimeObject.getMonth()+1; 
            var end_day = endDateTimeObject.getDate();
            $('#datetime-start').val(start_year+" "+start_month+" "+start_day+" "+start_hour+" "+start_min);
            $('#datetime-end').val(end_year+" "+end_month+" "+end_day+" "+end_hour+" "+end_min);
            $('#datetime-trigger').val(
                    beautifyDateObject(startDateTimeObject)+" "+addZero(start_hour)+":"+addZero(start_min)+"\n"+" ~ "+beautifyDateObject(endDateTimeObject)+" "+addZero(end_hour)+":"+addZero(end_min)
            );
        }


        $('.datetimepicker-fake-trigger').on('click', function(){
            openModal()
        });

        $('.calendar-modal-close').on('click', function(){
            closeModal()
        });

	</script>
<div class="container">
	<p style="margin-left:5px;font-size:12px">카테고리 : <span style="color:#148CFF;">캠핑</span></p>
	<div style=" float: left; width: 50%;padding-right: 20px;">
		<img style="width:100%;" alt="텐트" src="http://www.oasekorea.com/00_ADMIN/Code/goodsimg_PIC01/AAAA00120141218008MM-1.jpg">
	</div>
	<div style=" float: left; width: 50%;padding-left: 20px;">
		<hr style="border: 1.5px solid black;margin-top: 0px;">
		<div style="margin-left:10px">
			<p style="font-size:25px;font-weight:bold">4인용 A형 텐트</p>
			<p>별점 들어갈부분</p>
			<hr>
            	<div class="row product-detail-input-row">
					<div class="datetimepicker-fake-trigger"></div>
					<input class="datetimepicker-trigger" id="datetime-trigger" placeholder="대여/반납일자를 선택하기" readonly>
					<span class="glyphicon glyphicon-calendar"></span>
					<input type="hidden" name="datetime-start" id="datetime-start">
                    <input type="hidden" name="datetime-end" id="datetime-end">
                </div>
			<hr>
			<div style="font-size:20px;color:#B9062F;font-weight:bold"><span id="price">대여료 : 9000 원/24시간</span></div>
			<hr>
			<form name="form" method="get">
				<span>사이즈 </span>
				<select name="size" >
	               <option value="100">100cm</option>
	               <option value="200">200cm</option>
	               <option value="300">300cm</option>
	            </select>
	            &emsp;&emsp;&emsp;
				<span>수량 </span><input type="text" name="amount" value="1" size="1" style="height:25px;" readonly/>
				<input type="button" value="+" style="width:25px;" onclick="add();"/><input type="button" value="-" style="width:25px;" onclick="del();"/>
				<hr>
				<div style="float:right;">
				<button class="btn btn-primary">구매</button>
				<button class="btn btn-primary">장바구니</button>
				</div>
			</form>
    	</div>
			
		</div>
	</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />