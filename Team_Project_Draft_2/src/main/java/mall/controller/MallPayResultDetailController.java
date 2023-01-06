package mall.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import car.model.CarBean;
import car.model.CarDao;
import mall.model.PaySuccessBean;

//주문상세 보기
@Controller
public class MallPayResultDetailController {

   private final String command = "payResultDetail.mall";
   private String getPage = "/payResultDetail";
   
   @Autowired
   private CarDao carDao;

   @RequestMapping(command)
   public String payResultDetail(HttpSession session, Model model, HttpServletRequest req) {
      PaySuccessBean paySuccessBean = (PaySuccessBean) session.getAttribute("paySuccessBean");
      List<CarBean> carList = (ArrayList<CarBean>) session.getAttribute("carList");
      String nowStr = (String) session.getAttribute("nowStr");

      session.setAttribute("paySuccessBean", paySuccessBean);
      session.setAttribute("carList", carList);
      session.setAttribute("nowStr", nowStr);
      
      model.addAttribute("cnum", req.getParameter("cnum"));

      return getPage;
   }
}