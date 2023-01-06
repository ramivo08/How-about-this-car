package member.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("MemberDao")
public class MemberDao {

	private final String namespace="member.model.Member";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<MemberBean> getMemberList(Paging pageInfo,Map<String,String> map){
		
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<MemberBean> lists=sqlSessionTemplate.selectList(namespace+".GetMemberList",map,rowBounds);
		return lists;
	}

	public int getTotalCount(Map<String, String> map) {
		int totlalcount = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return totlalcount;
	}
	public MemberBean getMemberByNum(String num) {
		MemberBean member;
		member = sqlSessionTemplate.selectOne(namespace+".GetMemberByNum",num);
		return member;
	}

	public int deleteMember(String num) {
		int result = -1;
		result = sqlSessionTemplate.delete(namespace+".DeleteMember",num);
		return result;
	}

	public void authorityMember(String id) {
		sqlSessionTemplate.update(namespace+".AuthorityMember",id);

	}
	public void authorityMember2(String id) {
		sqlSessionTemplate.update(namespace+".AuthorityMember2",id);
		
	}
	public int registerMember(MemberBean member) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".RegisterMember",member);
		
		return cnt;
	}

	public int checkId(String inputid) {
		int result=-1;
		result = sqlSessionTemplate.selectOne(namespace+".IdCheck", inputid);
		return result;
	}

	public MemberBean getMember(String id) {
		MemberBean mb;
		mb = sqlSessionTemplate.selectOne(namespace+".GetMember",id);
		return mb;
	}

	public void getMemberByHP(MemberBean member) {
		
		
	}

	public MemberBean searchIdByBean(MemberBean member) {
		MemberBean mb = null;
		mb = sqlSessionTemplate.selectOne(namespace+".SearchIdByBean", member);
		return mb;
	}

	public String pwFindIdCheck(String id) {
		String result = null;
		System.out.println("DAO-id"+id);
		result = sqlSessionTemplate.selectOne(namespace + ".PwFindIdCheck",id);
		return result;
	}

	public int updatePw(MemberBean member) {
		int cnt = -1;
		System.out.println("DAOmember-id"+member.getId());
		cnt = sqlSessionTemplate.update(namespace + ".UpdatePw", member);
		return cnt;
		
	}

	public void authorityReject(String id) {
		sqlSessionTemplate.update(namespace+".AuthorityReject", id);
		
	}

	public MemberBean selectMember(String num) {
		MemberBean mbean = sqlSessionTemplate.selectOne(namespace+".SelectMember",num);
		return mbean;
	}

	public int updateMember(MemberBean mbean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".UpdateMember",mbean);
		return cnt;
	}

	public MemberBean selectMemberup(int num) {
		MemberBean mbean = sqlSessionTemplate.selectOne(namespace+".SelectMemberUP",num);
		return mbean;
	}


}
