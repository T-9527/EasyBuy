package com.easybuy.controller;

import com.easybuy.model.Parent_category;
import com.easybuy.model.Pro_category;
import com.easybuy.model.Product;
import com.easybuy.service.IParent_categoryService;
import com.easybuy.service.IPro_categoryService;
import com.easybuy.service.IProductService;
import com.easybuy.util.Pager;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2016/12/7.
 */
@Controller
@RequestMapping("/product")
public class ProductController {
    private IPro_categoryService iPro_categoryService;
    private IProductService iProductService;
    private IParent_categoryService iParent_categoryService;


    //跳转到product-add页面
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String add(Model model) {
        String hql = "from Pro_category";
        List<Pro_category> list = iPro_categoryService.list(hql);
        model.addAttribute("list", list);
        return "product-add";
    }

    //添加商品
    @PostMapping(value = "addProduct")
    public String add(Product product,
                      MultipartFile photo, BindingResult br, HttpSession session) throws IOException {
        //获取部署路径
        //String path = session.getServletContext().getRealPath("/resources/images/product");

        String path ="D:\\框架\\EasyBuy\\src\\main\\webapp\\resources\\images\\product";
        //文件路径
        File file = new File(path + File.separator + photo.getOriginalFilename());
        //保存文件
        FileUtils.copyInputStreamToFile(photo.getInputStream(), file);
        product.setFilePath("/resources/images/product/" + photo.getOriginalFilename());
        iProductService.add(product);
        return "redirect:/product/productPage";
    }

    //跳转到productPage
    @GetMapping(value = "productPage")
    public String productPage(Model model) {
        String hql = "from Product";
        Pager<Product> list = iProductService.pageList(hql, null);
        model.addAttribute("l", list);
        return "product";
    }

    //添加分类跳转
    @GetMapping(value = "addCategory")
    public String addCategory(Model model) {
        String hql ="from Parent_category";
        List<Parent_category> list =iParent_categoryService.list(hql);
        model.addAttribute("l",list);
        return "productClass-add";
    }

    //添加分类
    @PostMapping(value = "addCategory")
    public String addCategory(Pro_category pro_category,BindingResult br){
        iPro_categoryService.add(pro_category);
        return "redirect:/product/categoryManage";
    }

    //删除商品
    @RequestMapping(value = "delete/{id}",method = RequestMethod.GET)
    public String delete(@PathVariable int id){
        iProductService.delete(id);
        return "redirect:/product/productPage";
    }

    //跳转product-modify页面
    @RequestMapping(value = "modify/{id}",method = RequestMethod.GET)
    public String modify(@PathVariable int id,Model model){
        String hql = "from Pro_category";
        List<Pro_category> list = iPro_categoryService.list(hql);
        model.addAttribute("list", list);
        Product list1 =iProductService.load(id);
        model.addAttribute("product", list1);
        return "product-modify";
    }

    //修改商品
    @PostMapping(value = "update")
    public String update(Product product,
                      MultipartFile photo, BindingResult br, HttpSession session) throws IOException {
        //获取部署路径
        String path = session.getServletContext().getRealPath("/resources/images/product");

        //文件路径
        File file = new File(path + File.separator + photo.getOriginalFilename());
        //保存文件
        FileUtils.copyInputStreamToFile(photo.getInputStream(), file);
        product.setFilePath("/resources/images/product/" + photo.getOriginalFilename());
        System.out.println("==="+photo.getOriginalFilename()+product);
        iProductService.update(product);
        return "redirect:/product/productPage";
    }

    //跳转商品管理页面
    @GetMapping(value = "categoryManage")
    public String categoryManage(Model model){
        String hql="from Pro_category";
        Pager<Pro_category> list=iPro_categoryService.pageList(hql,null);
        model.addAttribute("list",list);
        return "productClass";
    }

    //删除分类
    @RequestMapping(value = "deleteCategory/{id}",method = RequestMethod.GET)
    public String deleteCategory(@PathVariable int id){
        iPro_categoryService.delete(id);
        return "redirect:/product/categoryManage";
    }

    //跳转修改分类页面
    @RequestMapping(value = "Classmodify/{id}",method = RequestMethod.GET)
    public String Classmodify(@PathVariable int id,Model model){
        String hql = "from Parent_category";
        List<Parent_category> list = iParent_categoryService.list(hql);
        Pro_category p=iPro_categoryService.load(id);
        model.addAttribute("p",p);
        model.addAttribute("list",list);
        return "productClass-modify";
    }

    //修改分类
    @PostMapping(value = "ClassUpdate")
    public String ClassUpdate(Pro_category pro_category){

        iPro_categoryService.update(pro_category);
        return "redirect:/product/categoryManage";
    }

    //跳转商品详情页面
    @GetMapping(value = "detail/{id}")
    public String detail(@PathVariable int id,Model model){
        Product p = iProductService.load(id);
        model.addAttribute("product",p);
        return "product-view";
    }

    public IPro_categoryService getiPro_categoryService() {
        return iPro_categoryService;
    }

    @Resource
    public void setiPro_categoryService(IPro_categoryService iPro_categoryService) {
        this.iPro_categoryService = iPro_categoryService;
    }

    public IProductService getiProductService() {
        return iProductService;
    }

    @Resource
    public void setiProductService(IProductService iProductService) {
        this.iProductService = iProductService;
    }
    @Resource
    public void setiParent_categoryService(IParent_categoryService iParent_categoryService) {
        this.iParent_categoryService = iParent_categoryService;
    }
}
