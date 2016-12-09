package com.easybuy.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by Administrator on 2016/12/7.
 */
@Entity
@Table(name = "product")
public class Product {
    private int id;//商品编号
    private String discription;//描述
    private String p_name;//商品名称
    private double price;//商品价格
    private int stock;//库存
    private String filePath;//文件路径
    private String address;//生产地区
    private Pro_category pro_category;//所属分类；

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment",strategy = "increment")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    @ManyToOne
    @JoinColumn(name = "pro_category_id")
    public Pro_category getPro_category() {
        return pro_category;
    }

    public void setPro_category(Pro_category pro_category) {
        this.pro_category = pro_category;
    }

    public Product() {
    }
}
