package com.example.studentapp.model;


import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private java.util.Date deadline;
    @Column(length = 1100)
    private String description;
    private String color;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private java.util.Date creationDate;


    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student;


    public Task() {
    }

    public Task(Long id, java.util.Date deadline, String description, String color, java.util.Date creationDate, Student student) {
        this.id = id;
        this.deadline = deadline;
        this.description = description;
        this.color = color;
        this.creationDate = creationDate;
        this.student = student;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public java.util.Date getDeadline() {
        return deadline;
    }

    public void setDeadline(java.util.Date deadline) {
        this.deadline = deadline;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public java.util.Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}
