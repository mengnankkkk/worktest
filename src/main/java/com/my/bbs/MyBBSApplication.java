
package com.my.bbs;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
//主模块是什么模块？？
@SpringBootApplication
@MapperScan("com.my.bbs.dao")
public class MyBBSApplication {

	public static void main(String[] args) {
		SpringApplication.run(MyBBSApplication.class, args);
	}

}
