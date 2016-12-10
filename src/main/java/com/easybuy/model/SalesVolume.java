package com.easybuy.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Administrator on 2016/12/9.
 */
@Entity
@Table(name = "salesVolume")
public class SalesVolume {
    private int id;
    private String category_name;
    private String buyingTime;

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment",strategy = "increment")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getBuyingTime() {
        return buyingTime;
    }

    public void setBuyingTime(String buyingTime) {
        this.buyingTime = buyingTime;
    }
}
