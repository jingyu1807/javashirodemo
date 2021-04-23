package com.yhsx.service.impl;

import com.yhsx.mapper.LogMapper;
import com.yhsx.model.SaveLog;
import com.yhsx.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LogServiceImpl implements LogService {
    @Autowired
    private LogMapper logMapper;



    @Override
    public List<SaveLog> queryStudentLog(HashMap map) {
        List<SaveLog> list =logMapper.queryStudentLog(map);
        return list;
    }
}
