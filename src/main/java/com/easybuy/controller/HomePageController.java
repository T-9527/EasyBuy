package com.easybuy.controller;

import com.easybuy.model.Product;
import com.easybuy.service.IProductService;
import com.easybuy.util.Pager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2016/12/9.
 */
@Controller
@RequestMapping("/homePage")
public class HomePageController {

    private IProductService iProductService;

    // 取出数据用于主页显示
    @GetMapping(value = "show")
    public String homePageShow(Model model){
        String hql = "from Product";
        Pager<Product> pager = iProductService.pageList(hql,null);
        model.addAttribute("product",pager);
        System.out.println(pager+"==============");
        return "index";
    }

    @Resource
    public void setiProductService(IProductService iProductService) {
        this.iProductService = iProductService;
    }
}
