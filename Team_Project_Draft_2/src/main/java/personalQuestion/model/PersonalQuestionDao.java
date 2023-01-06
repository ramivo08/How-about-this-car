package personalQuestion.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import car.model.CarBean;
import utility.Paging;

@Component("MyPersonalQuestionDao")
public class PersonalQuestionDao {

private final String namespace="personalQuestion.model.PersonalQuestion";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertPQ(PersonalQuestionBean pqbean) {
		sqlSessionTemplate.insert(namespace+".InsertPQ", pqbean);
		
	}

	public int getTotalCount(Map<String, String> map) {
		int result = sqlSessionTemplate.selectOne(namespace+".GetTotalCount", map);
		return result;
	}

	public List<PersonalQuestionBean> myPQList(Map<String, String> map, Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<PersonalQuestionBean> lists = new ArrayList<PersonalQuestionBean>();
		
		lists = sqlSessionTemplate.selectList(namespace+".MyPQList", map, rowBounds);
		return lists;
	}

	public PersonalQuestionBean selectQuestion(String pnum) {
		PersonalQuestionBean pqbean = sqlSessionTemplate.selectOne(namespace+".SelectQuestion", pnum);
		
		return pqbean;
	}

	public void updateAnswer(PersonalQuestionBean pqbean) {
		sqlSessionTemplate.update(namespace+".UpdateAnswer", pqbean);
		
	}

	public List<PersonalQuestionBean> selectMyList(String buyer_id) {
		List<PersonalQuestionBean> lists = sqlSessionTemplate.selectList(namespace+".SelectMyList", buyer_id);
		return lists;
	}

	public void updatePQ(PersonalQuestionBean pqbean) {
		sqlSessionTemplate.update(namespace+".UpdatePQ", pqbean);
		
	}

	public void deletePQ(String pnum) {
		sqlSessionTemplate.delete(namespace+".DeletePQ", pnum);
		
	}

	
}
