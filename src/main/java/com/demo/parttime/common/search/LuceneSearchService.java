package com.demo.parttime.utils.search;

import lombok.extern.slf4j.Slf4j;
import org.apache.lucene.index.IndexableField;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 *  目前只用于搜索兼职列表，以后加其他
 * @author 52123
 * @since 2019/5/15 1:06
 */
@Service
@Slf4j
public class LuceneSearchService {

    @Resource
    private IndexSearcher indexSearcher;

    public LuceneResult search(LuceneQuery query){

        BooleanQuery booleanQuery = query.getQuery();
        Integer pageNum = query.getPageNum();
        Integer pageSize = query.getPageSize();

        log.info("开始检索: booleanQuery -->{}  \n pageNum -- > {}" +
                "  pageSize --> {}",booleanQuery, pageNum, pageSize);

        // 如果是首页，则直接查询，否则就间接查询以达到分页效果
        try {
           TopDocs topDocs =  pageNum == 1 ? indexSearcher.search(booleanQuery, pageSize)
                    : pagingSearch(booleanQuery, pageNum, pageSize);

           // 把数据封装到LuceneResult
            LuceneResult result = new LuceneResult();
            result.setTotalHits(topDocs.totalHits);

            // Map for data
            List<Map<String, String>> data = new LinkedList<>();
            for (ScoreDoc scoreDoc : topDocs.scoreDocs){
                Map<String, String> map = new HashMap<>(16);
                for(IndexableField field : indexSearcher.doc(scoreDoc.doc).getFields()){
                    map.put(field.name(),field.stringValue());
                }
                data.add(map);
            }
            result.setData(data);
            return result.success();
        } catch (IOException e) {
            log.error("检索失败 " , e);
            return new LuceneResult().fail(e.getMessage());
        }
    }

    private TopDocs pagingSearch(BooleanQuery booleanQuery, Integer pageNum, Integer pageSize)
            throws IOException{

        // 先获取目标页的前面部分
        int start = (pageNum - 1) * pageSize;
        TopDocs beforeDocs = indexSearcher.search(booleanQuery,start);
        ScoreDoc beforeScore = beforeDocs.scoreDocs[start - 1];

        return indexSearcher.searchAfter(beforeScore, booleanQuery, pageSize);
    }
}
