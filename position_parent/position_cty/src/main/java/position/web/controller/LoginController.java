package position.web.controller;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.RandomUtil;
import com.alibaba.fastjson.JSONObject;
import position.web.cty.entity.Result;
import position.web.cty.entity.StatusCode;
import position.web.cty.redis.util.RedisUtil;
import position.web.cty.util.JwtUtil;
import position.web.cty.util.MD5Util;
import position.web.cty.util.PasswordUtil;
import position.web.cty.util.oConvertUtils;
import position.web.cty.vo.LoginUser;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import position.web.message.EmailSendMsgHandle;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import position.web.pojo.SysLoginModel;
import position.web.pojo.User;
import position.web.service.UserService;

/**
 * @Author cty
 * @since 2022-6-21
 */
@RestController
@RequestMapping("/sys")
@Api(tags = "用户登录")
@CrossOrigin
public class LoginController {

    @Autowired
    RedisUtil redisUtil;

    @Autowired
    UserService userService;

    @ApiOperation("发送邮箱验证")
    @PostMapping(value = "/sms")
    public Result sms(@RequestBody JSONObject jsonObject) {
        // 验证信息
        String mail = jsonObject.get("mail").toString();
        String mode = jsonObject.get("mode").toString();
        if (oConvertUtils.isEmpty(mail)) {
            return new Result(false, StatusCode.ERROR, "邮箱不允许为空");
        }
        Object object = redisUtil.get(mail);
        if (object != null) {
            return new Result(false, StatusCode.ERROR, "验证码尚未过期！");
        }

        // 生成随机数
        String captcha = RandomUtil.randomNumbers(6);
        JSONObject obj = new JSONObject();
        obj.put("code", captcha);

        User user = userService.findUserByEmail(mail);
        // 注册
        if (StatusCode.SMS_TPL_TYPE_1.equals(mode)) {
            if (user != null) {
                return new Result(false, StatusCode.ERROR, "该邮箱已经注册，请直接登录");
            }
            new EmailSendMsgHandle().SendMsg(mail, "注册验证", "您正在注册云职位平台账号，验证码为：" + captcha + "，10分钟内有效");

        } else {
            Result result = userService.checkUserIsEffective(user);
            if (!result.isFlag()) {
                return result;
            }
            if (StatusCode.SMS_TPL_TYPE_0.equals(mode)) {
                new EmailSendMsgHandle().SendMsg(mail, "登录验证", "您正在登录云职位平台，验证码为：" + captcha + "，10分钟内有效");

            } else if (StatusCode.SMS_TPL_TYPE_2.equals(mode)) {
                new EmailSendMsgHandle().SendMsg(mail, "找回密码", "您正在云职位平台找回密码，验证码为：" + captcha + "，10分钟内有效");

            }
        }
        redisUtil.set(mail, captcha, 600);
        return new Result(true, StatusCode.OK, "已经向邮箱发送验证码，请注意查收");
    }

    @ApiOperation("登录接口")
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Result login(@RequestBody SysLoginModel loginModel){
        String username = loginModel.getUsername();
        String password = loginModel.getPassword();
        String captcha = loginModel.getCaptcha();

        if (captcha == null){
            return new Result(false, StatusCode.FAILED, "验证码无效");
        }
        String lowerCaseCaptcha = captcha.toLowerCase();
        String realKey = MD5Util.MD5Encode(lowerCaseCaptcha+loginModel.getCheckKey(), "utf-8");
        Object checkCode = redisUtil.get(realKey);
        if (checkCode == null){
            return new Result(false, StatusCode.FAILED, "验证码已过期，请刷新");
        }
        if (!checkCode.toString().equals(lowerCaseCaptcha)){
            return new Result(false, StatusCode.FAILED, "验证码错误");
        }
        User user = userService.findUserByUsername(username);
        Result res = userService.checkUserIsEffective(user);
        if (!res.isFlag()){
            return res;
        }
        String usrPwd = PasswordUtil.encrypt(username, password, user.getSalt());
        String sysPwd = user.getPassword();
        if (!sysPwd.equals(usrPwd)){
            return new Result(false, StatusCode.FAILED, "用户名或密码错误");
        }
        Result result = loginInfo(user);
        redisUtil.del(realKey);
        LoginUser loginUser = new LoginUser();
        BeanUtils.copyProperties(user, loginUser);
        StpUtil.login(user.getId());
        StpUtil.getTokenSession().set("user", loginUser);
        System.out.println(StpUtil.getTokenInfo().toString());
        return result;
    }

    /**
     * 用户登录
     * */
    private Result loginInfo(User user){
        String pwd = user.getPassword();
        Long id = user.getId();
        JSONObject obj = new JSONObject();
        String token = JwtUtil.sign(id, pwd);
        redisUtil.set(StatusCode.PREFIX_USER_TOKEN+token, token);
        redisUtil.expire(StatusCode.PREFIX_USER_TOKEN + token, JwtUtil.EXPIRE_TIME * 2 / 1000);
        obj.put("token", token);
        obj.put("userInfo", user);
        return new Result(true, StatusCode.OK, "登录成功", obj);
    }
}
