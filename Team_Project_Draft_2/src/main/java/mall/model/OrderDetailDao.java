package mall.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("OrderDetailDao")
public class OrderDetailDao {

	private final String namespace = "order.model.OrderDetail";

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	public void insertData(PaySuccessDetailBean detailBean) {
		sqlSessionTemplate.insert(namespace + ".insertData", detailBean);
	}
	

}
