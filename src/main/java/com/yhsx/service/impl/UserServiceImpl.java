package com.yhsx.service.impl;

import com.yhsx.dao.UserRepository;
import com.yhsx.mapper.UserMapper;
import com.yhsx.model.ItdragonResult;
import com.yhsx.model.User;
import com.yhsx.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class UserServiceImpl implements UserService {

     @Autowired
     private UserMapper userMapper;

     @Resource
     private UserRepository userRepository;

    private static final Logger LOG = LoggerFactory.getLogger(UserServiceImpl.class);

    @Override
    public ItdragonResult userLogin(User u, HttpSession session, HttpServletRequest request) {
        ItdragonResult result = new ItdragonResult();
        try {
            Subject currentUser = SecurityUtils.getSubject();
           // Subject subject = SecurityUtils.getSubject();
          //  if (!currentUser.isAuthenticated()) {
                UsernamePasswordToken token = new UsernamePasswordToken(u.getUserName(), u.getPassword());
//	            token.setRememberMe(true);
                try {
                    currentUser.login(token);	// 执行登录
                    SavedRequest savedRequest = WebUtils.getSavedRequest(request);
                    // 获取登录前的最后一个页面
                    String url = null != savedRequest ?
                            (null != savedRequest.getRequestUrl()?savedRequest.getRequestUrl():""):"";
                    result.setStatus(200);
                    result.setData(url);
                    System.out.println("result : " + result.getData());
                    return result;
                } catch (AuthenticationException ae) {
                    LOG.info("^^^^^^^^^^^^^^^^^^^^ ITDragon 登录失败: " + ae.getMessage());
                    ae.printStackTrace();
                    result.setStatus(500);
                    result.setMsg("账号密码不匹配");

                    return result;
                }
           // }
            //result.setStatus(200);
            //return result;
        } catch (Exception e) {
            e.printStackTrace();
            return result;
        }
//        try {
////            if (session.getAttribute(u.getUserName())!=null){
////
////                return "用户已登录";
////            }
//            //根据用户名查询用户信息
//            User user = userMapper.queryUserByName(u.getUserName());
//            //验证用户名
//            if (user == null) {
//                return "用户名或密码不正确";
//            }
//           //验证密码
//            if (!u.getPassword().equals(user.getPassword())) {
//                return "用户名或密码不正确";
//            }
//            session.setAttribute(user.getUserName(),user);
//            return "登录成功";
//        }catch(Exception e){
//            LOG.error(new Date()+"登录异常"+e);
//            return "系统异常";
//        }


    }

    @Override
    public User findByAccount(String username) {
        return userRepository.findByAccount(username);
    }
}
