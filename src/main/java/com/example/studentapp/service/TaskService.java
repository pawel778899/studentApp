package com.example.studentapp.service;

import com.example.studentapp.model.Task;
import com.example.studentapp.repository.TaskRepository;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class TaskService {

    private TaskRepository taskRepository;

    public TaskService(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    public void addTask(Task task) {
        taskRepository.save(task);
    }

    public List<Task> getTasks() {
        return taskRepository.findAll();
    }


    public Task findTaskById(Long id) {
        return taskRepository.findById(id).orElse(null);
    }


    public void editTask(Task edit) {
        taskRepository.save(edit);
    }

    public void removeTask(Long id){
        taskRepository.deleteById(id);
        System.out.println("deleting task on  id" + id);
    }



}
