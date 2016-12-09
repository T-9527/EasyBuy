package com.easybuy.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by Administrator on 2016/12/7.
 */
@Entity
@Table(name = "pro_category")
public class Pro_category {
    private int id;//分类编号
    private String name;//分类名
    private Parent_category parent_category;//父分类

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment",strategy = "increment")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @ManyToOne
    @JoinColumn(name = "parent_category_id")
    public Parent_category getParent_category() {
        return parent_category;
    }

    public void setParent_category(Parent_category parent_category) {
        this.parent_category = parent_category;
    }
}
