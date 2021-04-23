package com.yhsx.service.impl;

import com.yhsx.mapper.StudentMapper;
import com.yhsx.model.School;
import com.yhsx.model.Student;
import com.yhsx.service.StudentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;
    private static final Logger LOG = LoggerFactory.getLogger(UserServiceImpl.class);


    @Override
    public List<Student> queryStudent(Integer pageNumber, Integer pageSize, Student s) {
        try {
            pageNumber=(pageNumber-1)*pageSize;
            List<Student> students =studentMapper.queryStudent(pageNumber,pageSize,s);
            return students;
        }catch (Exception e){
            LOG.info("查询学生信息失败"+e);
            return null;
        }


    }

    @Override
    public Integer queryTotal() {
        return studentMapper.queryTotal();
    }

    @Override
    public List<School> querySchool() {
        return studentMapper.querySchool();
    }

    @Override
    public String saveStudent(Student student) {

        try {
            if(student.getId()!=null){
                studentMapper.updateStudent(student);
                return "学生信息修改成功";
            }
            Student student1 = studentMapper.queryStudentByName(student.getSname());
            if (student1!=null){
                return "用户名已存在";
            }
            studentMapper.saveStudent(student);
            return "学生信息新增成功";
        }catch (Exception e){
            LOG.error("学生信息新增异常"+e);
            return "学生信息新增失败";
        }
       }

    @Override
    public Student queryStudentById(Integer id) {
        return studentMapper.queryStudentById(id);
    }

    @Override
    public String deleteAll(String ids) {
        studentMapper.deleteAll(ids);
        return"";
    }
}
