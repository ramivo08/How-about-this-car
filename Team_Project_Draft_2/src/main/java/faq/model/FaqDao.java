package faq.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.model.BoardBean;
import utility.Paging;

@Component("MyFaq")
public class FaqDao {

	private final String namespace="faq.model.Faq";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int writeFaq(FaqBean faq) {
		int cnt=-1;
		System.out.println(cnt);
		cnt = sqlSessionTemplate.insert(namespace+".WriteFaq", faq);
		return cnt;
	}
	public int getTotalCount(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return totalCount;
	}
	public List<FaqBean> getFaqList(Paging pageInfo, Map<String, String> map) {
		List<FaqBean> lists = new ArrayList<FaqBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".GetFaqList", map ,rowBounds);
		return lists;
	}
	public FaqBean getFaq(String fnum) {
		FaqBean faq;
		faq = sqlSessionTemplate.selectOne(namespace+".GetFaq",fnum);
		return faq;
	}
	public int updateFaq(FaqBean faq) {
		int cnt =-1;
		cnt = sqlSessionTemplate.update(namespace+".UpdateFaq", faq);
		return cnt;
	}
	public int deleteFaq(String fnum) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteFaq", fnum);
		return cnt;
	}
}
