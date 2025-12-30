package TaskManagement.service;

import java.util.List;

import org.springframework.stereotype.Service;

import TaskManagement.entity.Task;

@Service
public interface TaskService {

	Task saveTask(Task task);

	List<Task> getAllTasks();
	
	Task getTaskById(Integer id);
	
	void deleteTaskById(Integer id);

	
	
}
