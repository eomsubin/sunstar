package com.sunstar.controller;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;


@ContextConfiguration({"file:src/main/resources/sunstar-security.xml"
	,"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class SunstarTest {
	
	@Autowired
	private HikariConfig dbconf;
	
	@Autowired
	private HikariDataSource ds;
	
	@Autowired
	private SqlSessionFactoryBean sqlsessionFactory;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	
	
	
	@Test
	public void t1()
	{
		assertNotNull(dbconf);
		assertNotNull(ds);
		assertNotNull(sqlsessionFactory);
		assertNotNull(transactionManager);
	}
}
