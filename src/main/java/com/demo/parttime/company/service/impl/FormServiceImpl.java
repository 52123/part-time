package com.demo.parttime.company.service.impl;

import com.demo.parttime.company.entity.Form;
import com.demo.parttime.company.mapper.FormMapper;
import com.demo.parttime.company.service.IFormService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.parttime.util.BaseResp;
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
public class FormServiceImpl extends ServiceImpl<FormMapper, Form> implements IFormService {

    @Override
    public BaseResp signUp(Integer userId, Integer pId) {
        String index = userId + "_" + pId;
        Form form = (Form)new Form().selectById(index);
        if(form == null){
            form = new Form();
            form.setUserId(userId);
            form.setPId(pId);
            form.setId(index);
            return form.insert() ? BaseResp.success() : BaseResp.fail();
        }
        return BaseResp.success();
    }
}
