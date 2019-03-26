package com.nhc.maven.batis.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


@Component("course")
@Data
public class Course {


    @Value("数学")
    public String courseName;
    @Value(value = "90")
    public int  score;

}
