package com.demo.parttime.common.search;

import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.Query;


/**
 * @author 52123
 * @since 2019/5/15 1:10
 */
public class LuceneQuery{

    private Integer pageSize = 20;

    private Integer pageNum = 1;

    private BooleanQuery.Builder booleanBuild = new BooleanQuery.Builder();

    private BooleanClause.Occur defalutOccur = BooleanClause.Occur.MUST;

    public void addQuery(Query query){
        if(query != null){
            this.addQuery(query,defalutOccur);
        }
    }

    public void addQuery(Query query, BooleanClause.Occur occur){
        if(query != null && occur != null) {
            booleanBuild.add(query, occur);
        }
    }

    public BooleanQuery getQuery(){
        return booleanBuild.build();
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize > 0 ? pageSize : this.pageSize ;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum < 1 ? 1 : pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public Integer getPageNum() {
        return pageNum;
    }

}
