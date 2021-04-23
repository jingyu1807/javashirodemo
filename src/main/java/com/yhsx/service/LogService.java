package com.yhsx.service;

import com.yhsx.model.SaveLog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface LogService {
    List<SaveLog> queryStudentLog(HashMap map);
}
