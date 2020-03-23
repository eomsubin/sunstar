package com.sunstar.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class HomeTest {
	@Test
	public void t1()
	{
		//assertNotNull(dbconf);
		/*assertNotNull(ds);*/
/*		assertNotNull(sqlsessionFactory);
		assertNotNull(transactionManager);*/
		System.out.println(Math.random()*1000000);
	}
}
