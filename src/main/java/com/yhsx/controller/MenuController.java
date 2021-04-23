package com.yhsx.controller;


import com.yhsx.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("menu")
public class MenuController {

    @RequestMapping("index")
    public  String  index(){


        return "index";
    }

    @RequestMapping("userList")
    public  String  userList(){


        return "user/show";
    }

    @RequestMapping("toAdd")
    public  String  toAdd(){


        return "user/addUser";
    }

}
