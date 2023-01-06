package mall.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class PaySuccessBean {
	private String orderNum;
	private BigDecimal paidAmount;//BigDecimal 돈계산할때, 정확도 높음 정수를 이용해 실수로 표현
	private String dataList;
	
	
	private List<PaySuccessDetailBean> list;

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public BigDecimal getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(BigDecimal paidAmount) {
		this.paidAmount = paidAmount;
	}

	public String getDataList() {
		return dataList;
	}

	public void setDataList(String dataList) {
		this.dataList = dataList;
	}

	public List<PaySuccessDetailBean> getList() {
		return list;
	}

	public void setList(List<PaySuccessDetailBean> list) {
		this.list = list;
	}
}