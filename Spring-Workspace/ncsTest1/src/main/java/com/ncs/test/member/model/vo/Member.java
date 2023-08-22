package com.ncs.test.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Member {
	
	private String memberId; //MEMBER_ID
	private String memberPwd; //MEMBER_PWD
	private String name; //MEMBER_NM
	private String eDate; //MEMBER_ENROLL_DT

}
