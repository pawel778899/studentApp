package com.example.studentapp.controller;

import com.example.studentapp.model.Student;
import com.example.studentapp.model.Task;
import com.example.studentapp.service.StudentService;
import com.example.studentapp.service.TaskService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@Controller
public class TasksController {

    private final TaskService taskService;
    private final StudentService studentService;

    public TasksController(TaskService taskService, StudentService studentService) {
        this.taskService = taskService;
        this.studentService = studentService;
    }


    // get all
    @GetMapping("/tasks")
    public String getAllTasks(Model model) {
        List<Task> item = taskService.getTasks();
        model.addAttribute("items", item);
        return "tasks/tasks";
    }

    // only get for save task
    @GetMapping("/addTask")
    public String getAddTask(Model model) {
        List<Student> list = studentService.getStudents();
        model.addAttribute("student", list);
        return "tasks/addTask";
    }

    // save task
    @PostMapping("/addNewTask")
    public RedirectView saveTask(Task newTask) {
        taskService.addTask(newTask);
        return new RedirectView("/tasks");
    }
}
