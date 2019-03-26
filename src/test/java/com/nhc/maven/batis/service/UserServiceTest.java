package com.nhc.maven.batis.service;

import com.nhc.maven.batis.config.Course;
import com.nhc.maven.batis.config.UserConfig;
import com.nhc.maven.batis.pojo.User;
import javafx.application.Application;
import org.apache.log4j.Logger;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;


import java.util.List;

import static org.junit.Assert.*;

@Component

public class UserServiceTest {
    UserService userService;

    UserConfig userConfig;

    Course course;
    @Before
    public void before(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("springmvc.xml");
        userService = applicationContext.getBean("userService",UserService.class);
        userConfig = applicationContext.getBean("userConfig",UserConfig.class);
        course = applicationContext.getBean("course",Course.class);
    }

    @Test
    public void updateByPrimaryKey() throws Exception {
        System.out.println(userConfig);
        System.out.println(course);
        User user = new User();
        user.setUserId(1111111);
        user.setUserName("aa");
        user.setPhone("89898989");
        user.setPassword("8998989");
        int result = userService.updateByPrimaryKey(user);
        System.out.println(result);
        Assert.assertEquals(1, result);


    }

    @Test
    public void selectByPrimaryKey() throws Exception {
        UserService userService = new UserService();
        User result = userService.selectByPrimaryKey(1111111);
        System.out.println(result);
    }

    @Test
    public void selectByUserName() throws Exception {
        UserService userService = new UserService();
        List<User> result = userService.selectByUserName("");
        System.out.println(result);
        Logger.getLogger(UserServiceTest.class).error(result);

    }

    @Test
    public void deleteByPrimaryKey() throws Exception {
        UserService userService = new UserService();
        userService.deleteByPrimaryKey(1111111);
    }

    @Test
    public void addUser() throws Exception {

        UserService userService = new UserService();
        User user = new User();
        user.setUserId(1111111);
        user.setUserName("hh");
        user.setPhone("1231213r12");
        user.setPassword("jakjljl");
        int result = userService.addUser(user);
        System.out.println(result);
        Assert.assertEquals(1, result);

    }


    @Test
    public void queryAllUser() throws Exception {
        UserService userService = new UserService();
        userService.queryAllUser();

    }


}