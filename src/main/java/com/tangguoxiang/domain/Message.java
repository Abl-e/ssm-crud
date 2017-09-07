package com.tangguoxiang.domain;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by 唐国翔 on 2017/9/7 0007.
 */
public class Message {
    private Integer code;
    private String msg;
    private Map<String,Object> result = new HashMap<>();

    public static Message success(String message){
        Message msg = new Message();
        msg.setCode(200);
        msg.setMsg(message);
        return msg;
    }
    public static Message fail(String message){
        Message msg = new Message();
        msg.setCode(505);
        msg.setMsg(message);
        return msg;
    }

    public Message add(String key,Object value){
        this.getResult().put(key,value);
        return this;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getResult() {
        return result;
    }

    public void setResult(Map<String, Object> result) {
        this.result = result;
    }
}
