package com.kh.common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// 마이바티스 탬플릿
public class Template {
	
	public static SqlSession getSqlSession() {
		
		// mybatis-config.xml 파일을 읽어들여서
		// 해당 db와 접속된 SqlSession객체를 생성해서 반환
		SqlSession sqlSession = null;
		
		//SqlSession 객체를 생성하기 위해 SqlSessionFactory 객체가 필요
		//SqlSessionFactory를 생성하기 위해서는 SqlSessionFactoryBuilder가 필요하다.
		
		String resource = "/mybatis-config.xml"; // /는 최상위 폴더를 의미
		
		InputStream stream;
		try {
			stream = Resources.getResourceAsStream(resource);
			/*
			 * 1단계 ) new SqlSessionFactoryBuilder() : sqlSessionFactoryBuilder 객체 생성
			 * 2단계 ) .build(stream) : 입력스트림으로 부터 mybatis-config.xml파일을 읽어들이면서
			 * 							sqlSessionFactory 객체를 만들겠다.
			 * 3단게 ) .openSession(false) : sqlSession객체 생성 및 앞으로 트랜잭션 처리시 자동 커밋할 것인지 
			 * 								안할건지 여부를 지정.
			 * => false == 자동 커밋을 사용하지 않겠다.
			 * => openSession()처럼 매개변수를 제시하니 않으면 기본 값이 false
			 */
			sqlSession = new SqlSessionFactoryBuilder().build(stream).openSession();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sqlSession;
		
		
	}

}
