package review.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;
import utility2.Paging2;

@Component("myReviewDao")
public class ReviewboardDao {

	private final String namespace = "review.model.reviewboard";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int getTotalCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount",map);
		return count;
	}

	public List<ReviewboardBean> getReviewBoard(Paging pageInfo,Map<String, String> map) {

		List<ReviewboardBean> lists = new ArrayList<ReviewboardBean>();
		
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		
		lists = sqlSessionTemplate.selectList(namespace + ".GetReviewBoard", map, rowBounds);
		System.out.println("lists:::"+lists.size());
		
		return lists;
	}

	public List<Integer> getLoginid(String id) {
		List<Integer> getLoginid = sqlSessionTemplate.selectList(namespace + ".GetLoginid",id);
		
		return getLoginid;
	}

	public String getCnum(Integer cnum) {
		String carname = sqlSessionTemplate.selectOne(namespace + ".GetCnum", cnum);
		return carname;
	}

	public String getCar(Integer cnum) {
		String car = sqlSessionTemplate.selectOne(namespace + ".GetCar", cnum);
		return car;
	}

	public int insertReiew(ReviewboardBean rebbean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".InsertReiew", rebbean);
		return cnt;
	}

	public ReviewboardBean getRnum(String rnum) {
		ReviewboardBean rb = sqlSessionTemplate.selectOne(namespace +".GetRnum", rnum);
		System.out.println("rb.getRnum:"+rb.getRnum());
		System.out.println("rnum:::"+rnum);
		return rb;
	}

	public int updateReviewboard(ReviewboardBean rebbean) {
		int cnt=-1;
		cnt = sqlSessionTemplate.update(namespace + ".UpdateReviewboard", rebbean);
		System.out.println("cnt:::"+cnt);
		return cnt;
		
	}

	public String selectByPw(int rnum) {
		String pw = sqlSessionTemplate.selectOne(namespace+".SelectByPw", rnum);
		return pw;
	}

	public int BoardDelete(String rnum) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteBoard", rnum);
		System.out.println("BoardDelete cnt:"+cnt);
		return cnt;
	}

	public RowBounds pageinfo(Paging2 pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		return rowBounds;
	}
	
	
	
	
	
	
	
}
