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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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


@Controller
public class ProductController {

	@Autowired
	private ProductService service;
	
	
	@RequestMapping("/product.do")
	public String selectProductList(Model m ,HttpServletRequest request) {

		
		List<ProductListJoin> list = service.selectProductList();
		m.addAttribute("list",list);
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
	
	@RequestMapping("/productView.do")
	public String productView(Model model,HttpServletRequest request) {
		int productCode=Integer.parseInt(request.getParameter("productCode"));
		ProductJoinCategory joinCategory=service.selectProduct(productCode);
		List<ProductOption> optionList =service.selectOption(productCode);
		List<ProductReviewImgJoin> reviewImgList=service.selectReviewImg(productCode);
		List<ProductDetailImg> detailImgList=service.selectDetailImg(productCode);
		List<ProductImg> imgList=service.selectImgList(productCode);
		


		model.addAttribute("joinCategory", joinCategory);
		model.addAttribute("optionList", optionList);
		model.addAttribute("reviewImgList",reviewImgList);
		model.addAttribute("detailImgList",detailImgList);
		model.addAttribute("imgList",imgList);
		
		List<ProductReview> productReviewList = new ArrayList<ProductReview>();
		
		productReviewList=service.selectReview(productCode);
		
		request.setAttribute("reviewList", productReviewList);
		
		//문의사항
		List<ProductQuestion> questionList=service.selectQuestion(productCode);
		
		request.setAttribute("questionList", questionList);
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
		
		ProductJoinOption productJoinOption=service.selectProductJoinOption(product_option_code);
		model.addAttribute("productJoinOption",productJoinOption);
		model.addAttribute("quantity",quantity);
		return "/product/buyForm";
	}
	
	@RequestMapping("/buyForm2.do")
	public String buyForm2(Model model,HttpServletRequest request) {
		String[] cart_codes=request.getParameterValues("check");
		List<CartJoinList> cartList=service.selectCartList(cart_codes);
		model.addAttribute("cartList",cartList);
		return "/product/buyForm";
	}
	
	@RequestMapping("/buyEnd.do")
	public String buyEnd(BuyInfo buyInfo,Model model,HttpServletRequest request) {
		String[] product_option_codes = request.getParameterValues("product_option_code");
		String[] buy_quantitys = request.getParameterValues("buy_quantity");
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
			buyList.add(buyInfo2);
		}
		//int result=service.insertBuyList(buyList);
		
		int last_price=Integer.parseInt(request.getParameter("last_price"));
		int point=Integer.parseInt(request.getParameter("point"));
		PointLog pointLog = new PointLog(0,buyInfo.getMember_id(),point,null);
		//int result2=service.insertPoint(pointLog);
		return "/product/buyEnd";
	}
	
	@RequestMapping(value="/productReviewInsert.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView reviewInsert(Model model,MultipartHttpServletRequest mtfRequest,HttpServletRequest request,ProductReview productReview ) {
	    String saveDir="";
        File dir=null;
	    List<MultipartFile> fileList1 = mtfRequest.getFiles("file_1");
        List<ProductReviewImg> productReviewImgList = new ArrayList<ProductReviewImg>();
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
        
        System.out.println(productReview);
		int result=service.reviewInsert(productReview,productReviewImgList);
		
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

	
	@RequestMapping("/productReviewTest.do")
	public String productReviewTest(Model model,HttpServletRequest request) {
		int product_code=Integer.parseInt(request.getParameter("product_code"));
		request.setAttribute("product_code", product_code);
	
		return "product/productReviewTest";
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
	public String addQuestion(Model model,HttpServletRequest request,ProductQuestion productQuestion) {
		int productCode=Integer.parseInt(request.getParameter("productCode"));
		
		System.out.println(productQuestion);
		int result=service.addQuestion(productQuestion);
		System.out.println(result);
		request.setAttribute("productCode", productCode);
		
		String re = "redirect:/productView.do"+"?productCode="+productCode;

		return re;
		
	}
	

}
