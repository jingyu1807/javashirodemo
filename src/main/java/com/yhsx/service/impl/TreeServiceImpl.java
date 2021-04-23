package com.yhsx.service.impl;

import com.yhsx.mapper.TreeMapper;
import com.yhsx.model.Tree;
import com.yhsx.service.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;
@Service
public class TreeServiceImpl implements TreeService {

    @Autowired
    private TreeMapper treeMapper;


    //查询页面树
    @Override
    public List<Tree> queryTreeList() {
        return queryAscTree(-1);
    }
    public List<Tree> queryAscTree(Integer id){
        List<Tree> tree = treeMapper.queryTreeList(id);
        for (Tree tr:tree){
            tr.setNodes(queryAscTree(tr.getId()));
        }
        return  tree;
    }


}
