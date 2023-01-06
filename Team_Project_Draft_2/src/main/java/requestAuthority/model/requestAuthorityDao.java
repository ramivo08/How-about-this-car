package requestAuthority.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MyRequestAuthority")
public class requestAuthorityDao {

	private final String namespace="requestAuthority.model.RequestAuthority";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertRA(requestAuthorityBean rabean) {
		sqlSessionTemplate.insert(namespace+".InsertRA",rabean);
		
	}

	public List<requestAuthorityBean> getRequestList() {
		List<requestAuthorityBean> lists = sqlSessionTemplate.selectList(namespace+".GetRequestList");
		return lists;
	}

	public void updateStatus(String id) {
		sqlSessionTemplate.update(namespace+".UpdateStatus", id);
		
	}

	public requestAuthorityBean getInfoByID(String id) {
		requestAuthorityBean rabean = sqlSessionTemplate.selectOne(namespace+".GetInfoByID", id);
		return rabean;
	}

	public void deleteByID(String id) {
		sqlSessionTemplate.delete(namespace+".DeleteByID",id);
		
	}

	public int getCount() {
		int result = sqlSessionTemplate.selectOne(namespace+".GetCount");
		return result;
	}
	


	public void rejectAuthority(String id) {
		sqlSessionTemplate.selectOne(namespace+".RejectAuthority",id);
		
	}
	
}
