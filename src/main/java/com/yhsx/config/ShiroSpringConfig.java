package com.yhsx.config;

import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroSpringConfig {

	private static final transient Logger log = LoggerFactory.getLogger(ShiroSpringConfig.class);

	/*
	 * 定义拦截URL权限，优先级从上到下 
	 * 1). anon  : 匿名访问，无需登录 
	 * 2). authc : 登录后才能访问 
	 * 3). logout: 登出
	 * 4). roles : 角色过滤器
	 * 
	 * URL 匹配风格
	 * 1). ?：匹配一个字符，如 /admin? 将匹配 /admin1，但不匹配 /admin 或 /admin/；
	 * 2). *：匹配零个或多个字符串，如 /admin* 将匹配 /admin 或/admin123，但不匹配 /admin/1；
	 * 2). **：匹配路径中的零个或多个路径，如 /admin/** 将匹配 /admin/a 或 /admin/a/b
	 * 
	 * 配置身份验证成功，失败的跳转路径
	 */
	@Bean
	public ShiroFilterFactoryBean shirFilter(DefaultWebSecurityManager securityManager) {
		log.info("^^^^^^^^^^^^^^^^^^^^ ITDragon 配置Shiro拦截工厂");
		ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
		shiroFilterFactoryBean.setSecurityManager(securityManager);
		Map<String, String> filterChainDefinitionMap = new LinkedHashMap<String, String>();
		filterChainDefinitionMap.put("/static/**", "anon");	// 静态资源匿名访问
		//filterChainDefinitionMap.put("/index", "anon");		// 欢迎页面匿名访问
		filterChainDefinitionMap.put("login.jsp", "anon");		// 登录页面匿名访问
		filterChainDefinitionMap.put("/user/userlogin", "anon");
		filterChainDefinitionMap.put("/user/userloginw", "anon");
		filterChainDefinitionMap.put("/log/queryStudentLog", "anon");
		filterChainDefinitionMap.put("/logout", "logout");	// 用户退出，只需配置logout即可实现该功能
		filterChainDefinitionMap.put("/**", "authc");
		//filterChainDefinitionMap.put("/**", "prems");		// 其他路径均需要身份认证，一般位于最下面，优先级最低
		shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
		shiroFilterFactoryBean.setLoginUrl("/login.jsp");		// 登录的路径
		//shiroFilterFactoryBean.setSuccessUrl("/menu/index");	// 登录成功后跳转的路径
		shiroFilterFactoryBean.setUnauthorizedUrl("/403");	// 验证失败后跳转的路径
		return shiroFilterFactoryBean;
	}
	
	@Bean
	public HashedCredentialsMatcher hashedCredentialsMatcher() {
		HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
		hashedCredentialsMatcher.setHashAlgorithmName("MD5");
		hashedCredentialsMatcher.setHashIterations(1024);
		return hashedCredentialsMatcher;
	}

	@Bean
	public YhsxShiroRealm itDragonShiroRealm() {
		YhsxShiroRealm itDragonShiroRealm = new YhsxShiroRealm();
		itDragonShiroRealm.setCredentialsMatcher(hashedCredentialsMatcher());
		return itDragonShiroRealm;
	}
	//权限管理，配置主要是Realm的管理认证
	@Bean
	public DefaultWebSecurityManager securityManager() {
		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		securityManager.setRealm(itDragonShiroRealm());
		return securityManager;
	}

	//加入注解的使用，不加入这个注解不生效
	@Bean
	public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(DefaultWebSecurityManager securityManager) {
		AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
		authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
		return authorizationAttributeSourceAdvisor;
	}

}
