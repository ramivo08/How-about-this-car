package mall.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import car.model.CarBean;

@Component("WishDao")
public class MallWishDao {
	
	private final String namespace= "mall.model.Mall";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;


		public int insertWish(CarBean cb) {		
			int cnt;
			
			cnt = sqlSessionTemplate.insert(namespace+".insertWish", cb);
			
			System.out.println("insertCnt:"+cnt);
			return cnt;		
		}

	
	//list컨트롤러
		public CarBean getCarByCnum(int cnum) {
		
		CarBean car = null;
		
		car = sqlSessionTemplate.selectOne(namespace+".GetCarByCnum",cnum);
		
		
		System.out.println("car: "+car);
		return car;
	}

		
		public MallWishBean getByselectnum(int wnum) {
			//ArrayList<MallWishBean> wishcart;
			MallWishBean mwbean;
			mwbean =sqlSessionTemplate.selectOne(namespace+".GetByWnum",wnum);
			System.out.println("getByWnum:"+mwbean);
			return mwbean;
		}


//		public MallWishBean getInsertWnum(int wnum) {
			
			
//			int cnt =sqlSessionTemplate.insert(namespace+".GetInsertWnum", wnum);
			
//			System.out.println("GetInsertWnum"+cnt);
//			return cnt;
//		}

	

		
	//mallListController
/*	public ArrayList<MallWishBean> selectWishList(MallWishBean wish) {
		
		ArrayList<MallWishBean> wishcart;
		
		wishcartsqlSessionTemplate.selectList(namespace+".SelectWishList" ,wish);
		System.out.println("selectWishList: "+wishcart);
		return wishcart;
	}
*/	
	

}
