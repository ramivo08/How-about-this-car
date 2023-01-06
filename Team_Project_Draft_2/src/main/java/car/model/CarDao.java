package car.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;
import utility2.Paging2;

@Component("MyCarDao")
public class CarDao {

private final String namespace="car.model.Car";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertCar(CarBean cb) {
		sqlSessionTemplate.insert(namespace+".InsertCar", cb);
		
	}

	public int getTotalCount(Map<String, String> map) {
		int result = sqlSessionTemplate.selectOne(namespace+".GetTotalCount", map);
		return result;
	}

	public List<CarBean> myCarList(Map<String, String> map, Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<CarBean> lists = new ArrayList<CarBean>();
		
		lists = sqlSessionTemplate.selectList(namespace+".MyCarList", map, rowBounds);
		return lists;
	}

	public CarBean myCarDetail(String cnum) {
		CarBean cb = sqlSessionTemplate.selectOne(namespace+".MyCarDetail", cnum);
		return cb;
	}

	public void updateMyCar(CarBean cb) {
		sqlSessionTemplate.update(namespace+".UpdateMyCar", cb);
		
	}


	public void deleteCar(String cnum) {
		sqlSessionTemplate.delete(namespace+".DeleteCar", cnum);
		
	}

	public List<CarBean> selectAllCar(Map<String, String> map, Paging2 pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<CarBean> lists = sqlSessionTemplate.selectList(namespace+".SelectAllCar", map,rowBounds);
		return lists;
	}

	public int getMainTotalCount(Map<String, String> map) {
		int result = sqlSessionTemplate.selectOne(namespace+".GetMainTotalCount", map);
		return result;
	}

	public int getMaxPrice(String cmodel) {
		int max_price = sqlSessionTemplate.selectOne(namespace+".GetMaxPrice", cmodel);
		return max_price;
	}
	
	public int getMinPrice(String cmodel) {
		int min_price = sqlSessionTemplate.selectOne(namespace+".GetMinPrice", cmodel);
		return min_price;
	}

	public void updateStatus(String cnum) {
		sqlSessionTemplate.update(namespace+".UpdateStatus", cnum);
	}

	public CarBean getCarByNum(Integer pnum) {
		CarBean cb = sqlSessionTemplate.selectOne(namespace+".GetCarByNum", pnum);
		return cb;
	}

	public List<CarBean> selectAllCarInMain() {
		System.out.println("나와라");
		List<CarBean> lists = sqlSessionTemplate.selectList(namespace+".SelectAllCarInMain");
		System.out.println("제발: " + lists.size());
		return lists;
	}

	public List<CarBean> selectMonthlyDealer() {
		List<CarBean> lists = sqlSessionTemplate.selectList(namespace+".SelectMonthlyDealer");
		return lists;
	}

	public List<CarBean> selectCnumById(String cid) {
		List<CarBean> lists = sqlSessionTemplate.selectList(namespace+".SelectCnumById", cid);
		return lists;
	}


	
}
