package com.lyx.silversea.controller.system;import com.lyx.silversea.common.respon.AppResponse;import com.lyx.silversea.domain.system.User;import com.lyx.silversea.service.system.UserService;import lombok.extern.slf4j.Slf4j;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Controller;import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.web.bind.annotation.RestController;import javax.servlet.http.HttpServletRequest;import javax.xml.ws.RequestWrapper;/** * @author liuyanxin @gvSoft * @create 2018-12-21 16:33 **/@RestControllerpublic class LoginController {    @Autowired    private UserService userService;    @RequestMapping("userLogin")    public AppResponse userLogin(String loginname, String password, HttpServletRequest request, User user){        User userInfo = null;        userInfo = userService.loginUserInfo(loginname,password);        if (userInfo == null) {            System.out.println("登录失败！");        } else{            System.out.println("登录成功！");        }        return null;    }}