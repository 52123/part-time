package com.demo.parttime.common.timer;

import com.alibaba.fastjson.JSON;
import com.demo.parttime.company.dto.resp.PartTimeSectionResp;
import com.demo.parttime.company.entity.Pinfo;
import lombok.extern.slf4j.Slf4j;
import org.apache.lucene.document.*;
import org.apache.lucene.index.IndexWriter;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 52123
 * @since 2019/5/14 1:12
 */

@Component
@Slf4j
@EnableScheduling
public class CreateOrUpdateIndex {

    @Resource
    private IndexWriter indexWriter;

    /**
     * 每天十二点更新索引库
     */
    @SuppressWarnings("unchecked")
    @Scheduled(cron = "0 0 0 * * ?")
    public void updateIndex() {
        List<Pinfo> pinfoList = new Pinfo().selectAll();
        try {
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
        } catch (Exception e) {
            log.error("创建索引失败：{}", e.getMessage());
        }
    }

}
