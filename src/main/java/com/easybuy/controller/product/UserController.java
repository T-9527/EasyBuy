package com.easybuy.controller.product;
import com.easybuy.service.product.ISalesVolumeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.*;
import java.util.List;

/**
 * Created by Administrator on 2016/12/10.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    private ISalesVolumeService iSalesVolumeService;
    @Resource
    public void setiSalesVolumeService(ISalesVolumeService iSalesVolumeService) {
        this.iSalesVolumeService = iSalesVolumeService;
    }
        private char mapTable[]={
                'a','b','c','d','e','f',
                'g','h','i','j','k','l',
                'm','n','o','p','q','r',
                's','t','u','v','w','x',
                'y','z','0','1','2','3',
                '4','5','6','7','8','9'};
        /**
         * 功能:生成彩色验证码图片
         * 参数width为生成图片的宽度,参数height为生成图片的高度,参数os为页面的输出流
         */
        @GetMapping(value = "login")
    public void getCertPic(HttpServletRequest request, HttpServletResponse response) throws IOException {
            int width=80;
            int height=25;
        if(width<=0)width=60;
        if(height<=0)height=20;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        // 获取图形上下文
        Graphics g = image.getGraphics();
        // 设定背景色
        g.setColor(new Color(0xDCDCDC));
        g.fillRect(0, 0, width, height);
        //画边框
        g.setColor(Color.black);
        g.drawRect(0,0,width-1,height-1);
        // 取随机产生的认证码
        String strEnsure = "";
        // 4代表4位验证码,如果要生成更多位的认证码,则加大数值
        for(int i=0; i<4; ++i) {
            strEnsure+=mapTable[(int)(mapTable.length*Math.random())];
        }
        //将生成的验证码存到session
        request.getSession().setAttribute(strEnsure,strEnsure);
        // 　　将认证码显示到图像中,如果要生成更多位的认证码,增加drawString语句
        g.setColor(Color.orange);
        g.setFont(new Font("Atlantic Inline",Font.PLAIN,18));
        String str = strEnsure.substring(0,1);
        g.drawString(str,8,17);
        str = strEnsure.substring(1,2);
        g.drawString(str,20,15);
        str = strEnsure.substring(2,3);
        g.drawString(str,35,18);
        str = strEnsure.substring(3,4);
        g.drawString(str,45,15);
        // 随机产生10个干扰点
        Random rand = new Random();
        for (int i=0;i<10;i++) {
            int x = rand.nextInt(width);
            int y = rand.nextInt(height);
            g.drawOval(x,y,3,3);
        }
        // 释放图形上下文
        g.dispose();
            // 输出图像到页面
            ImageIO.write(image, "JPEG", response.getOutputStream());
            //后台输出验证码
            System.out.println(strEnsure+"==");

    }

    //富山小胖验证码的实现方法
    public void Validatelogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //设置浏览器 缓存
        response.setContentType("image/jpeg");
        response.setHeader("pragma","no-cache");
        response.setHeader("cache-control","no-cache");
        response.setHeader("expires","0");
//        定义验证码长度
        int length=4;
//        接受验证码
        String valcode="";
        Random rd= new Random();
//        生成验证码
        for (int i = 0; i <length ; i++) {
            valcode+=rd.nextInt(10);
        }
        //将验证码存入session 方便比对
        request.getSession().setAttribute("valcode",valcode);
        //定义图片的属性
        int width=80;
        int height=25;
        BufferedImage img=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics g=img.getGraphics();
//        填充背景
        g.setColor(Color.orange);
        g.fillRect(0,0,width,height);
//        填充干扰线
        for (int i = 0; i <100 ; i++) {
            g.setColor(new Color(rd.nextInt(100)+155,rd.nextInt(100)+155,rd.nextInt(100)+155));
            g.drawLine(rd.nextInt(width),rd.nextInt(height),rd.nextInt(width),rd.nextInt(height));
        }
//        设置边框
        g.setColor(Color.gray);
        g.drawRect(0,0,width-1,height-1);
//        绘制验证码
        Font[] font={new Font("隶书",Font.BOLD,18),new Font("楷体",Font.BOLD,18),new Font("宋体",Font.BOLD,18),new Font("微软雅黑",Font.BOLD,18)};
        for (int i = 0; i <length ; i++) {
            g.setColor(new Color(rd.nextInt(150),rd.nextInt(150),rd.nextInt(150)));
            g.setFont(font[rd.nextInt(font.length)]);
            g.drawString(valcode.charAt(i)+"",width/valcode.length()*i+2,18);
        }
        g.dispose();
        ImageIO.write(img,"jpeg",response.getOutputStream());
    }

    @PostMapping(value = "realLogin")
    public String login(String username, String password, String code,HttpServletRequest request){
       /* if(code.equals(request.getSession().getAttribute(code))){
            System.out.println("yes!");
        }else {
            System.out.println("no!");
        }*/
       //谷歌kaptcha验证码
        if (code.equals(request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY))){
            System.out.println("yes!");
        }else {
            System.out.println("no!");
        }
        return "";
    }

    //销量
    @GetMapping(value = "salesVolume")
    public String salesVolume(Model model){
        String hql="select count(id),category_name from SalesVolume group by category_name";
        List list =  iSalesVolumeService.getCount(hql);
        Iterator it = list.iterator();
        while (it.hasNext()){
            Object[] results =(Object[]) it.next();
            System.out.println("---"+results[0]+"--"+results[1]);
        }
        model.addAttribute("list",list);
        return "salesVolume";
    }

    //跳转k线图页面
    @GetMapping(value = "k")
    public String k(){
        return "K";
    }
}
