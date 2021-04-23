package com.yhsx.service;

import com.yhsx.model.School;
import com.yhsx.model.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentService {
    List<Student> queryStudent(Integer pageNumber,Integer pageSize,Student s);

    Integer queryTotal();

    List<School> querySchool();

    String saveStudent(Student student);

    Student queryStudentById(Integer id);

    String deleteAll(String ids);
}
