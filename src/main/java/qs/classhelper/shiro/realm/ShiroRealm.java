package qs.classhelper.shiro.realm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import qs.classhelper.entity.TbTeacher;
import qs.classhelper.service.TbTeacherService;

public class ShiroRealm extends AuthorizingRealm{

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
		return null;
		
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//1.把AuthenticationToken 转换为UsernamePasswordToken
		
			
					UsernamePasswordToken upToken=(UsernamePasswordToken)token;
					//2.从UsernamePasswordToken中获取username
					String username=upToken.getUsername();
					//3.调用数据库的方法，从数据库中查询username对应的用户记录
					ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
					TbTeacherService tbTeacherService=(TbTeacherService)ac.getBean("tbTeacherService");
					TbTeacher tbTeacher=tbTeacherService.getTbTeacher(username);
					//5.根据用户信息的情况，决定是否需要抛出其他的AuthenticationException
					//6.根据用户的情况，来构建AuthenticationInfo 对象并返回，通常使用的实现类为：SimpleAuthenticationInfo
					//1)principal:认证的实体信息，可以是username，也可以是数据表对应的用户的实体类对象
					Object principal=tbTeacher.getTeachername();
					Object id=tbTeacher.getTeacherid();
					Subject currentUser = SecurityUtils.getSubject();
				    Session session2=	currentUser.getSession();
				    session2.setAttribute("id", id);
					//2)credentials:密码
					Object credentials=tbTeacher.getTeacherpwd();
					String realmName=getName();
					//4). 盐值. 
					ByteSource credentialsSalt = ByteSource.Util.bytes(username);
					AuthenticationInfo info=new SimpleAuthenticationInfo(principal, credentials, credentialsSalt, realmName);
				
				return info;
	}
	
}
