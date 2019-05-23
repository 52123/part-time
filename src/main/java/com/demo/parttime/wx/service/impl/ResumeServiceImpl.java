package com.demo.parttime.wx.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.parttime.common.model.BaseResp;
import com.demo.parttime.wx.entity.Resume;
import com.demo.parttime.wx.entity.User;
import com.demo.parttime.wx.mapper.ResumeMapper;
import com.demo.parttime.wx.service.IResumeService;
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
public class ResumeServiceImpl extends ServiceImpl<ResumeMapper, Resume> implements IResumeService {

    @Override
    public BaseResp saveResume(User user, Resume resume) {
        // todo 后期扩展一用户对多简介
        Resume oldResume = (Resume)new Resume().selectOne(new QueryWrapper<Resume>()
                                        .eq("user_id",user.getUserId()));
        if(oldResume != null){
            oldResume.setAge(resume.getAge());
            oldResume.setBirthDate(resume.getBirthDate());
            oldResume.setIntroduce(resume.getIntroduce());
            oldResume.setMobile(resume.getMobile());
            oldResume.setName(resume.getName());
            return oldResume.updateById() ? BaseResp.success():BaseResp.fail();
        }else{
            resume.setUserId(user.getUserId());
            return resume.insert() ? BaseResp.success():BaseResp.fail();
        }
    }
}
