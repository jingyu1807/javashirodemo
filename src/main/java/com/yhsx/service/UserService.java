package com.yhsx.service;

import com.yhsx.model.ItdragonResult;
import com.yhsx.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface UserService {
    ItdragonResult userLogin(User u, HttpSession session, HttpServletRequest request);

    User findByAccount(String username);
}
