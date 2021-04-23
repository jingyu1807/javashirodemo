package com.yhsx.controller;


import com.yhsx.model.ItdragonResult;
import com.yhsx.model.SaveLog;
import com.yhsx.service.LogService;
import org.apache.shiro.crypto.hash.Hash;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* *
 * @Description
 * @Author jy
 * @Date 2019.12.09 11:06
 **/
@RestController
@RequestMapping("log")
public class LogController {
    @Resource
    private LogService logService;

    /* *
     * @Description 查询前端操作日志
     * @Param [map]
     * @return com.yhsx.model.ItdragonResult
     * @Author jy
     * @Date 2019.12.24 11:08
     **/
    @RequestMapping("queryStudentLog")
    public ItdragonResult queryStudentLog(@RequestBody HashMap map){
        ItdragonResult itdragonResult = new ItdragonResult();
        List<SaveLog>  list = logService.queryStudentLog(map);
        itdragonResult.setData(list);
        return itdragonResult;
    }


}
