package com.yhsx.model;


import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;


@Data
@Entity
public class Student {
     @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
     private Integer id;
     //学生姓名
     private String sname;

     //学生密码
    private String spassword;

     //学校
    private  Integer   schoolId;
    @Transient
    private  String   schoolName;
    //等级
    private  Integer  levelId;
    @Transient
    private  String   level;
    //性别
    private  Integer  sex;

    private  Integer   proNameId;

    private  Integer  cityNameId;
    //市
    @Transient
    private String proName;
    //省
    @Transient
    private String cityName;
    //生日
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date birthday;




}
