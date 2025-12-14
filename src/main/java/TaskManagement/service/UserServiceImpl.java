package TaskManagement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import TaskManagement.entity.Userss;
import TaskManagement.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository repository;

	@Override
	public Userss saveUsers(Userss userss) {
		return repository.save(userss);
	}

	@Override
	public Userss findbyemail(String email) {
		return repository.findByEmail(email);
	}
}
