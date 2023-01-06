package mall.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("OrderDao")
public class OrderDao {

	private String namespace = "order.model.Order";

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int insertData(PaySuccessBean paySuccessBean) {
		return sqlSessionTemplate.insert(namespace + ".InsertData", paySuccessBean);
	}

	public List<MonthlyDealerBean> getMonthlyDealerList() {
		return sqlSessionTemplate.selectList(namespace + ".getMonthlyDealerList");
	}
	
	public List<OrderInfoBean> selectOrderListByMid(String mid) {
		return sqlSessionTemplate.selectList(namespace + ".selectOrderListByMid", mid);
	}

	public List<OrderInfoBean> selectpayResultDetailListByOnum(int onum) {
		return sqlSessionTemplate.selectList(namespace + ".selectpayResultDetailListByOnum", onum);
	}

}
