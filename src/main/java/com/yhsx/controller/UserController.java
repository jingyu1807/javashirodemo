package com.yhsx.controller;


import com.yhsx.model.ItdragonResult;
import com.yhsx.model.Student;
import com.yhsx.model.User;
import com.yhsx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("user")
public class UserController {
         @Autowired
         private UserService userService;


        @RequestMapping("userlogin")
        public ItdragonResult userLogin(User u, HttpSession session, HttpServletRequest request){
            ItdragonResult res = userService.userLogin(u,session,request);
            return res;
        }

    @RequestMapping("userloginw")
    public ItdragonResult userloginw(@RequestBody User u, HttpSession session, HttpServletRequest request){

        ItdragonResult res = userService.userLogin(u,session,request);
        return res;
    }
}
