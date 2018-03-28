package com.niit.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDao;
import com.niit.dao.ProductDao;
import com.niit.dao.SupplierDao;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	CategoryDao categoryDao;
	@Autowired
	SupplierDao supplierDao;
	@Autowired
	ProductDao productDao;
	
	
	@RequestMapping(value="adding") 
	public String displayLogin(Model model) { 
		model.addAttribute("category", new Category()); 
		model.addAttribute("supplier", new Supplier()); 
		model.addAttribute("product", new Product()); 
		
		model.addAttribute("supplist", supplierDao.retrieve());
		model.addAttribute("catlist", categoryDao.retrieve());
		model.addAttribute("prodList", productDao.retrieve());
		return "adding"; 
	}
	
	@RequestMapping(value="/saveCategory", method=RequestMethod.POST)
	public ModelAndView saveCategory(@ModelAttribute("category")Category category, BindingResult result, Model model)
	{
		ModelAndView mv = new ModelAndView();
		model.addAttribute("category", new Category()); 
		model.addAttribute("supplier", new Supplier()); 
		model.addAttribute("product", new Product()); 
		model.addAttribute("catlist", categoryDao.retrieve());
		//categoryDao.getCategoryDetails();
		categoryDao.insertOrUpdateCategory(category);
		mv.setViewName("adding");
		return mv;
	}
	
	@RequestMapping(value="/saveSupplier", method=RequestMethod.POST)
	public ModelAndView saveSupplier(@ModelAttribute("supplier")Supplier supplier, BindingResult result, Model model)
	{
		ModelAndView mv = new ModelAndView();
		model.addAttribute("category", new Category()); 
		model.addAttribute("supplier", new Supplier()); 
		model.addAttribute("product", new Product()); 
		model.addAttribute("catlist", categoryDao.retrieve());
		supplierDao.insertOrUpdateSupplier(supplier);
		mv.setViewName("adding");
		return mv;
	}
	
	@RequestMapping(value="/saveProduct", method=RequestMethod.POST)
	public ModelAndView saveProduct(@ModelAttribute("product")Product product, @RequestParam("pro_image")MultipartFile pro_image, BindingResult result, HttpServletRequest request, Model model)
	{
		System.out.println("Save Product");
		ModelAndView mv = new ModelAndView();
		model.addAttribute("category", new Category()); 
		model.addAttribute("supplier", new Supplier()); 
		model.addAttribute("product", new Product()); 
		model.addAttribute("catlist", categoryDao.retrieve());
		 String filepath = request.getSession().getServletContext().getRealPath("/");
	    //String filepath= "K:\\eclipse-workspace\\engineeric1\\src\\main\\webapp";
		String filename = pro_image.getOriginalFilename();
		product.setPro_imagename(filename);
		productDao.insertOrUpdateProduct(product);
		System.out.println("File Path"+filepath);
		try 
		{
			byte imagebyte[] = pro_image.getBytes();
			BufferedOutputStream fos = new BufferedOutputStream(new FileOutputStream(filepath+"/resources/"+filename));
			System.out.println(fos);
			fos.write(imagebyte);
			fos.close();
		}catch(IOException e)
		{ 
			e.printStackTrace();
		}
		mv.setViewName("adding");
		return mv;
	}
	
	
	@RequestMapping("productAdminList")
	public ModelAndView showAdminList()
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("category", new Category());
		mv.addObject("supplier", new Supplier());
		mv.addObject("catlist", categoryDao.retrieve());
		
		mv.addObject("prodList", productDao.retrieve());
		mv.setViewName("productAdminList");
		return mv;
	}
	@RequestMapping("catAdminList")
	public ModelAndView showCatAdminList()
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("catlist", categoryDao.retrieve());
		mv.setViewName("catAdminList");
		return mv;
	}
	@RequestMapping("suppAdminList")
	public ModelAndView showSuppAdminList()
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("supplist", supplierDao.retrieve());
		mv.addObject("catlist", categoryDao.retrieve());
		mv.setViewName("suppAdminList");
		return mv;
	}
	
	
/*	@RequestMapping("/viewProducts/{cid}")
	public ModelAndView showProducts(@PathVariable("cid") int cid)
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("prodList", productDao.getProductByCatID(cid));
		mv.setViewName("productCustList");
		return mv; 
	}
	*/
	
	
	@RequestMapping("updateProd")
	public ModelAndView updateProduct(@RequestParam("pro_id") int pro_id)
	{
		ModelAndView mv = new ModelAndView();
		Product p = productDao.findByPID(pro_id);
		mv.addObject("prod",p);
		mv.addObject("catlist", categoryDao.retrieve());
		mv.addObject("supplist", supplierDao.retrieve());
		mv.setViewName("updateProduct");
		return mv;
	}
	
	@RequestMapping(value="/productUpdate", method=RequestMethod.POST)
	public String productUpdate(@RequestParam("pro_id")int pro_id,@RequestParam("pro_name")String pro_name,@RequestParam("pro_description")String pro_description,@RequestParam("pro_stock")int pro_stock,@RequestParam("pro_price")int pro_price,@RequestParam("pro_image")MultipartFile pro_image, HttpServletRequest request, Model model)
	{
		System.out.println("Save Product");
		
		Product product = new Product();
		model.addAttribute("category", new Category()); 
		model.addAttribute("supplier", new Supplier()); 
		model.addAttribute("product", new Product()); 
		model.addAttribute("catlist", categoryDao.retrieve());
		 String filepath = request.getSession().getServletContext().getRealPath("/");
		String filename = pro_image.getOriginalFilename();
		product.setPro_imagename(filename);
		product.setPro_name(request.getParameter("pro_name"));
		product.setPro_price(Integer.parseInt(request.getParameter("pro_price")));
		product.setPro_description(request.getParameter("pro_description"));
		product.setPro_stock(Integer.parseInt(request.getParameter("pro_stock")));
		product.setPro_category(categoryDao.getCategory(Integer.parseInt(request.getParameter("pro_category"))));
		product.setPro_supplier(supplierDao.getSupplier(Integer.parseInt(request.getParameter("pro_supplier"))));
		product.setPro_id(Integer.parseInt(request.getParameter("pro_id")));
		productDao.insertOrUpdateProduct(product);
		System.out.println("File Path"+filepath);
		try 
		{
			byte imagebyte[] = pro_image.getBytes();
			BufferedOutputStream fos = new BufferedOutputStream(new FileOutputStream(filepath+"/resources/"+filename));
			System.out.println(fos);
			fos.write(imagebyte);
			fos.close();
		}catch(IOException e)
		{ 
			e.printStackTrace();
		}
		
		return "redirect:/admin/productAdminList?update";
	}
	
	@RequestMapping("/deleteProd/{pro_id}")
	public String deleteProduct(@PathVariable("pro_id")int pro_id)
	{
		
		
		productDao.deleteProd(pro_id);
		
		return "redirect:/admin/productAdminList?del";
	}
	
	@RequestMapping("updateCat")
	public ModelAndView updateCategory(@RequestParam("cat_id") int cat_id)
	{
		ModelAndView mv = new ModelAndView();
		Category c = categoryDao.getCategory(cat_id);
		mv.addObject("catlist", categoryDao.retrieve());
		mv.addObject("cat",c);
		mv.setViewName("updateCategory");
		return mv;
	}
	
	@RequestMapping(value="/categoryUpdate", method=RequestMethod.POST)
	public String categoryUpdate(@RequestParam("cat_id")int cat_id, @RequestParam("cat_name")String cat_name, @RequestParam("cat_desc")String cat_desc,Model model)
	{
		Category category = new Category();
		category.setCat_name(cat_name);
		category.setCat_desc(cat_desc);
		category.setCat_id(cat_id);
		model.addAttribute("catlist", categoryDao.retrieve());
		categoryDao.insertOrUpdateCategory(category);
		return "redirect:/admin/catAdminList?update";
	}
	
	@RequestMapping("/deleteCat/{cat_id}")
	public String deleteCategory(@PathVariable("cat_id")int cat_id)
	{
		
		
		categoryDao.deleteCat(cat_id);
		
		return "redirect:/admin/catAdminList?del";
	}
	
	@RequestMapping("updateSupp")
	public ModelAndView updateSupplier(@RequestParam("supp_id") int supp_id)
	{
		ModelAndView mv = new ModelAndView();
		Supplier s = supplierDao.getSupplier(supp_id);
		mv.addObject("catlist", categoryDao.retrieve());
		mv.addObject("supp",s);
		mv.setViewName("updateSupplier");
		return mv;
	}
	
	@RequestMapping(value="/supplierUpdate", method=RequestMethod.POST)
	public String productUpdate(@RequestParam("supp_id")int supp_id, @RequestParam("supp_name")String supp_name, @RequestParam("supp_address")String supp_address,Model model)
	{
		Supplier supplier = new Supplier();
		supplier.setSupp_name(supp_name);
		supplier.setSupp_address(supp_address);
		supplier.setSupp_id(supp_id);
		model.addAttribute("catlist", categoryDao.retrieve());
		supplierDao.insertOrUpdateSupplier(supplier);
		return "redirect:/admin/suppAdminList?update";
	}
	
	@RequestMapping("/deleteSupp/{supp_id}")
	public String deleteSupplier(@PathVariable("supp_id")int supp_id)
	{
		
		
		supplierDao.deleteSupp(supp_id);
		
		return "redirect:/admin/suppAdminList?del";
	}
	
	/*public LinkedHashMap<Integer ,String> getSupList()
	{
		List<Supplier> supp_list = supplierDao.getSupplierDetails();
		LinkedHashMap<Integer , String> supplist = new LinkedHashMap<Integer, String>();
		for(Supplier supp:supp_list)
		{
			supplist.put(supp.getSupp_id(), supp.getSupp_name());
		}
		return supplist;
		
	}
	
	public LinkedHashMap<Integer, String> getCatList()
	{
		List<Category> cat_list = categoryDao.getCategoryDetails();
		LinkedHashMap<Integer, String> catlist = new LinkedHashMap<Integer, String>();
		for(Category cat:cat_list)
		{
			catlist.put(cat.getCat_id(), cat.getCat_name());
		}
		return catlist;
	}
	*/
	
	
	
}
