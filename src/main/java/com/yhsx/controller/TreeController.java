package com.yhsx.controller;


import com.yhsx.model.Tree;
import com.yhsx.model.User;
import com.yhsx.service.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("tree")
public class TreeController {
    @Autowired
    private TreeService treeService;

    //查询页面树
    @RequestMapping("queryTreeList")
    public List<Tree> queryTreeList(HttpSession session){
        //Staff staff = (Staff)session.getAttribute("staff");
        List<Tree> trees = treeService.queryTreeList();
        return treeService.queryTreeList();
    }

}
