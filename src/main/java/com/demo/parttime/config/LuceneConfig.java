package com.demo.parttime.config;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.SearcherManager;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.wltea.analyzer.lucene.IKAnalyzer;


import java.io.IOException;
import java.nio.file.Paths;

/**
 * @author 52123
 * @since 2019/5/13 23:56
 */
@Configuration
public class LuceneConfig {

    /**
     *  创建一个Analyzer实例
     */
    @Bean
    public Analyzer analyzer(){
        return new IKAnalyzer(true);
    }

    /**
     *  索引位置
     */
    @Bean
    public Directory directory() throws IOException {
        return FSDirectory.open(Paths.get("/luceneIndex/"));
    }

    /**
     * 创建 IndexWriterConfig
     */
    @Bean
    public IndexWriter indexWriter(Directory directory, Analyzer analyzer) throws IOException {
        // 设置创建索引使用哪一种分词器
       IndexWriterConfig indexWriterConfig = new IndexWriterConfig(analyzer);
       return new IndexWriter(directory,indexWriterConfig);
    }

    @Bean
    public IndexSearcher indexSearcher(Directory directory) throws IOException {
        DirectoryReader directoryReader = DirectoryReader.open(directory);
        return new IndexSearcher(directoryReader);
    }

}
