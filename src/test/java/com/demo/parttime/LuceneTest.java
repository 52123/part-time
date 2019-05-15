package com.demo.parttime;

import com.alibaba.fastjson.JSON;
import com.demo.parttime.company.dto.resp.PartTimeSectionResp;
import com.demo.parttime.company.entity.Pinfo;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.document.*;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wltea.analyzer.lucene.IKAnalyzer;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;

/**
 * @author 52123
 * @since 2019/5/14 2:52
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = PartTimeApplication.class)
public class LuceneTest {

    @Resource
    private IndexSearcher indexSearcher;

    @Resource
    private IndexWriter indexWriter;

    @Resource
    private Analyzer analyzer;

    @Test
    public void searchField(){
        Query query = new TermQuery(new Term("title","私人"));
//        Query query = new PhraseQuery("title","私人");
//        Query query2 = new TermQuery(new Term("title","人"));


//        System.out.println(query.toString());
        try {
//            Query query = new QueryParser("title",analyzer).parse("*:*");
            TopDocs topDocs = indexSearcher.search(query,100);
            System.out.println(topDocs.totalHits);
            for (ScoreDoc scoreDoc : topDocs.scoreDocs){
                System.out.println(indexSearcher.doc(scoreDoc.doc).get("title"));
                System.out.println(indexSearcher.doc(scoreDoc.doc).get("address"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 每天十二点更新索引库
     */
//    @Scheduled(cron = "0 0 0 * * ? ")

    @Test
    @SuppressWarnings("unchecked")
    public void updateIndex() {
        List<Pinfo> pinfoList = new Pinfo().selectAll();

        try {
            indexWriter.deleteAll();
            for (Pinfo info : pinfoList) {
                Document document = new Document();
                PartTimeSectionResp resp = new PartTimeSectionResp();
                resp.setAddress(info.getAddress());
                resp.setCreateTimeToString(info.getCreateTime());
                resp.setId(info.getId());
                resp.setLongTerm(info.getLongTerm());
                resp.setSalary(info.getSalary());
                resp.setTitle(info.getTitle());
                resp.setCompanyName(info.getCompanyName());
                document.add(new Field("title", info.getTitle(), TextField.TYPE_STORED));
                document.add(new Field("address", info.getAddress(), TextField.TYPE_STORED));
                document.add(new StringField("publish", info.getPublish().toString(), Field.Store.YES));
                document.add(new StringField("status", info.getStatus().toString(), Field.Store.YES));
                document.add(new StringField("category",info.getCategoryId().toString(), Field.Store.YES));
                document.add(new StoredField("data", JSON.toJSONString(resp)));
                indexWriter.addDocument(document);
            }
            indexWriter.commit();
            indexWriter.close();
        } catch (Exception e) {
        }
    }

}
