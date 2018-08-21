<%@page import="com.notnull.shop.product.model.vo.ProductQuestion"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% 
	List<ProductQuestion> questionList =(List)request.getAttribute("questionList");	
%>
</head>
<body>
		<table id="tbl-comment">
				    <%
				    if(questionList != null){
				        for(ProductQuestion productQuestion : questionList)
				        {
				       	 if(productQuestion.getQuestion_level()==1){%>
					    <tr class='level1'>
					        <td>
					            <sub class=comment-writer><%=productQuestion.getMember_id() %></sub>
					            <sub class=comment-date><%=productQuestion.getQuestion_date()%></sub>
						    <br /> <br />
					            <%=productQuestion.getP_question_content() %>
						</td>
					        <td>
					            <button class="btn btn-outline-success btn-sm" value="<%=productQuestion.getP_question_code()%>">답글</button>
					            <button class="btn btn-outline-dark btn-sm delete" value="<%=productQuestion.getP_question_code()%>">삭제</button>
					        </td>
					        
					    </tr>
				  		<%}
				        else
				        {%>
				        	<tr class='level2'>
				        		<td style="padding-left: 40px">
				        			<sub><%=productQuestion.getMember_id()%></sub>
				        			<sub><%=productQuestion.getQuestion_date()%></sub>
				        			<br>
				        			<%=productQuestion.getP_question_content()%>
				        		</td>
				        		<td></td>
				        	</tr>
				        	
				     	<% }
				        
				    	}   
				   } %>
				 	
			        <script>
			      		var logIn="<c:out value='${memberLoggedIn.member_id}'/>";
			        	$(".btn-outline-success").on('click',function(e){
			        		if(logIn!=null){
			        		//화면에 출력될 답글 입력창 만들기
			        		var tr=$("<tr></tr>");	//태그생성
			        		var html="<td style='display:none;text-align:left;' colspan=2>";
			        		html+='<form id="answerForm" name="answerForm" method="post">';
			        		html+="<input type='hidden' name='product_code' value='${joinCategory.product_code}'/>";
			        		html+="<input type='hidden' name='member_id' value='${memberLoggedIn.member_id}'/>";
			        		html+="<input type='hidden' name='question_level' value='2'/>";
			        		html+="<input type='hidden' name='p_question_code_ref' value='"+$(this).val()+"'/>";			        		
			        		html+="<textarea name='p_question_content' cols='60' rows='1'></textarea>";
			        		html+="<input type='button' class='btn-insert2 answer' value='등록'/>";
			        		html+="</form></td>";
			        		//위에서 작성한 html구문을 tr 변수 text노드에 삽입
			        		tr.html(html);
			        		//작성된 tr 태그를 본 html 구문의 (tr class=level1) 뒤에 삽입
			        		tr.insertAfter($(this).parent().parent()).children("td").slideDown(800);
			        		//이벤트가 1회만 발생하게 제한
			        		$(this).off('click');
			        		//답글달고 버튼을 누르면 해당 서블릿에 데이터 전송
			        		tr.find('form').submit(function(e){
			        			if(logIn==null){
			        				fn_loginAlert();
			        				e.preventDefault();
			        			}	
			        			var len=$(this).children('textarea').val().trim().length;
			        			if(len==0){
			        				e.preventDefault();
			        				tr.find('textarea').focus();
			        			}
			        		});
			        		}
			        	});
			        
			        </script>
   		 </table>

</body>
</html>