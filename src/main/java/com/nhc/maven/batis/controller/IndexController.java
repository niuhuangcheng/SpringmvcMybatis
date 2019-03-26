package com.nhc.maven.batis.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String index(){
        return "redirect:/result";
    }
    @RequestMapping(value = "/result" )
    public String result(@CookieValue("JSESSIONID") String cookie, @RequestHeader("user-Agent") String header){
        System.out.println("cookie:"+cookie +": header:"+header);
        return "result";
    }


}
