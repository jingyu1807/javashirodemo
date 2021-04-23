package com.yhsx.controller;


import com.alibaba.fastjson.JSONObject;
import com.yhsx.model.School;
import com.yhsx.model.Student;
import com.yhsx.service.StudentService;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("student")
public class StudentController {
       @Autowired
       private StudentService studentService;

       @RequestMapping("queryStudent")
       @RequiresRoles(value={"Admin"}, logical= Logical.AND)
       public JSONObject  queryStudent(Integer page,Integer rows,Student s){
           Integer total = studentService.queryTotal();
           List<Student> student = studentService.queryStudent(page,rows,s);
           JSONObject jsonObject = new JSONObject();
           jsonObject.put("student",student);
           jsonObject.put("total",total);
           return jsonObject;
       }

    @RequestMapping("querySchool")
    public List<School>  querySchool(){

        List<School> school = studentService.querySchool();

        return school;
    }

    @RequestMapping("queryStudentById")
    public Student  queryStudentById(Integer id){

        Student  student = studentService.queryStudentById(id);

        return student;
    }
    @RequiresRoles(value={"Admin"}, logical= Logical.OR)
    @RequestMapping("saveStudent")
    public String  saveStudent(Student student){

        String saveRes = studentService.saveStudent(student);

        return saveRes;
    }

    @RequestMapping("deleteAll")
    @RequiresRoles(value={"Admin"}, logical= Logical.OR)
    public String  deleteAll(String ids){

        String saveRes = studentService.deleteAll(ids);

        return saveRes;
    }





}
