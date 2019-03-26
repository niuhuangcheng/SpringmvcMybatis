package com.nhc.maven.batis.vo;

import com.sun.org.apache.regexp.internal.RE;

import java.util.HashMap;
import java.util.Map;

public class ResultVo<T> {
    public static final String SUCCESS_MSG = "success";
    public static final int SUCCESS_CODE = 200;
    public static Map<String, Object> EMPTY = new HashMap();

    public String msg;
    public int code;
    public Object data;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public ResultVo(String msg, int code, T data) {
        this.msg = msg;
        this.code = code;
        if(data==null){
            this.data = EMPTY;
        }

    }

    public static ResultVo success() {
        ResultVo resultVo = new ResultVo(SUCCESS_MSG, SUCCESS_CODE, null);
        return resultVo;
    }
    public static ResultVo success(Object data) {
        ResultVo resultVo = new ResultVo(SUCCESS_MSG, SUCCESS_CODE, data);
        return resultVo;
    }
}
