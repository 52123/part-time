package com.demo.parttime.wx.service;

import com.demo.parttime.util.BaseResp;
import com.demo.parttime.wx.entity.Resume;
import com.baomidou.mybatisplus.extension.service.IService;
import com.demo.parttime.wx.entity.User;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 52123
 * @since 2019-02-19
 */
public interface IResumeService extends IService<Resume> {

    /**
     *  保存用户简介
     * @param user 用户
     * @param resume 简介
     * @return 返回成功或否
     */
    BaseResp saveResume(User user, Resume resume);
}
