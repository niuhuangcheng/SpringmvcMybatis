package com.nhc.maven.batis.controller;


import com.nhc.maven.batis.pojo.User;
import com.nhc.maven.batis.service.UserService;
import com.nhc.maven.batis.vo.ResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("/index")
    public String index(){
        return "login";
    }
    @RequestMapping("/login")
    public String login(Model model,  @RequestParam("username") String userName, String password){
        model.addAttribute("userName",userName);
        model.addAttribute("password",password);
        return "user";
    }

    @ResponseBody
    @RequestMapping("/getAllUser")
    public ResultVo getAllUsers(Model model){

        List<User> users = null;
        try {
            users = userService.queryAllUser();
        } catch (IOException e) {
            e.printStackTrace();
        }
        model.addAttribute("list",users);
//        return users;
        return ResultVo.success(users);
//        return  "user";
    }

    @RequestMapping("/getUserInfo/{id}")
    public String getUserInfo(Model model ,@PathVariable(value = "id") int id) throws IOException{

        List<User> users = new ArrayList<User>();
//        try {
            users.add(userService.selectByPrimaryKey(id));
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        model.addAttribute("list",users);
        return  "user";
    }


//    @ExceptionHandler
//    public String handleException(RuntimeException re){
//
//        return "forward:/user/error";
//    }
//    @RequestMapping("/error")
//    public String errorPage(){
//        return "error";
//    }




}
