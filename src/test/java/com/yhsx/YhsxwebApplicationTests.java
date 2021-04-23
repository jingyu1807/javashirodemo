package com.yhsx;

import com.yhsx.mapper.StudentMapper;
import com.yhsx.model.Student;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class YhsxwebApplicationTests {


    @Autowired
    private StudentMapper studentMapper;

    @Test
    void contextLoads() {

        Integer a =35;
        while (a<=60){

            Student student = new Student();
            student.setSname("user"+a);
            student.setSpassword("123");
            student.setLevelId(1);
            student.setSchoolId(1);
            studentMapper.saveStudent(student);
            a++;
        }


    }

}
