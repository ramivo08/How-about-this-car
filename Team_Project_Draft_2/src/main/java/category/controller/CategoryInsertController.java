package category.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import category.model.CategoryBean;
import category.model.CategoryDao;

@Controller
public class CategoryInsertController {

	private final String command="insertCate.cate";
	private final String gotoPage="redirect:/list.cate";
	private final String getPage="/insertCategory";
	
	
	@Autowired
	CategoryDao catedao;
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String cateInsert(CategoryBean cateBean) {
		catedao.insertCate(cateBean);
		
		return gotoPage;
	}
	
	@RequestMapping(command)
	public String insertForm() {

		
		return getPage;
	}
}
