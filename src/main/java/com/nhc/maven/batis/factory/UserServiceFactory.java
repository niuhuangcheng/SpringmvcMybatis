package com.nhc.maven.batis.factory;

import com.nhc.maven.batis.service.UserService;

public class UserServiceFactory {

    /**
     * 静态方法
     * @return
     */
    public static final UserService createStaticUserService() {

        System.out.println("静态工厂创建Student");
        return new UserService();
    }

    /**
     * 非静态方法
     * @return
     */
    public UserService createUserService() {

        System.out.println("非静态工厂创建Student");
        return new UserService();
    }
}
