package com.demo.parttime.admin.service.impl;

import com.demo.parttime.admin.entity.Comment;
import com.demo.parttime.admin.mapper.CommentMapper;
import com.demo.parttime.admin.service.ICommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 52123
 * @since 2019-02-19
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService {

}
