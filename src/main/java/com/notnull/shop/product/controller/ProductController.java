package com.notnull.shop.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.notnull.shop.product.model.service.ProductService;
import com.notnull.shop.product.model.vo.Product;
import com.notnull.shop.product.model.vo.ProductCategory;
import com.notnull.shop.product.model.vo.ProductDetailImg;
import com.notnull.shop.product.model.vo.ProductImg;
import com.notnull.shop.product.model.vo.ProductJoinCategory;
import com.notnull.shop.product.model.vo.ProductListJoin;
import com.notnull.shop.product.model.vo.ProductOption;
import com.notnull.shop.product.model.vo.ProductReview;
import com.notnull.shop.product.model.vo.ProductReviewImg;

@Controller
public class ProductController {

	@Autowired
	private ProductService service;
	
	
	@RequestMapping("/product.do")
	public String selectProductList(Model m) {
		
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
		if(sizes[0].length()>0 && sleft_amounts[0].length()>0) {
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
		String productCode=request.getParameter("productCode");
		ProductJoinCategory joinCategory=service.selectProduct(productCode);
		List<ProductOption> optionList =service.selectOption(productCode);
		model.addAttribute("joinCategory", joinCategory);
		model.addAttribute("optionList", optionList);
		
		List<ProductReview> productReviewList = new ArrayList<ProductReview>();
		productReviewList=service.selectReview();
		request.setAttribute("reviewList", productReviewList);

		return "/product/productView";
	}


	@RequestMapping("/cartView.do")
	public String cartView(Model model,HttpServletRequest request) {
		//String productCode=request.getParameter("productCode");
		return "/product/cartView";
	}
	
	@RequestMapping("/buyForm.do")
	public String buyForm(Model model,HttpServletRequest request) {
		//String productCode=request.getParameter("productCode");
		return "/product/buyForm";
	}

	@RequestMapping("/productReviewInsert.do")
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
		mv.addObject("loc", "/productView.do");
		
		mv.setViewName("common/msg");	
        return mv;
	}

	
	@RequestMapping("/productReviewTest.do")
	public String productReviewTest(Model model,HttpServletRequest request) {
		int product_code=Integer.parseInt(request.getParameter("product_code"));
		request.setAttribute("product_code", product_code);
		
		return "product/productReviewTest";
	}

}
