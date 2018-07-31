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
import com.notnull.shop.product.model.vo.ProductListJoin;
import com.notnull.shop.product.model.vo.ProductOption;

@Controller
public class ProductController {

	@Autowired
	private ProductService service;
	
	
	@RequestMapping("/product.do")
	public String selectProductList(Model m) {
		
		List<ProductListJoin> list = service.selectProductList();
		System.out.println(list);
		m.addAttribute("list",list);	
		return "/product/shop";
	}
	
	
	@RequestMapping("/productupload.do")
	public String fileUpload(Model model) {
		
		List<ProductCategory> categoryList=new ArrayList<ProductCategory>();
		categoryList=service.selectCategoryList();
		
		System.out.println(categoryList);
		model.addAttribute("categoryList",categoryList);
		
		return "/product/uploadForm";
	}
	
	
	
	@RequestMapping("/upload.do")
    public ModelAndView requestupload2(MultipartHttpServletRequest mtfRequest, HttpServletRequest request,Product product) {

		
	
		String[] sizes=request.getParameterValues("size");
		String[] sleft_amounts=request.getParameterValues("left_amount");
		
		
		int[] left_amounts = new int[sleft_amounts.length];
		
		for(int i=0;i<sleft_amounts.length;i++) {
			int a= Integer.parseInt(sleft_amounts[i]);
			left_amounts[i]=a;
		}
		
		List<ProductOption> productOptionList= new ArrayList<ProductOption>();
		for(int i =0; i<sizes.length;i++) {
			ProductOption productOption = new ProductOption();
			productOption.setLeft_amount(left_amounts[i]);
			productOption.setOption_size(sizes[i]);
			productOptionList.add(productOption);
		}
		
		
		
 		
		List<MultipartFile> fileList = mtfRequest.getFiles("file_0");	//상품 사진
		List<MultipartFile> fileList1 = mtfRequest.getFiles("file_1");	//상품 상세 사진

       
        List<ProductImg> productImgList= new ArrayList<ProductImg>();
        List<ProductDetailImg> productDetailImgList = new ArrayList<ProductDetailImg>();
        String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/productImg/");
        File dir=new File(saveDir);
		if(dir.exists()==false) System.out.println(dir.mkdirs());//폴더생성
		

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            String ext=originFileName.substring(originFileName.lastIndexOf(".")+1);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum=(int)(Math.random()*1000);
			String renamedFileName=sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName+="_"+rndNum+"."+ext;
            
            System.out.println("originFileName : " + originFileName);
            System.out.println("renamedFileName : " + renamedFileName);
            System.out.println("fileSize : " + fileSize);

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
            
            System.out.println("originFileName : " + originFileName);
            System.out.println("renamedFileName : " + renamedFileName);
            System.out.println("fileSize : " + fileSize);

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
		Product product=service.selectProduct(productCode);
		model.addAttribute("product", product);
		return "/product/productView";
	}


}