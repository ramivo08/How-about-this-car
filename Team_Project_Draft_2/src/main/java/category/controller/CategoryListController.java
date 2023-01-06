package category.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import category.model.CategoryBean;
import category.model.CategoryDao;


@Controller
public class CategoryListController {
	private final String command="list.cate";
	private final String getPage="/cateList";
	
	@Autowired
	CategoryDao catedao;
	
	@RequestMapping(command)
	public String cateList(Model model) {
		
		List<CategoryBean> modLists= catedao.getList();
		List<CategoryBean> comLists = catedao.getComList();
		
		
		model.addAttribute("modLists", modLists);
		model.addAttribute("comLists", comLists);
		
		
		return getPage;
	}
}
