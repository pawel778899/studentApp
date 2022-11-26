package com.example.studentapp.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Set;

@Entity(name="STUDENTS")
@Data
@NoArgsConstructor
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
//    @NotEmpty  //nie zapisze bedzie warning
    private String firstName;
    private String lastName;
    private String gitHub;
    private String start;

    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL)
    private Set<Task> tasks;


    public Student(String firstName, String lastName, String gitHub, String start, Set<Task> tasks) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.gitHub = gitHub;
        this.start = start;
        this.tasks = tasks;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGitHub() {
        return gitHub;
    }

    public void setGitHub(String gitHub) {
        this.gitHub = gitHub;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }
}
