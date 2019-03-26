package com.nhc.maven.batis.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.Properties;

@Component("userConfig")
@Data
public class UserConfig {


    public String remoteAddress;

    public List remoteUsers;

    public Map remoteMap;

    public Properties remoteProperties;


    @Value("#{course.courseName}")
    public String courseName;


}
