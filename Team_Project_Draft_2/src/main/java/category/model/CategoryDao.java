package category.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("MyCategoryDao")
public class CategoryDao {

	private final String namespace="category.model.Category";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<CategoryBean> getList() {
		List<CategoryBean> lists = sqlSessionTemplate.selectList(namespace+".GetList"); 
		return lists;
	}

	public List<CategoryBean> getComList() {
	
		List<CategoryBean> lists = sqlSessionTemplate.selectList(namespace+".GetComList");
		return lists;
	}

	public void insertCate(CategoryBean cateBean) {
		sqlSessionTemplate.insert(namespace+".InsertCate", cateBean);
		
	}

	public void deleteCate(String cate_cnum) {
		sqlSessionTemplate.delete(namespace+".DeleteCate", cate_cnum);
		
	}

	
	
}
