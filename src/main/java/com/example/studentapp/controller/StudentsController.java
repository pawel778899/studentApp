package com.example.studentapp.controller;

import com.example.studentapp.model.Student;
import com.example.studentapp.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@Controller
public class StudentsController {

    private final StudentService studentService;

    public StudentsController(StudentService studentService) {
        this.studentService = studentService;
    }


    @GetMapping("/students")
    public String getStudentsList(Model model) {
        List<Student> studentList = studentService.getStudents();
        model.addAttribute("student", studentList);
        return "persons/personList";
    }

    //do zapisu
    //save student
    @PostMapping("/addStudent")
    public RedirectView postAddStudent(Student student) { //walidacja
        studentService.addStudent(student);
        return new RedirectView("/students");
    }

    //tylko do wczytania widoku
    //only get for save student
    @GetMapping("/addStudent")
    public String getAddStudent() {
        return "persons/addNewPerson";
    }

    @GetMapping("/editStudent/{id}")
    public String getEditStudent(@PathVariable("id") Long id, Model model) {
        Student student= studentService.findStudentById(id);
        model.addAttribute("student", student);
        return "persons/editPerson";
    }

    //save student
    @PostMapping("/addStudent/{id}")
    public RedirectView postEditStudent(@PathVariable("id") Long id, Student editStudent) {
        studentService.editStudent(editStudent);
//        return new RedirectView("/editStudent/{id}");
        return new RedirectView("/students");
    }
    @PostMapping("/editStudent/{id}")
    public RedirectView removeStudent(@PathVariable("id") Long id){
        studentService.removeStudent(id);
        return new RedirectView("/students");
    }
}
