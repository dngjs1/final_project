package com.notnull.shop.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.sql.Date;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.notnull.shop.member.model.vo.PointLog;
import com.notnull.shop.product.model.service.ProductService;
import com.notnull.shop.product.model.vo.BuyInfo;
import com.notnull.shop.product.model.vo.Cart;
import com.notnull.shop.product.model.vo.CartJoinList;
import com.notnull.shop.product.model.vo.Product;
import com.notnull.shop.product.model.vo.ProductCategory;
import com.notnull.shop.product.model.vo.ProductDetailImg;
import com.notnull.shop.product.model.vo.ProductImg;
import com.notnull.shop.product.model.vo.ProductJoinCategory;
import com.notnull.shop.product.model.vo.ProductJoinOption;
import com.notnull.shop.product.model.vo.ProductListJoin;
import com.notnull.shop.product.model.vo.ProductOption;
import com.notnull.shop.product.model.vo.ProductQuestion;
import com.notnull.shop.product.model.vo.ProductReview;
import com.notnull.shop.product.model.vo.ProductReviewImg;
import com.notnull.shop.product.model.vo.ProductReviewImgJoin;
import com.notnull.shop.product.model.vo.ProductReviewLike;


@Controller
public class ProductController {

	@Autowired
	private ProductService service;
	
	
	@RequestMapping("/product.do")
	public String selectProductList(Model m ,HttpServletRequest request) {
		
		
		List<ProductListJoin> list = service.selectProductList();
		m.addAttribute("list",list);
		System.out.println(list);
		return "/product/shop";
	}
	
	@RequestMapping("/searchProduct.do")
	public String searchProduct(Model m,HttpServletRequest request) {
		String searchName=request.getParameter("searchName");
		
		List<ProductListJoin> list =service.searchProduct(searchName);
		m.addAttribute("list",list);
		System.out.println("!!!!!!!!!!!!!@!@!@!@!@@@@@@@@@@@@"+list);
		return "/product/shop";
	}
	
	
	@RequestMapping("/productupload.do")
	public String fileUpload(Model model) {
		
		List<ProductCategory> categoryList=new ArrayList<ProductCategory>();
		categoryList=service.selectCategoryList();
		
		model.addAttribute("categoryList",categoryList);
		
		return "/product/uploadForm";
	}
	
	
	
	@RequestMapping("/upload.do")
    public ModelAndView requestupload2(MultipartHttpServletRequest mtfRequest, HttpServletRequest request,Product product) {

		
		String[] sizes=request.getParameterValues("size");
		String[] sleft_amounts=request.getParameterValues("left_amount");
		
		List<ProductOption> productOptionList=new ArrayList<ProductOption>();
			int[] left_amounts = new int[sleft_amounts.length];
			
			for(int i=0;i<sleft_amounts.length;i++) {
				int a= Integer.parseInt(sleft_amounts[i]);
				left_amounts[i]=a;
			}
			
			for(int i =0; i<sizes.length;i++) {
				ProductOption productOption = new ProductOption();
				productOption.setLeft_amount(left_amounts[i]);
				productOption.setOption_size(sizes[i]);
				productOptionList.add(productOption);
			}
		
 		/*상품사진 처리*/
        List<MultipartFile> fileList = mtfRequest.getFiles("file_0");
        String saveDir="";
        File dir=null;
        List<ProductImg> productImgList= new ArrayList<ProductImg>();
        saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/productImg/");
        dir=new File(saveDir);
		if(dir.exists()==false) System.out.println(dir.mkdirs());//폴더생성
		
        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈
            
            String ext=originFileName.substring(originFileName.lastIndexOf(".")+1);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum=(int)(Math.random()*1000);
			String renamedFileName=sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName+="_"+rndNum+"."+ext;

            String safeFile = saveDir + System.currentTimeMillis() + originFileName;
            try {
                mf.transferTo(new File(saveDir+File.separator+renamedFileName));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            
            ProductImg productImg = new ProductImg();
                      
            productImg.setP_img_path(originFileName);
            productImg.setNew_p_img_path(renamedFileName);
            
            productImgList.add(productImg);
        }
        
        /*상품상세정보 사진 처리*/
        List<MultipartFile> fileList1 = mtfRequest.getFiles("file_1");
        List<ProductDetailImg> productDetailImgList = new ArrayList<ProductDetailImg>();
        saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/productDetailImg/");
        dir=new File(saveDir);
        if(dir.exists()==false) System.out.println(dir.mkdirs());//폴더생성
        
        for (MultipartFile mf : fileList1) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            String ext=originFileName.substring(originFileName.lastIndexOf(".")+1);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum=(int)(Math.random()*1000);
			String renamedFileName=sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName+="_"+rndNum+"."+ext;

            String safeFile = saveDir + System.currentTimeMillis() + originFileName;
            try {
                mf.transferTo(new File(saveDir+File.separator+renamedFileName));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            
            ProductDetailImg productDetailImg = new ProductDetailImg();
                      
            productDetailImg.setP_detail_img_path(originFileName);
            productDetailImg.setNew_p_detail_img_path(renamedFileName);
            
            productDetailImgList.add(productDetailImg);
        }
        if(product.getReal_size().isEmpty()) {
        	product.setReal_size("상품 상세 정보 확인");
        }
        int result= service.insertProduct(product,productImgList,productDetailImgList,productOptionList);
        ModelAndView mv=new ModelAndView();
        String msg="";
		if(result>0)
		{
			msg="등록을 성공하였습니다.";
		}
		else
		{
			msg="등록을 실패하였습니다.";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", "/product.do");
		
		mv.setViewName("common/msg");	
        return mv;
    }
	
	@Transactional
	@RequestMapping("/productView.do")
	public String productView(Model model,HttpServletRequest request) {
		int product_code=Integer.parseInt(request.getParameter("product_code"));
		ProductJoinCategory joinCategory=service.selectProduct(product_code);
		List<ProductOption> optionList =service.selectOption(product_code);
		List<ProductReviewImgJoin> reviewImgList=service.selectReviewImg(product_code);
		List<ProductDetailImg> detailImgList=service.selectDetailImg(product_code);
		List<ProductImg> imgList=service.selectImgList(product_code);

		model.addAttribute("joinCategory", joinCategory);
		model.addAttribute("optionList", optionList);
		model.addAttribute("reviewImgList",reviewImgList);
		model.addAttribute("detailImgList",detailImgList);
		model.addAttribute("imgList",imgList);
		
		List<ProductReview> productReviewList = new ArrayList<ProductReview>();
		
		productReviewList=service.selectReview(product_code);
		
		request.setAttribute("reviewList", productReviewList);
		
		//문의사항
		List<ProductQuestion> questionList=service.selectQuestion(product_code);
		
		request.setAttribute("questionList", questionList);
				
		List<ProductReviewLike> likeList=service.selectLikeList();
		
		request.setAttribute("likeList", likeList);
		
			return "/product/productView";
	}
	
	
	@RequestMapping("/cartInsert.do")
	public void cartInsert(Cart cart,HttpServletResponse response) throws IOException {
		//같은상품있나 확인하고 있으면 수량만 추가.
		int productCode=cart.getProduct_code();
		List<CartJoinList> cartList=service.selectCartList(cart.getMember_id());
		int result=0;
		boolean check=false;
		for(CartJoinList cartJoin: cartList) {
			if(cartJoin.getProduct_option_code()==cart.getProduct_option_code()) {
				cart.setCart_code(cartJoin.getCart_code());
				result=service.plusCart(cart);
				check=true;
			}
		}
		if(!check) {
			result=service.insertCart(cart);
		}
		response.getWriter().print(result);
	}
	
	@RequestMapping("/cartView.do")
	public String cartView(String member_id,Model model) {
		List<CartJoinList> cartList=service.selectCartList(member_id);
		model.addAttribute("cartList",cartList);
		return "/product/cartView";
	}
	
	@RequestMapping("/changeCart.do")
	public void changeCart(Cart cart,HttpServletResponse response) throws IOException {
		int result = service.changeCart(cart);
		response.getWriter().print(result);
	}
	
	@RequestMapping("/deleteCart.do")
	public String deleteCart(String cart_code,String member_id,RedirectAttributes re){
		int result = service.deleteCart(Integer.parseInt(cart_code));
		re.addAttribute("member_id",member_id);
		return "redirect:/cartView.do";
	}
		
	@RequestMapping("/deleteSelectCart.do")
	public String deleteSelectCart(String member_id,HttpServletRequest request,RedirectAttributes re){
		String[] cart_codes=request.getParameterValues("check");
		int result = service.deleteSelectCart(cart_codes);
		re.addAttribute("member_id",member_id);
		return "redirect:/cartView.do";
	}
		
	@RequestMapping("/buyForm.do")
	public String buyForm(Model model,HttpServletRequest request) {
		int product_code=Integer.parseInt(request.getParameter("product_code"));
		int quantity=Integer.parseInt(request.getParameter("cart_quantity"));
		int product_option_code=Integer.parseInt(request.getParameter("product_option_code"));
		String member_id=request.getParameter("member_id");
		ProductJoinOption productJoinOption=service.selectProductJoinOption(product_option_code);
		
		int point = service.selectPoint(member_id);
		model.addAttribute("point",point);
		model.addAttribute("productJoinOption",productJoinOption);
		model.addAttribute("quantity",quantity);
		return "/product/buyForm";
	}
	
	@RequestMapping("/buyForm2.do")
	public String buyForm2(Model model,HttpServletRequest request) {
		String[] cart_codes=request.getParameterValues("check");
		String member_id=request.getParameter("member_id");
		List<CartJoinList> cartList=service.selectCartList(cart_codes);
		
		int point = service.selectPoint(member_id);
		model.addAttribute("point",point);
		model.addAttribute("cartList",cartList);
		return "/product/buyForm";
	}
	
	@RequestMapping("/buyEnd.do")
	public String buyEnd(BuyInfo buyInfo,Model model,HttpServletRequest request) {
		String[] product_option_codes = request.getParameterValues("product_option_code");
		String[] buy_quantitys = request.getParameterValues("buy_quantity");
		String[] total_price = request.getParameterValues("total_price");
		String[] cart_codes=null;
		if( request.getParameterValues("cart_code") != null ) {
			cart_codes = request.getParameterValues("cart_code");
		}
		
		int last_price=Integer.parseInt(request.getParameter("last_price"));
		int plus_point=Integer.parseInt(request.getParameter("plus_point"));
		int minus_point=Integer.parseInt(request.getParameter("minus_point"));
		String product_all_name=request.getParameter("name1");
		PointLog pointLog = new PointLog(0,buyInfo.getMember_id(),plus_point,"상품 구매 적립",null);
		PointLog pointLog2 = new PointLog(0,buyInfo.getMember_id(),-minus_point,"상품 구매 사용",null);
		
		List<BuyInfo> buyList=new ArrayList<BuyInfo>();
		for(int i=0;i<product_option_codes.length;i++) {
			BuyInfo buyInfo2=new BuyInfo();
			buyInfo2.setProduct_option_code(Integer.parseInt(product_option_codes[i]));
			buyInfo2.setBuy_quantity(Integer.parseInt(buy_quantitys[i]));
			buyInfo2.setMember_id(buyInfo.getMember_id());
			buyInfo2.setReceiver_post_no(buyInfo.getReceiver_post_no());
			buyInfo2.setReceiver_address(buyInfo.getReceiver_address());
			buyInfo2.setReceiver_d_address(buyInfo.getReceiver_d_address());
			buyInfo2.setReceiver_name(buyInfo.getReceiver_name());
			buyInfo2.setPhone2(buyInfo.getPhone2());
			buyInfo2.setRequest(buyInfo.getRequest());
			buyInfo2.setTotal_price(Integer.parseInt(total_price[i]));
			buyInfo2.setBuy_status("P");
			buyList.add(buyInfo2);
		}
		int result=service.insertBuyList(buyList);
		if(result>0) {
			//포인트 적립
			int result2=service.insertPoint(pointLog);
			//포인트 차감
			int result3=service.insertPoint(pointLog2);
			//재고 차감
			int result4=service.updateLeftList(buyList);
			//장바구니 삭제
			if(cart_codes != null) {
				int result5=service.deleteSelectCart(cart_codes);
			}
		}
		
		model.addAttribute("product_all_name",product_all_name);
		model.addAttribute("buyInfo",buyList.get(0));
		model.addAttribute("last_price",last_price);
		return "/product/buyEnd";
	}
	
	@RequestMapping(value="/productReviewInsert.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView reviewInsert(Model model,MultipartHttpServletRequest mtfRequest,HttpServletRequest request,ProductReview productReview ) {
	    String saveDir="";
        File dir=null;
        
	    List<MultipartFile> fileList1 = mtfRequest.getFiles("file_1");
	    List<ProductReviewImg> productReviewImgList = new ArrayList<ProductReviewImg>();
	    
	    if(!fileList1.isEmpty() && fileList1.get(0).getOriginalFilename().length()>0) {
	        saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/productReviewImg/");
	        dir=new File(saveDir);
	        if(dir.exists()==false) System.out.println(dir.mkdirs());//폴더생성
	        
	        for (MultipartFile mf : fileList1) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈
	
	            String ext=originFileName.substring(originFileName.lastIndexOf(".")+1);
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndNum=(int)(Math.random()*1000);
				String renamedFileName=sdf.format(new Date(System.currentTimeMillis()));
				renamedFileName+="_"+rndNum+"."+ext;
	
	            String safeFile = saveDir + System.currentTimeMillis() + originFileName;
	            try {
	                mf.transferTo(new File(saveDir+File.separator+renamedFileName));
	            } catch (IllegalStateException e) {
	                e.printStackTrace();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	            
	            ProductReviewImg productReviewImg = new ProductReviewImg();
	                      
	            productReviewImg.setReview_img_path(originFileName);
	            productReviewImg.setNew_review_img_path(renamedFileName);
	            
	            productReviewImgList.add(productReviewImg);
	        }
	    }
		int result=service.reviewInsert(productReview,productReviewImgList);
		
		ModelAndView mv=new ModelAndView();
        String msg="";
		if(result>0)
		{
			msg="등록을 성공하였습니다. 100p가 지급됩니다.";
			PointLog pointLog = new PointLog(0,productReview.getMember_id(),100,"상품평 등록 증정",null);
			int result2=service.insertPoint(pointLog);
		}
		else
		{
			msg="등록을 실패하였습니다.";
		}
		mv.addObject("product_code",productReview.getProduct_code());
		mv.addObject("msg", msg);
		mv.addObject("loc", "productView.do");
		
		mv.setViewName("common/msg");	
        return mv;
	}

	
	@RequestMapping("/productReviewForm.do")
	public String productReviewForm(Model model,HttpServletRequest request) {
		int product_code=Integer.parseInt(request.getParameter("product_code"));
		request.setAttribute("product_code", product_code);
	
		return "product/productReviewForm";
	}


	
	@RequestMapping("/reviewStarOrder.do")
	public String reviewStarOrder(Model model) {
		List<ProductListJoin> list = service.reviewStarOrder();
		model.addAttribute("list",list);		
		return "/product/shop";
		
	}
	
	@RequestMapping("/highPriceOrder.do")
	public String highPriceOrder(Model model) {
		List<ProductListJoin> list = service.highPriceOrder();
		model.addAttribute("list",list);		
		return "/product/shop";
		
	}
	
	@RequestMapping("/lowPriceOrder.do")
	public String lowPriceOrder(Model model) {
		List<ProductListJoin> list = service.lowPriceOrder();
		model.addAttribute("list",list);
		return "/product/shop";
		
	}
	
	@RequestMapping("/writeDateOrder.do")
	public String writeDateOrder(Model model) {
		List<ProductListJoin> list = service.writeDateOrder();
		model.addAttribute("list",list);		
		return "/product/shop";
		
	}
	
	
	@RequestMapping("/addQuestion.do")
	public String addQuestion(HttpServletRequest request,HttpServletResponse response, ProductQuestion productQuestion) throws IOException {
		int productCode=productQuestion.getProduct_code();
		
		int result=service.addQuestion(productQuestion);
		System.out.println(result);
		List<ProductQuestion> questionList=service.selectQuestion(productCode);
		ProductJoinCategory joinCategory=service.selectProduct(productCode);
		
		request.setAttribute("joinCategory", joinCategory);
		request.setAttribute("questionList", questionList);
		
		return "/product/questionAjax";

	}
	
	@RequestMapping("/deleteQuestion.do")
	public String deleteQuestion(HttpServletRequest request,HttpServletResponse response, int p_question_code,int product_code) {
		int result=service.deleteQuestion(p_question_code);
		System.out.println(result);
		
		List<ProductQuestion> questionList=service.selectQuestion(product_code);
		
		request.setAttribute("questionList", questionList);
		
		return "/product/questionAjax";
	}
	
	@RequestMapping("/like.do")
	public ModelAndView like(ModelAndView mv,HttpServletRequest request) {
		int review_code=Integer.parseInt(request.getParameter("review_code"));
		String member_id=request.getParameter("member_id");
		String like_status=request.getParameter("like_status");
		ProductReviewLike productReviewLike=new ProductReviewLike();
		int result=0;
		int likeOn=0;
		
		Map map = new HashMap();
		map.put("id", member_id);
		map.put("code", review_code);
		
		String check = service.checkLike(map);
		
		productReviewLike.setReview_code(review_code);
		productReviewLike.setMember_id(member_id);
		productReviewLike.setLike_status(like_status);		
			
		if(check==null) {
			result=service.addLike(productReviewLike);
			likeOn=1;
		}else if(check.equals("Y")) {
			result=service.deleteLike(productReviewLike);
			likeOn=2;
		}else if(check.equals("N")) {
			result=service.updateLike(productReviewLike);
			likeOn=3;
		}
		
		mv.addObject("result", result);
		mv.addObject("likeOn", likeOn);
		
		
		mv.setViewName("JsonView");
		return mv;
	}

	
	@RequestMapping("/dislike.do")
	public ModelAndView dislike(ModelAndView mv,HttpServletRequest request) {
		int review_code=Integer.parseInt(request.getParameter("review_code"));
		String member_id=request.getParameter("member_id");
		String like_status=request.getParameter("like_status");
		ProductReviewLike productReviewLike=new ProductReviewLike();
		int result=0;
		int likeOn=0;
		
		System.out.println(review_code);
		System.out.println(member_id);
		System.out.println(like_status);
		
		Map map = new HashMap();
		map.put("id", member_id);
		map.put("code", review_code);
		
		String check = service.checkLike(map);
		
		productReviewLike.setReview_code(review_code);
		productReviewLike.setMember_id(member_id);
		productReviewLike.setLike_status(like_status);		
			
		if(check==null) {
			result=service.addLike(productReviewLike);
			likeOn=1;
		}else if(check.equals("N")) {
			result=service.deleteLike(productReviewLike);
			likeOn=2;
		}else if(check.equals("Y")) {
			result=service.updateLike(productReviewLike);
			likeOn=3;
		}

		mv.addObject("result", result);
		mv.addObject("likeOn", likeOn);
		
		
		mv.setViewName("JsonView");
		return mv;
	}
	
	@RequestMapping("deleteProduct.do")
	public String deleteProduct(HttpServletRequest request,int product_code) {
		System.out.println(product_code);
		int result= service.deleteProduct(product_code); 
		
		if(result > 0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
			
		return "redirect:/product.do";
	}
	
	@RequestMapping("updateProduct.do")
	public String updateProduct(HttpServletRequest request,int product_code) {
		request.setAttribute("product_code", product_code);
		ProductJoinCategory joinCategory=service.selectProduct(product_code);	
		List<ProductImg> imgList=service.selectImgList(product_code);
		List<ProductDetailImg> detailImgList=service.selectDetailImg(product_code);
		List<ProductOption> optionList =service.selectOption(product_code);
		
		request.setAttribute("joinCategory", joinCategory);
		request.setAttribute("imgList", imgList);
		request.setAttribute("detailImgList", detailImgList);
		request.setAttribute("optionList", optionList);
		
		return "/product/updateForm";
	}
	
	@RequestMapping("updateProductEnd.do")
	public ModelAndView updateProductEnd(MultipartHttpServletRequest mtfRequest, HttpServletRequest request,Product product) {

		product.setProduct_code(Integer.parseInt(request.getParameter("product_code")));
		
		
		String[] sizes=request.getParameterValues("size");
		String[] sleft_amounts=request.getParameterValues("left_amount");
		
		List<ProductOption> productOptionList=new ArrayList<ProductOption>();
			int[] left_amounts = new int[sleft_amounts.length];
			
			for(int i=0;i<sleft_amounts.length;i++) {
				int a= Integer.parseInt(sleft_amounts[i]);
				left_amounts[i]=a;
			}
			
			for(int i =0; i<sizes.length;i++) {
				ProductOption productOption = new ProductOption();
				productOption.setLeft_amount(left_amounts[i]);
				productOption.setOption_size(sizes[i]);
				productOptionList.add(productOption);
			}
		
 	
        List<MultipartFile> fileList = mtfRequest.getFiles("file_0");
        String saveDir="";
        File dir=null;
        List<ProductImg> productImgList= new ArrayList<ProductImg>();
        saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/productImg/");
        dir=new File(saveDir);
		if(dir.exists()==false) System.out.println(dir.mkdirs());//폴더생성
		
        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈
            
            String ext=originFileName.substring(originFileName.lastIndexOf(".")+1);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum=(int)(Math.random()*1000);
			String renamedFileName=sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName+="_"+rndNum+"."+ext;

            String safeFile = saveDir + System.currentTimeMillis() + originFileName;
            try {
                mf.transferTo(new File(saveDir+File.separator+renamedFileName));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            
            ProductImg productImg = new ProductImg();
                      
            productImg.setP_img_path(originFileName);
            productImg.setNew_p_img_path(renamedFileName);
            productImg.setP_img_code(Integer.parseInt(request.getParameter("p_img_code")));
            productImgList.add(productImg);
        }
        

        List<MultipartFile> fileList1 = mtfRequest.getFiles("file_1");
        List<ProductDetailImg> productDetailImgList = new ArrayList<ProductDetailImg>();
        saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/productDetailImg/");
        dir=new File(saveDir);
        if(dir.exists()==false) System.out.println(dir.mkdirs());//폴더생성
        
        for (MultipartFile mf : fileList1) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            String ext=originFileName.substring(originFileName.lastIndexOf(".")+1);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum=(int)(Math.random()*1000);
			String renamedFileName=sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName+="_"+rndNum+"."+ext;

            String safeFile = saveDir + System.currentTimeMillis() + originFileName;
            try {
                mf.transferTo(new File(saveDir+File.separator+renamedFileName));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            
            ProductDetailImg productDetailImg = new ProductDetailImg();
                      
            productDetailImg.setP_detail_img_path(originFileName);
            productDetailImg.setNew_p_detail_img_path(renamedFileName);
            productDetailImg.setP_detail_img_code(Integer.parseInt(request.getParameter("p_detail_img_code")));
            productDetailImgList.add(productDetailImg);
        }
        if(product.getReal_size().isEmpty()) {
        	product.setReal_size("상품 상세 정보 확인");
        }
        int result= service.updateProduct(product,productImgList,productDetailImgList,productOptionList);
        ModelAndView mv=new ModelAndView();
        String msg="";
		if(result>0)
		{
			msg="수정을 성공하였습니다.";
		}
		else
		{
			msg="수정을 실패하였습니다.";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", "/product.do");
		
		mv.setViewName("common/msg");	
        return mv;
    } 
	
}
