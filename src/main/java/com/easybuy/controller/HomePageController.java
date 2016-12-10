package com.easybuy.controller;

import com.easybuy.model.Pro_category;
import com.easybuy.model.Product;
import com.easybuy.service.IPro_categoryService;
import com.easybuy.service.IProductService;
import com.easybuy.util.Pager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/12/9.
 */
@Controller
@RequestMapping("/homePage")
public class HomePageController {

    private IProductService iProductService;
    private IPro_categoryService iPro_categoryService;

    // 取出数据用于主页显示
    @GetMapping(value = "show")
    public String homePageShow(Model model){
        String hql = "from Product";
        String hql1 = "from Pro_category";
        List<Pro_category> list = iPro_categoryService.list(hql1);
        Pager<Product> pager = iProductService.pageList(hql,null);
        model.addAttribute("product",pager);
        model.addAttribute("category",list);
        return "index";
    }

    //按分类跳转到product-list页面
    @GetMapping(value = "list/{category}")
    public String productList(@PathVariable String category, Model model){
        String hql = "from Product where pro_category.name='"+category+"'";
        Pager<Product> pager = iProductService.pageList(hql,null);
        model.addAttribute("pager",pager);
        model.addAttribute("category",category);
        return "product-list";
    }

    //按价格显示
    @PostMapping(value = "byPrice")
    public String byPrice(int minPrice,int maxPrice,Model model){
        String hql = "form Product where price>"+minPrice+".0 and price<"+maxPrice+".0";
        String hql1 = "from Product where price>1.0 and price<100.0";
        Pager<Product> list = iProductService.pageList(hql1,null);
        System.out.println(list+"1111111111");
        model.addAttribute("pager",list);
        return "product-list";
    }

    //按地区显示
    @PostMapping(value = "byAddress")
    public String address(String address,Model model){
        String hql = "from Product where address='"+address+"'";
        Pager<Product> list = iProductService.pageList(hql,null);
        System.out.println(list);
        model.addAttribute("pager",list);
        return "product-list";
    }

    @Resource
    public void setiPro_categoryService(IPro_categoryService iPro_categoryService) {
        this.iPro_categoryService = iPro_categoryService;
    }

    @Resource
    public void setiProductService(IProductService iProductService) {
        this.iProductService = iProductService;
    }
}
