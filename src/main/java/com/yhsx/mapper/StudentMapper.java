package com.yhsx.mapper;

import com.yhsx.model.School;
import com.yhsx.model.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    List<Student> queryStudent(@Param("pageNumber") Integer pageNumber,@Param("pageSize")Integer pageSize,@Param("s") Student s);

    Integer queryTotal();

    List<School> querySchool();

    void saveStudent(Student student);

    Student queryStudentById(Integer id);

    void updateStudent(Student student);

    void deleteAll(String ids);

    Student queryStudentByName(String sname);
}
