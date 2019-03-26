package com.nhc.maven.batis.service;


import com.nhc.maven.batis.pojo.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

//@Service("userService")
public class UserService {


    public SqlSession createSqlSesion() throws IOException{

        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //2.通过配置文件创建会话工厂
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
        //3.通过会话工厂获取会话对象
        SqlSession sqlSession = factory.openSession();
        return sqlSession;
    }
    public List<User> queryAllUser() throws IOException {
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //2.通过配置文件创建会话工厂
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
        //3.通过会话工厂获取会话对象
        SqlSession sqlSession = factory.openSession();
        //4.会话执行sql操作
        List<User> list = sqlSession.selectList("queryAllUser");
        //5.提交事务
        sqlSession.commit();
        //6.关闭会话
        sqlSession.close();
        System.out.println(list);
        return list;

    }

    public int addUser(User user) throws IOException {

        SqlSession sqlSession = createSqlSesion();

        int result = sqlSession.insert("insert", user);
        sqlSession.commit();
        return result;
    }


    public int updateByPrimaryKey(User user)throws IOException{
        SqlSession sqlSession = createSqlSesion();
        int result = sqlSession.update("updateByPrimaryKey", user);
        sqlSession.commit();
        return result;
    }


    public User selectByPrimaryKey(int f) throws IOException{
        SqlSession sqlSession = createSqlSesion();
        User user = sqlSession.selectOne("selectByPrimaryKey",f);
        return user;
    }
    public List<User> selectByUserName(String userName) throws IOException{
        SqlSession sqlSession = createSqlSesion();
        List<User> users= sqlSession.selectList("selectByName",userName);
        return users;
    }
    public void deleteByPrimaryKey(int userId) throws IOException{

        SqlSession sqlSession = createSqlSesion();
        sqlSession.delete("deleteByPrimaryKey",userId);
        sqlSession.commit();

    }





}
