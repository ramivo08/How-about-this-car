package category.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import category.model.CategoryDao;

@Controller
public class CategortyDeleteController {

	private final String command="deleteCate.cate";
	private final String gotoPage="redirect:/list.cate";
	
	@Autowired
	CategoryDao catedao;
	
	
	@RequestMapping(command)
	public String deleteCate(@RequestParam(value="cate_cnum",required = false) String cate_cnum) {
		System.out.println("cnum  : "+cate_cnum);
		catedao.deleteCate(cate_cnum);
		return gotoPage;
	}
}
