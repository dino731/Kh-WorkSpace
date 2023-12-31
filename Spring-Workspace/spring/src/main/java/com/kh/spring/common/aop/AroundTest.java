package com.kh.spring.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Order(4)
@Slf4j
public class AroundTest {
	
	// @Around  : Before + After를 합쳐놓은 어노테이션
	@Around("CommonPointcut.implPointcut()")
	public Object checkRunningTime(ProceedingJoinPoint jp) throws Throwable{
		
		// ProceedingJoinpoint : 전/후처리 관련된 기능을 제공. 값을 얻어올 수 있는 메서드도 함께 제공한다.
		
		// proceed() 메소드 호출 전 : @Before용도
		// before
		long start = System.currentTimeMillis();
		
		Object obj = jp.proceed(); // before와 after의 중간 지점
		
		// proceed()메소드 호출 후 : @After용도
		// after
		long end = System.currentTimeMillis();
		log.info("Running Time : {} ms", (end - start));
		
		return obj;
		
	}

}
