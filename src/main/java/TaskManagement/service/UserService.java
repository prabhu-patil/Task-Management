package TaskManagement.service;

import org.springframework.stereotype.Service;

import TaskManagement.entity.Userss;

@Service
public interface UserService {
	Userss saveUsers(Userss userss);

	Userss findbyemail(String email);
}
