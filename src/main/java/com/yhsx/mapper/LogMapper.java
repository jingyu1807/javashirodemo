package com.yhsx.mapper;

import com.yhsx.model.SaveLog;

import java.util.HashMap;
import java.util.List;

public interface LogMapper {
    List<SaveLog> queryLog(Integer page, Integer rows, String studentName, Integer schoolId);

    List<SaveLog> queryStudentLog(HashMap map);
}
