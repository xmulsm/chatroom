var _logined_acct = null;
var _login_check_loading = false;
var _login_check_handle = setInterval("loginCheck()", 20000);

function loginCheck()
{
    //页面里有禁止自动检测标志时就退出
    if ($("#not_login_check").length)
    {
        clearInterval(_login_check_handle);
        return;
    }

    if (_login_check_loading) return;
    
    _login_check_loading = true;
    
    $.post
    (
        "/login/check",
        "",
        function(data)
        {
            if (_logined_acct == null)
            {
                _logined_acct = data.account;
            }
            
            if (data.account == null || data.account != _logined_acct)
            {
                clearInterval(_login_check_handle);
                
                if (!$("#auto_login").val()) //自动登录时不提示失效信息
                {
                    alert(data.account != _logined_acct ? "登录用户已改变，请重新登录" : "登录状态已失效，请重新登录");
                }
                
                top.location.href = data.url;
            }
        }
    )
    .complete(function()
     {
        _login_check_loading = false;
     });
}
