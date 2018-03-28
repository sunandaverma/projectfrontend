package com.niit.controller;


import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDao;
import com.niit.dao.ProductDao;
import com.niit.dao.SupplierDao;
import com.niit.dao.UserDao;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;
import com.niit.model.User;



@Controller
public class IndexController {
	@Autowired
	UserDao userDao;
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	SupplierDao supplierDao;
	@Autowired
	ProductDao productDao;

	
	@RequestMapping(value="index") 
	public String index(Model model) { 
		model.addAttribute("category", new Category()); 
		model.addAttribute("supplier", new Supplier()); 
		model.addAttribute("product", new Product()); 
		
		model.addAttribute("supplist", supplierDao.retrieve());
		model.addAttribute("catlist", categoryDao.retrieve());
		model.addAttribute("prodList", productDao.retrieve());
		return "index"; 
	}
	
	
	@RequestMapping(value="/") 
	public String home(Model model) { 
		model.addAttribute("category", new Category()); 
		model.addAttribute("supplier", new Supplier()); 
		model.addAttribute("product", new Product()); 
		
		model.addAttribute("supplist", supplierDao.retrieve());
		model.addAttribute("catlist", categoryDao.retrieve());
		model.addAttribute("prodList", productDao.retrieve());
		return "index"; 
	}
	
	
	
	
	@RequestMapping(value="/goToRegister", method=RequestMethod.GET)
	public ModelAndView showRegister()
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("catlist", categoryDao.retrieve());
	
		return new ModelAndView("register");
	}
	
	@RequestMapping("/goToLogin")
	public ModelAndView login()
	{
		return new ModelAndView("login");
	}

	@RequestMapping("/about")
	public ModelAndView about()
	{
		return new ModelAndView("about");
	}
	@RequestMapping("/contact")
	public ModelAndView contact()
	{
		return new ModelAndView("contact");
	}
	
	@RequestMapping("login")
	public ModelAndView login(@RequestParam(value="id",required=false) String id)
	{	ModelAndView m=new ModelAndView("index");
		if(id!=null){
		if(id.equals("1"))
			m.addObject("msg","Invalid Username or Password");
		else if(id.equals("2"))
			m.addObject("msg","You've been logged out");
		else if(id.equals("3"))
			m.addObject("msg","Your Account has been Deactivated");		
		}
		return m;	
	}
	
	@RequestMapping(value="/login_success",method=RequestMethod.POST)
	public String loginsuccess(HttpSession session)
	{ 
		String username= SecurityContextHolder.getContext().getAuthentication().getName();
		session.setAttribute("username",username);
		session.setAttribute("usertitle",username.charAt(0));
		session.setAttribute("loggedIn",true);
		@SuppressWarnings("unchecked")
		Collection<GrantedAuthority> authorities =(Collection<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		
		for(GrantedAuthority role:authorities)
		{
			System.out.println("Role:"+role.getAuthority()+"username"+username);
			
			if(role.getAuthority().equals("ROLE_ADMIN"))
				session.setAttribute("user",null);
			else
				session.setAttribute("user","user");
			}
		return "redirect:index";
	}

	
	
	@RequestMapping(value="/addUserDetails",method=RequestMethod.POST)
	public ModelAndView addProduct(@RequestParam Map<String,String> user,@RequestParam("mobile") String mobile)
	{	ModelAndView m=new ModelAndView();
		User userDetails=userDao.getUser(user.get("username"));
		
		if(userDetails!=null&&userDetails.isEnabled()==true){
		m.addObject("userExist","Username Already Exist");
		m.setViewName("Register");
		}
		
		else{
		userDetails =new User();
		userDetails.setAddress(user.get("address"));
		userDetails.setEmail(user.get("email"));
		userDetails.setName(user.get("username"));
		userDetails.setPassword(user.get("password"));
		userDetails.setPhone(mobile);
		userDetails.setEnabled(true);
		userDetails.setRole("ROLE_USER");
		userDao.insertOrUpdateUser(userDetails);
		m.addObject("userCreate","Account Created");
		m.setViewName("index");
		}
		return m;
	}
	
	
	
	
	@RequestMapping("/userLogged")
	public String userLogged()
	{
		return "redirect:/index";
	}
	
	@RequestMapping("/error")
	public String userError()
	{
		return "/error";
	}
	
	@RequestMapping("/reLogin")
	public String reLogin()
	{
		return "redirect:/goToLogin";
	}
	
	@RequestMapping("/viewProducts/{cid}")
	public ModelAndView showProducts(@PathVariable("cid") int cid)
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("prodList", productDao.getProductByCatID(cid));
		mv.addObject("catlist", categoryDao.retrieve());
		mv.setViewName("productCustList");
		return mv; 
	}
	

@RequestMapping("/productDetailsByPid/{pid}")
			public ModelAndView showProductdetails(@PathVariable("pid") int pid)
			{
				ModelAndView mv = new ModelAndView();
				mv.addObject("prod", productDao.findByPID(pid));
				mv.addObject("catlist", categoryDao.retrieve());
				mv.setViewName("prodDetails");   // jsp page in views 
				return mv; 
			}
	
@RequestMapping(value="/productCustList") 
public ModelAndView showProductCustList()
{
	ModelAndView mv = new ModelAndView();
	mv.addObject("category", new Category());
	mv.addObject("supplier", new Supplier());
	
	mv.addObject("prodList", productDao.retrieve());
	mv.setViewName("productCustList");  // jsp page in views 
	return mv;
}
	
	
}
