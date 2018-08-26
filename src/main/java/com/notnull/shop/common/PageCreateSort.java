package com.notnull.shop.common;

public class PageCreateSort{
	public String getPageBar(int cPage, int numPerPage, int totalCount, String url,String p_category_name)
	{
		String pageBar="";
		int pageSize=5;
		System.out.println("@@@@"+p_category_name);
		int totalPage=(int)Math.ceil((double)totalCount/numPerPage);
		int pageNo=((cPage-1)/pageSize)*pageSize+1;
		int pageEnd=pageNo+pageSize-1;
		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
		
		//이전
		if(pageNo==1)
		{
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}
		else 
		{
			pageBar+="<li class='page-item active'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage))
		{
			if(cPage==pageNo)
			{
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			else
			{
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		//다음
		if(pageNo > totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>다음</a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a> ";
			pageBar += "</li>";
		}
		pageBar+="</ul>";
		
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage,numPerPage){";
		pageBar+="location.href='"+url+"?p_category_name="+p_category_name+"&cPage='+cPage;";	
		pageBar+="}";
		pageBar+="</script>";
		
		
		
		
		
		return pageBar;
		
		
	}
}
