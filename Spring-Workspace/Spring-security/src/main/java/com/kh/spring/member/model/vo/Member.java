package com.kh.spring.member.model.vo;

import java.sql.Date;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author ain
 * UserDetails ? 사용자 정보를 나타내는 인터페이스로 스프링 시큐리티에서 제공
 * 				 사용자의 인증 및 권한 정보를 제공하는데 사용
 *
 */
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Member implements UserDetails {
		private int userNo;
		private String userId; 	//UserDetails에서 UserName 용도로 사용할 칼럼
		private String userPwd;	// UserDetails 에서 password용도로 사용할 칼럼
		//private String userName;
		private String nickName;
		private String email;
		private String phone;
		private String address;
		private String interest;
		private Date enrollDate;
		private Date modifyDate;
		private String status;
		private String gender;
		private String birthday;
		private String changePwd;
		
		// 복수개의 권한을 관리하는 필드
		// 문자열 형태의 간단한 권한("ROLE_USER", "ROLE_ADMIN")을 처리할 수 있는 클래스
		private List<SimpleGrantedAuthority> authorities;
		
		private boolean enabled; // 게정 활성화 여부 1 == true, 0 == false. 활성화 여부가 true여야 로그인이 가능함.
		
		@Override
		public Collection<? extends GrantedAuthority> getAuthorities(){
			return authorities;
		}
		
		// 로그인한 사용자의 아이디(이름)을 반환해주는 메소드
		@Override
		public String getUsername() {
			return userId;
		}
		
		// 로그인한 사용자의 비밀번호를 반환해주는 메소드
		@Override
		public String getPassword() {
			return userPwd;
		}
		
		// 그외 추가적인 메소드
		@Override
		public boolean isAccountNonExpired() {// 사용자 계정 만료 여부 확인하는 메소드
			 return true; // 항상 사용가능하게 설정
		}
		
		@Override 
		public boolean isAccountNonLocked() { // 계정 장금 상태 확인
			return true; // 항상 잠금 해제 상태로 설정
		}
		
		@Override
		public boolean isCredentialsNonExpired() {
			return true;
		}
		
		
		
		
	

}
