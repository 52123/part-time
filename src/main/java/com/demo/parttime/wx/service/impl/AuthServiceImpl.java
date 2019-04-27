package com.demo.parttime.wx.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.parttime.util.BaseResp;
import com.demo.parttime.wx.entity.Auth;
import com.demo.parttime.wx.entity.User;
import com.demo.parttime.wx.mapper.AuthMapper;
import com.demo.parttime.wx.service.IAuthService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 52123
 * @since 2019-04-27
 */
@Service
public class AuthServiceImpl extends ServiceImpl<AuthMapper, Auth> implements IAuthService {

    @Override
    public BaseResp saveAuthInfo(User user, Auth auth) {
        Auth oldAuth = (Auth)new Auth().selectOne(new QueryWrapper<Auth>().eq("user_id",user.getId()));
        if(oldAuth != null){
            oldAuth.setCollege(auth.getCollege());
            oldAuth.setGrade(auth.getGrade());
            oldAuth.setName(auth.getName());
            oldAuth.setStudentId(auth.getStudentId());
            oldAuth.setSchool(auth.getSchool());
            oldAuth.setStatus(0);
            return oldAuth.updateById() ? BaseResp.success() : BaseResp.fail();
        }else{
            auth.setUserId(user.getId());
            return auth.insert() ? BaseResp.success() : BaseResp.fail();
        }
    }
}
