package com.demo.parttime.wx.service.impl;

import com.demo.parttime.company.annotation.ObjectCacheable;
import com.demo.parttime.util.BaseResp;
import com.demo.parttime.wx.dto.resp.SchoolInfoResp;
import com.demo.parttime.wx.entity.School;
import com.demo.parttime.wx.mapper.SchoolMapper;
import com.demo.parttime.wx.service.ISchoolService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 52123
 * @since 2019-04-28
 */
@Service
public class SchoolServiceImpl extends ServiceImpl<SchoolMapper, School> implements ISchoolService {

    private static final String STRING_CUT = "\\|";

    @Override
    @SuppressWarnings("unchecked")
    @ObjectCacheable(key = "schoolList", readObject = false)
    public BaseResp getSchoolList() {
        List<School> schoolList = new School().selectAll();
        List<SchoolInfoResp> respList = new ArrayList<>();
        for(School school : schoolList){
            SchoolInfoResp resp = new SchoolInfoResp();

            // 拆分学院数据为list
            List<String> colleges = new ArrayList<>();
            colleges.addAll(Arrays.asList(school.getCollege().split(STRING_CUT)));

            // 拆分年级数据为list
            List<Integer> grades = new ArrayList<>();
            for(String grade : school.getGrade().split(STRING_CUT)){
                grades.add(Integer.valueOf(grade));
            }

            resp.setCollege(colleges);
            resp.setGrade(grades);
            resp.setSchool(school.getSchool());
            respList.add(resp);
        }
        return BaseResp.success(respList);
    }
}
