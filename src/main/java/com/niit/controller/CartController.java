package com.niit.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CartDao;
import com.niit.dao.CategoryDao;
import com.niit.dao.OrderDetailsDao;
import com.niit.dao.ProductDao;
import com.niit.dao.SupplierDao;
import com.niit.dao.UserDao;
import com.niit.model.Cart;
import com.niit.model.OrderDetails;
import com.niit.model.Product;
import com.niit.model.User;

@ComponentScan(basePackages = "com.niit.*")
@Controller
public class CartController
{

	@Autowired
	CategoryDao categoryDao;
	@Autowired
	SupplierDao supplierDao;
	@Autowired
	ProductDao productDao;		
	@Autowired
	CartDao cartDao;
	@Autowired
	OrderDetailsDao orderDetailsDao;
	@Autowired
	UserDao userDao;
	
	
	
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public ModelAndView goTocart(HttpServletRequest request)
	{
		
		ModelAndView mv = new ModelAndView();
		Principal principal= request.getUserPrincipal();
		String userEmail=principal.getName();
		mv.addObject("cartInfo",cartDao.findByCartId(userEmail));
		mv.setViewName("cart");
		return mv;
	}
	
	
	
	@RequestMapping(value="/prodDetails/${p.pro_id}", method=RequestMethod.POST)
	public ModelAndView prodDetails(@PathVariable("pro_id")int pro_id)
	{
		
		ModelAndView mv = new ModelAndView();
		Product prod=productDao.findByPID(pro_id);
		mv.addObject("prod",prod);
		mv.setViewName("prodDetails");
		return mv;
	}
	
	@RequestMapping(value="/addToCart", method=RequestMethod.POST)
	public ModelAndView addtocart(HttpServletRequest request)
	{
		
		ModelAndView mv = new ModelAndView();
		Principal principal= request.getUserPrincipal();
		String userEmail=principal.getName();
		//String userEmail =request.getRemoteUser();
		System.out.println(userEmail);
		try
		{
			int pro_id = Integer.parseInt(request.getParameter("pro_id"));
			Double pro_price= Double.parseDouble(request.getParameter("pro_price"));
			int qty = Integer.parseInt(request.getParameter("pQty"));
			String pro_name = request.getParameter("pro_name");
			String pro_imagename = request.getParameter("pro_imagename");
			System.out.println("Step2");
			List <Cart> cartExist = cartDao.findByCartId(userEmail);
			if(cartExist.isEmpty() == true)
			{
				System.out.println("Step3");
				Cart cm = new Cart();
				cm.setCartPrice(pro_price);
				cm.setCartProductId(pro_id);
				cm.setCartStock(qty);
				cm.setCartImage(pro_imagename);
				cm.setCartProductName(pro_name);
				
				User u=userDao.getUser(userEmail);
				cm.setCartUserDetails(u);
				cartDao.insertCart(cm);	
			}
			else if(cartExist != null)
			{
				System.out.println("Step4");
				for (Cart cart:cartExist)
				{
					System.out.println("Step5");
				
					if(cart.getCartProductId()==pro_id)
					{
						Cart cm= new Cart();
						cm.setCartId(cart.getCartId());
						cm.setCartPrice(pro_price);
						cm.setCartProductId(pro_id);
						cm.setCartStock(cart.getCartStock()+qty);
						cm.setCartImage(pro_imagename);
						cm.setCartProductName(pro_name);
						
						User u=userDao.getUser(userEmail);
						cm.setCartUserDetails(u);
						cartDao.updateCart(cm);
						//break;
					}
					
					else if(cart.getCartProductId()!=pro_id)
					{
						Cart cm = new Cart();
						cm.setCartPrice(pro_price);
						cm.setCartProductId(pro_id);
						cm.setCartStock(qty);
						cm.setCartImage(pro_imagename);
						cm.setCartProductName(pro_name);
						
						User u=userDao.getUser(userEmail);
						cm.setCartUserDetails(u);
						cartDao.insertCart(cm);	
						break;
					}
					
					
				}
			}
			System.out.println("Step6");
			mv.addObject("cartInfo",cartDao.findByCartId(userEmail));
			mv.setViewName("cart");
			return mv;	
		}
		catch(Exception e)
		{
			e.printStackTrace();
			mv.addObject("cartInfo", cartDao.findByCartId(userEmail));
			mv.setViewName("cart");
			return mv;	
		}
	}
	
	@RequestMapping(value="/checkout", method=RequestMethod.GET)
	public ModelAndView checkout(HttpServletRequest request)
	{
		
		ModelAndView mv = new ModelAndView();
		Principal principal= request.getUserPrincipal();
		String userEmail=principal.getName();
		User u=userDao.getUser(userEmail);
		List<Cart> cart=cartDao.findByCartId(userEmail);
		mv.addObject("user",u);
		mv.addObject("cart",cart);
		return mv;
		
	}
	
	@RequestMapping(value="/Orderprocess", method=RequestMethod.POST)
	public ModelAndView orderProcess(HttpServletRequest request)
	{
		
		ModelAndView mv = new ModelAndView();
		OrderDetails order= new OrderDetails();
		Principal principal= request.getUserPrincipal();
		String userEmail=principal.getName();
		Double total=Double.parseDouble(request.getParameter("total"));
		String payment=request.getParameter("payment");
		User u=userDao.getUser(userEmail);
		order.setUser(u);
		order.setTotal(total);
		order.setPayment(payment);
		orderDetailsDao.insertOrderDetails(order);
		mv.addObject("orderDetails",u);
		mv.setViewName("ack");
		return mv;
		
	}
	
	@RequestMapping("/ack")
	public String ack()
	{
		return "ack";
	}
	
	@RequestMapping(value="/deletePCart/{cartId}")
	public ModelAndView deleteCartItem(@PathVariable("cartId") int cartId,HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		Principal principal= request.getUserPrincipal();
		String userEmail=principal.getName();
		cartDao.deleteCart(cartId);
		mv.addObject("cartInfo", cartDao.findByCartId(userEmail));
		mv.setViewName("cart");
		return mv;	
		
	}
}
