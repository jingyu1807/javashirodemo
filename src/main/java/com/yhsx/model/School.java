package com.yhsx.model;


import javax.persistence.*;
@Entity
public class School {


          @Id
          @GeneratedValue(strategy = GenerationType.AUTO)
          private Integer id;

          private String  schoolName;

          //学校超级密码
          private String  supperPassword;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getSupperPassword() {
        return supperPassword;
    }

    public void setSupperPassword(String supperPassword) {
        this.supperPassword = supperPassword;
    }
}
