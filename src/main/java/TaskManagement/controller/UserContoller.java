package TaskManagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import TaskManagement.entity.LoginUser;
import TaskManagement.entity.Userss;
import TaskManagement.service.UserService;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserContoller {

	@Autowired
	private UserService service;

	@GetMapping("/")
	public String register() {
		// return register page
		return "register";
	}

	@PostMapping("/createuser")
	public String createuser(Userss user, Model model) {
		System.out.println(user);
		// save user data in DB
		Userss save = service.saveUsers(user);
		if (save != null) {
			model.addAttribute("msg", "REGISTRATION SUCCESS");
			return "login";
		} else {
			model.addAttribute("msg", "LOGIN FAILED!!");
			return "register";
		}
	}

	@PostMapping("/login")
	public String loginn(LoginUser loginuser, Model model, HttpSession httpSession) {

		Userss userss = service.findbyemail(loginuser.getEmail());
		if (userss != null) {
			model.addAttribute("msg", "LOGIN SUCCESS");
			httpSession.setAttribute("useremail", loginuser.getEmail());

			return "home";
		} else {
			model.addAttribute("msg", "LOGIN FAILED!!");
			return "login";
		}
	}
}
