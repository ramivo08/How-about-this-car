package board.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("BoardDao")
public class BoardDao {
	private final String namespace="board.model.Board";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void boardCount(String bnum) {
		
		 sqlSessionTemplate.update(namespace+".BoardCount",bnum);
	}
	
	public BoardBean getBoard(String bnum) {
		BoardBean board;
		board = sqlSessionTemplate.selectOne(namespace+".GetBoard",bnum);
		return board;
	}
	public int writeBoard(BoardBean bb) {
		int cnt=-1;
		cnt = sqlSessionTemplate.insert(namespace+".WriteBoard", bb);
		return cnt;
		
	}
	public int getTotalCount(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return totalCount;
	}
	public List<BoardBean> getBoardList(Paging pageInfo, Map<String, String> map) {
		List<BoardBean> lists = new ArrayList<BoardBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".GetBoardList", map ,rowBounds);
		return lists;
	}
	public int updateBoard(BoardBean bb) {
		int cnt =-1;
		cnt = sqlSessionTemplate.update(namespace+".UpdateBoard", bb);
		return cnt;
	}
	public int deleteBoard(String bnum) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteBoard", bnum);
		return cnt;
	}
}
