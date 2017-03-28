package com.interview.users.controller;

import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.interview.users.domain.User;
import com.interview.users.service.UserService;


@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		return "join";
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String view(Model model, HttpSession session) {
		
		User userSession = (User)LoginUtil.getUserFromSession(session);
		if ( userSession != null ) {
			User user = userService.getUser(userSession.getIdx());
			model.addAttribute("users", user);    
		} else {
			
		}
		return "view";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(){
		return "index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam String userId, String password, HttpSession session, Model model){
		User user = userService.getUser(userId, password);
		
		if ( user != null  ) {
			session.setAttribute(LoginUtil.USER_SESSION_KEY, user);
			model.addAttribute("users", user); 
			return "redirect:/profile";
		} else {
			model.addAttribute("loginFailed", true); 
			return "redirect:/index";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) throws Exception {
        session.removeAttribute(LoginUtil.USER_SESSION_KEY);
        return "redirect:/index";
    }
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(@RequestParam int idx, String userId, String name, String email, String password, HttpSession session, Model model){
		User user = new User();
		user.setIdx(idx);
		user.setUserId(userId);
		user.setPassword(password);
		user.setName(name);
		user.setEmail(email);
		
		if ( LoginUtil.isSameUser(session, user) ) {
			userService.updateUser(user);
			model.addAttribute("users", user); 
		} else {
			throw new IllegalStateException("You can't modify the others information.");
		}
		
		return "redirect:/profile";
		
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(@RequestParam String userId, String password, String name, String email, Model model){
		User user = new User();
		user.setUserId(userId);
		user.setPassword(password);
		user.setName(name);
		user.setEmail(email);
		
		userService.insertUser(user);
	
		return "redirect:/index";
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(HttpSession session, Model model){
		
		User userSession = (User)LoginUtil.getUserFromSession(session);
		
		if ( userSession != null ) {
			userService.deleteUser(userSession);
			return "redirect:/logout";
		} else {
			throw new IllegalStateException("You can't delete the others information.");
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public  Object check(String userId, Model model){
		User user = userService.getUser(userId);
		
		HashMap map = new HashMap();
		if ( user != null ) {
			map.put("exist", true);
		} else {
			map.put("exist", false);
		}
		return map;
	}
	
}
