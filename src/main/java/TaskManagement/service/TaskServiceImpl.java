package TaskManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import TaskManagement.entity.Task;
import TaskManagement.repository.TaskRepository;

@Service
public class TaskServiceImpl implements TaskService {

	@Autowired
	private TaskRepository repository;

	@Override
	public Task saveTask(Task task) {
		return repository.save(task);
	}

	@Override
	public List<Task> getAllTasks() {
		return repository.findAll();
	}
	
	@Override
	public Task getTaskById(Integer id) {
		return repository.findById(id).orElse(null);
	}

	@Override
	public void deleteTaskById(Integer id) {
		repository.deleteById(id);
	}

}
