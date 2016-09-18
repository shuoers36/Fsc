package com.hfsc.model;

import java.util.List;
import java.util.Map;

/**
 * Created on 2015年8月31日<br>
 * Title: 分页对象
 * Description: 存放分页数据
 * 属性定义如下：
 * records-总记录数，long
 * totalPage-总页数，long
 * page-当前页数，int
 * rows-每页记录数，int
 * sidx-过滤字段，String
 * sord-排序方式，String，取值“asc”、“desc”
 * gridMapData-分页数据,存放Map格式数据，List&lt;Map&lt;String, Object&gt;&gt;
 * gridObjectData-分页数据,存放Object对象数据，List&lt;Object&gt;，使用数据时强转为实际的对象
 * 
 * @version 1.0
 */
public class Page {
    
    /**
     * 总记录数
     */
    private long records;
    
    /**
     * 总页数
     */
    private long totalPage;
    
    /**
     * 当前页数
     */
    private int page;
    
    /**
     * 每页记录数
     */
    private int rows;
    
    /**
     * 过滤字段
     */
    private String sidx;
    
    /**
     * 排序方式
     */
    private String sord = "asc";
    
    /**
     * 分页数据,存放Map格式数据
     */
    private List<Map<String, Object>> gridMapData;
    
    /**
     * 分页数据,存放Object对象数据
     */
    private List<Object> gridObjectData;
    
    public long getRecords() {
        return records;
    }
    
    public long getTotalPage() {
        if (records > 0 && rows > 0)
            this.totalPage = records % rows == 0 ? records / rows
                                                : records / rows + 1;
        return totalPage;
    }
    
    public void setTotalPage(long totalPage) {
        this.totalPage = totalPage;
    }
    
    public List<Map<String, Object>> getGridMapData() {
        return gridMapData;
    }
    
    public void setGridMapData(List<Map<String, Object>> gridMapData) {
        this.gridMapData = gridMapData;
    }
    
    public List<Object> getGridObjectData() {
        return gridObjectData;
    }
    
    public void setGridObjectData(List<Object> gridObjectData) {
        this.gridObjectData = gridObjectData;
    }
    
    public void setRecords(long records) {
        this.records = records;
    }
    
    public int getPage() {
        return page;
    }
    
    public void setPage(int page) {
        this.page = page;
    }
    
    public int getRows() {
        return rows;
    }
    
    public void setRows(int rows) {
        this.rows = rows;
    }
    
    public String getSidx() {
        return sidx;
    }
    
    public void setSidx(String sidx) {
        this.sidx = sidx;
    }
    
    public String getSord() {
        return sord;
    }
    
    public void setSord(String sord) {
        this.sord = sord;
    }
}
