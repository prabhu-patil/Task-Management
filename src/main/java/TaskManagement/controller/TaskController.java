package TaskManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import TaskManagement.entity.Task;
import TaskManagement.entity.Userss;
import TaskManagement.service.TaskService;
import TaskManagement.service.UserService;
import jakarta.servlet.http.HttpSession;

@Controller
public class TaskController {

	@Autowired
	private TaskService taskService;

	@Autowired
	private UserService userService;

	@GetMapping("/createTask")
	public String createtask() {
		return "task";
	}

	@PostMapping("/saveTask")
	public String saveTask(Task task, Model model, HttpSession session) {
		System.out.println(task.getName() + " " + task.getDuration());
		String email = (String) session.getAttribute("useremail");
		Userss userss = userService.findbyemail(email);
		if (userss != null) {
			task.setUserss(userss);
			Task t1 = taskService.saveTask(task);
			if (t1 != null) {
				return "home";
			} else {
				return "task";
			}
		} else {
			return "login";
		}
	}

	@GetMapping("/viewTasks")
	public String viewTasks(Model model) {
		List<Task> tasks = taskService.getAllTasks();
		model.addAttribute("list", tasks);
		return "viewTasks";
		// check for null if null return home
	}
	
	@PostMapping("/updateTask")
	public String updateTask(Task task) {
	    taskService.saveTask(task);
	    return "redirect:/viewTasks";
	}


	
	@GetMapping("/deleteTask")
	public String deleteTask(@RequestParam("id") Integer id) {
		taskService.deleteTaskById(id);
		return "redirect:/viewTasks";
	}

	
	@GetMapping("/backToHome")
	public String backToHome() {
		return "home";
	}
	
	

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}
}
