/**
 * 严肃声明：
 * 开源版本请务必保留此注释头信息，若删除我方将保留所有法律责任追究！
 * 可正常分享和学习源码，不得用于违法犯罪活动，违者必究！
 * Copyright (c) 2021 十三 all rights reserved.
 * 版权所有，侵权必究！
 */
package com.my.bbs.config;

import com.my.bbs.common.Constants;
import com.my.bbs.interceptor.MyBBSLoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//用户管理模块
@Configuration
public class MyBBSWebMvcConfigurer implements WebMvcConfigurer {
    //@Configuration 表明该类是一个配置类，提供了 Bean 定义。
    //该类实现了 WebMvcConfigurer 接口，以便提供自定义的 Spring MVC 配置。
    @Autowired
    private MyBBSLoginInterceptor myBBSLoginInterceptor;
    //将 MyBBSLoginInterceptor 注入到此配置类中。这个拦截器将处理与登录相关的逻辑。
    public void addInterceptors(InterceptorRegistry registry) {
        // 登陆拦截
        //此方法配置哪些路径应由 myBBSLoginInterceptor 拦截。
        //excludePathPatterns 指定不应拦截的路径（例如 /register、/login）。
        //addPathPatterns 指定应拦截的路径。
        registry.addInterceptor(myBBSLoginInterceptor)
                .excludePathPatterns("/register")
                .excludePathPatterns("/login")
                .addPathPatterns("/logout")
                .addPathPatterns("/addPostPage")
                .addPathPatterns("/addPost")
                .addPathPatterns("/addCollect/**")
                .addPathPatterns("/editPostPage/**")
                .addPathPatterns("/editPost")
                .addPathPatterns("/detail/**")
                .addPathPatterns("/uploadFile")
                .addPathPatterns("/uploadFiles")
                .addPathPatterns("/updateUserInfo")
                .addPathPatterns("/updateHeadImg")
                .addPathPatterns("/updatePassword")
                .addPathPatterns("/userCenter")
                .addPathPatterns("/userCenter/**")
                .addPathPatterns("/myCenter")
                .addPathPatterns("/userSet");
    }
    //添加资源处理器
    //此方法将 URL 路径映射到文件系统位置。
    //对 /upload/** 的请求将从由 Constants.FILE_UPLOAD_DIC 指定的目录提供。D:\ upload\
    //使客户端能够通过 URL 直接访问服务器上的静态资源文件。

    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/upload/**").addResourceLocations("file:" + Constants.FILE_UPLOAD_DIC);
    }
}
