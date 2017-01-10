/**
 * 新版本登录
 * @author zhangjg
 */

var login = (function () {
    var stateMap = {
        $container: null,
        $rememberMe: "?_spring_security_remember_me=1",
        $reltype: 1,
        refuse: false
    }, jqueryMap, domMap, regCheck, initModule, telRegist, allRegist, emailRegist, regist, bindEvent, login, showAlert, reRegist, rememberMe, isUsernameFormat, enableRegister, canRegeist, enableRegisterTeacher, enableRegisterStudent;

    jqueryMap = function () {
        var $container = stateMap.$container;
        domMap = {
            $alert: $container.find('.pager'),
            $registBtn: $container.find('.btn-regist'),
            $loginBtn: $container.find('.btn-login'),
            $account: $container.find('#account'),
            $pwd: $container.find('#pwd'),
            $register: $container.find('#reg_btn'),
            $loginer: $container.find('#login_btn'),
            $name: $container.find('#name'),
            $email: $container.find('#email'),
            $password: $container.find('#password'),
            $code: $container.find('#invite-code'),
            $remember: $container.find('.checkimg'),
            $employerType: $container.find('.select-content'),
            $home: $container.find('.homelink')
        };
    };

    //提示
    showAlert = function ($alert, text, timeout) {
        $alert.text(text).removeClass('none').addClass('success');
        setTimeout(function () {
            $alert.text('').addClass('none');
        }, timeout || 2000);

    };

    //记住我
    rememberMe = function () {
        if ($(this).hasClass("re-checked")) {
            $(this).removeClass('re-checked').addClass('re');
            stateMap.$rememberMe = "";
        } else {
            $(this).addClass('re-checked').removeClass('re');
            stateMap.$rememberMe = "?_spring_security_remember_me=1";
        }
    };

    login = function () {
        var email = $.trim(domMap.$account.val());
        var pwd = $.trim(domMap.$pwd.val());
        if (!email || !pwd) {
            showAlert(domMap.$alert, '邮箱或者密码不能为空');
            return;
        }
        var datas = {
            username: email,
            password: pwd
        };
        $.ajax({
            url: 'login' + stateMap.$rememberMe,
            type: 'post',
            data: datas,
            success: function (result) {
                console.log(result);
                if (result.errorCode == 0) {
                    if (stateMap.$rememberMe == "") {
                        localStorage.removeItem('UserName');
                        localStorage.removeItem('password');
                    } else {
                        localStorage.UserName = datas.username;
                        localStorage.password = datas.password
                    }
                    if (uri) {
                        location.replace(decodeURIComponent(uri));
                    } else if (callback) {
                        location.replace(callback + '&callback#!mlogin=1');
                    } else if (result.redirectUri) {
                        location.replace(result.redirectUri);
                    } else {
                        if (result.data.employerType == 1) {
                            location.replace(root + "/paper");
                        } else {
                            location.replace(root + "/class");
                        }
                    }
                } else if (result.errorCode == 5) {
                    showAlert(domMap.$alert, '帐号或密码错误,请检查后重新登录');
                } else if (result.errorCode === 11) {
                    $('.re-regist').removeClass('none')
                }
            }
        });
    };

    regist = function () {
        var name = $.trim(domMap.$name.val());
        var email = $.trim(domMap.$email.val());
        var password = $.trim(domMap.$password.val());
        var code = $.trim(domMap.$code.val()) || null
        console.log(password.split(""));
        if (name.split("").length < 2) {
            showAlert(domMap.$alert, '用户名最短为两位');
            return;
        }
        if (!name || !email || !password) {
            showAlert(domMap.$alert, '帐号、邮箱或者密码不能为空');
            return;
        }
        if (password.split("").length < 6) {
            showAlert(domMap.$alert, '密码长度最少为6位');
            return;
        }
        // 新增校验规则
        var datas = regCheck(email, code, name, password)
        if (!datas) {
            return false
        }
        console.log(datas)
        if (stateMap.$reltype == -1) {
            showAlert(domMap.$alert, '请选择正确的身份');
            return false;
        }
        if (stateMap.refuse) {
            reRegist(datas)
        }
        $.ajax({
            url: '/register/',
            type: 'post',
            data: JSON.stringify(datas),
			dataType: "html",
           // contentType: 'application/json',
            success: function (result) {
                console.log(result);
                if (result.errorCode == 0) {
                    if (callback) {
                        if (code) {
                            location.replace(root + '/paper');
                        } else {
                            location.replace(callback + '&callback#!mlogin=1');
                        }
                    } else {
                        location.replace(root + '/paper');
                    }
                } else if (result.errorCode == 3) {
                    showAlert(domMap.$alert, result.errorDesc.split('|')[1]);
                } else if (result.errorCode === 11) {
                    showAlert(domMap.$alert, result.errorDesc);
                    stateMap.refuse = true
                } else {
                    showAlert(domMap.$alert, result.errorDesc);
                }
            }
        });
    };

    regCheck = function (email, code, name, password) {
        var emailReg = new RegExp("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$");
        var phoneReg = new RegExp("^\\d{8,20}$");
        var datas = {
            employerName: name,
            password: password,
            employerType: stateMap.$reltype,
            inviteCode: code
        }
        if (allRegist) {
            if (emailReg.test(email)) {
                datas.email = email
            } else if (phoneReg.test(email)) {
                datas.phone = email
            } else {
                if (isUsernameFormat(email) == true) {
                } else {
                    showAlert(domMap.$alert, isUsernameFormat(email));
                    return false
                }
                datas.username = email
            }
        } else if (emailRegist && telRegist) {
            if (emailReg.test(email)) {
                datas.email = email
            } else if (phoneReg.test(email)) {
                datas.phone = email
            } else {
                showAlert(domMap.$alert, '请使用邮箱或手机进行注册')
                return false
            }
        } else if (emailRegist) {
            if (emailReg.test(email)) {
                datas.email = email
            } else {
                showAlert(domMap.$alert, '邮箱格式不正确')
                return false
            }
        } else if (telRegist) {
            if (phoneReg.test(email)) {
                datas.phone = email
            } else {
                showAlert(domMap.$alert, '手机格式不正确')
                return false
            }
        }

        return datas
    }

    reRegist = function (datas) {
        var data = {}
        if (datas.username) {
            data.account = datas.username
        } else if (datas.phone) {
            data.account = datas.phone
        } else {
            data.account = datas.email
        }
        data.password = datas.password
        $.ajax({
            url: root + '/account/open/reSaveEmployerPending',
            type: 'post',
            data: JSON.stringify(data),
            contentType: 'application/json',
            success: function (result) {
                console.log(result);
                if (result.errorCode == 0) {
                    stateMap.refuse = false
                    showAlert(domMap.$alert, '申请成功');
                } else if (result.errorCode == 3) {
                    showAlert(domMap.$alert, result.errorDesc.split('|')[1]);
                } else {
                    showAlert(domMap.$alert, result.errorDesc);
                }
            }
        });
    }

    isUsernameFormat = function (val) {
        val = val && val.trim()
        var err = "";
        if (!val) {
            err = '不能为空';
        } else if (/^\d+$/g.test(val)) {
            err = '登陆名不能是纯数字';
        } else if (/^_/.test(val)) {
            err = '不能以 _ 开头';
        } else if (/[@<>(){}*#]/.test(val)) {
            err = '不能包含特殊字符 @,<,>,(,),{,},*,#';
        } else if (val.length < 4 || val.length > 20) {
            err = '长度只能在 4-20 个字符之间';
        } else {
            err = true;
        }
        return err
    }

    canRegeist = function () {
        switch (window.SETS.env.loginType * 1) {
        case myconstant.constant.LoginType.SELF:
            enableRegister = true
            break
        case myconstant.constant.LoginType.COMPANY:
            enableRegister = true;
            enableRegisterTeacher = companyPerm & myconstant.constant.CompanyPerm.TEACHER_REGISTER
            enableRegisterStudent = companyPerm & myconstant.constant.CompanyPerm.STUDENT_REGISTER
            if (enableRegisterTeacher == 0 && enableRegisterStudent == 0)
                $('#reg_btn').addClass('none');
            else if (enableRegisterTeacher == 0) {
                $('.teacher').remove();
                stateMap.$reltype = 2;
            } else if (enableRegisterStudent == 0) {
                $('.student').remove();
                stateMap.$reltype = 1;
            } else {
                stateMap.$reltype = 1;
            }
            break
        case myconstant.constant.LoginType.COMPANY_SSO:
            enableRegister = false
            $('#reg_btn').addClass('none');
            break
        }
    }

    bindEvent = function () {
        domMap.$loginBtn.bind('click', login);
        domMap.$register.bind('click', function () {
            document.title = "注册";
            $('#login_box').hide();
            $('#reg_box').show();
            $('.reg-text-link').removeClass('none');
            $('.login-text-link').addClass('none');
            domMap.$account.val("");
            domMap.$pwd.val("");
        });
        domMap.$loginer.bind('click', function () {
            document.title = "登录";
            $('#login_box').show();
            $('#reg_box').hide();
            $('.login-text-link').removeClass('none');
            $('.reg-text-link').addClass('none');
            domMap.$name.val("");
            domMap.$email.val("");
            domMap.$password.val("");
        });
        domMap.$employerType.bind('change', function () {
            stateMap.$reltype = $(this).val();
        });
        $('.resetpw').bind('click', function () {
            location.href = root + "/resetPassword";
        });
        $('.fa-weixin').bind('click', function () {
            location.href = root + "/auth/open/redirect/4";
        });
        $('.fa-qq').bind('click', function () {
            location.href = root + "/auth/open/redirect/2";
        });
        $('.login-dingding').bind('click', function () {
            location.href = root + "/auth/open/redirect/5";
        });
        $('.login-mingdao').bind('click', function () {
            location.href = root + "/auth/open/redirect/6";
        });
        domMap.$registBtn.bind('click', regist);
        domMap.$remember.bind('click', rememberMe);
        domMap.$home.bind('click', function () {
            location.replace(root + '/home');
        });
        $('.re-regist').bind('click', function () {
            var email = $.trim(domMap.$account.val())
            var pwd = $.trim(domMap.$pwd.val())
            reRegist({email: email, password: pwd})
        })
    };

    initModule = function ($container) {
        stateMap.$container = $container;
        jqueryMap();
        bindEvent();
        canRegeist();
        if (window.SETS.company) {
            var _perm = window.SETS.company.perm
            allRegist = !!(_perm & myconstant.constant.CompanyPerm.USERNAME_REGISTER)
            emailRegist = !!(_perm & myconstant.constant.CompanyPerm.EMAIL_REGISTER)
            telRegist = !!(_perm & myconstant.constant.CompanyPerm.PHONE_REGISTER)
            console.log(enableRegister);
            if (allRegist) {
            } else if (emailRegist && telRegist) {
                domMap.$email.attr('placeholder', '邮箱/手机号')
                domMap.$account.attr('placeholder', '邮箱/手机号')
            } else if (emailRegist) {
                domMap.$email.attr('placeholder', '邮箱')
                domMap.$account.attr('placeholder', '邮箱')
            } else if (telRegist) {
                domMap.$email.attr('placeholder', '手机号')
                domMap.$account.attr('placeholder', '手机号')
            }
        } else {
            allRegist = true
        }

        if (companyDomain) {
            domMap.$code.addClass('none')
        }
        if (!plugin.isWeiXin()) {
            $('.login-wx').addClass('none');
        }
        if (localStorage.password && localStorage.UserName) {
            domMap.$account.val(localStorage.UserName);
            domMap.$pwd.val(localStorage.password);
        }
        if (type == 1) {
            domMap.$register.click();
        }
        if (code) {
            domMap.$code.val(code)
        }
    };

    return {
        initModule: initModule
    }
})(jQuery);
