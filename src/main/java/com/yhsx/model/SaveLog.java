package com.yhsx.model;


import lombok.Data;

import javax.persistence.*;
import java.util.Date;


@Data
@Entity
public class SaveLog {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private  Long id;
    //@Column(columnDefinition = "text")
    private  String  log;

    private Date saveTime;


}
