/*
 * 表单验证，所要验证的条件在写在input标签里，本方法的验证方式为提交时验证
 * 页面上只要引用该js，可自动验证表单，无需写事件调用
 *    
 *  SHOW_NAME  文本框名称 用于错误信息提示
 *   NULLABLE  是否可以为空 0-不能为空
 *     NUMBER  是否为数值类型 1-必须为数值类型
 *      EAMIL  是否需要邮箱验证 1——需要邮箱验证
 *  MIN_VALUE  最小值
 *  MAX_VALUE  最大值
 * MIN_LENGTH  最小长度
 * MAX_LENGTH  最大长度
 *    DEMICAL  只能输入数值型数据，且小数位数不能大于DEMICAL位
 *    
 *    KEY_INT  是否绑定键盘只能输入整数事件：  1=只能输入正整数、 2=只能输入整数    
 *  KEY_FLOAT  是否绑定键盘只能输入浮点数事件： ：  1=只能输入正浮点数、 2=只能输入浮点数
 *
 * example:
 *     ***表示所要提示的错误信息的前缀名
 *        <input type="text" SHOW_NAME="账号"><div id="err_msg"></div>
 *     ***表示显示错误信息的div的id，该标签为空，默认按alert()提示错误信息
 *        <input type="text" ERROR_MSG_ID="err_msg"><div id="err_msg"></div>
 *     ***表示不能为空且必须为数值类型
 *        <input type="text" NULLABLE="0" NUMBER="1">
 *        ***表示最小值不能小于3，最大值不能大于6
 *        <input type="text" MIN_VALUE="3" MAX_VALUE="6">
 *        ***表示字符不能小于3位，不能大于6
 *        <input type="text" MIN_LENGTH="3" MAX_LENGTH="6">
 *        ***表示只能输入整数，且小数位数不能大于两位
 *        <input type="text" DEMICAL="2">
 *     
 *  引用js和css文件即可验证form表单：
 *       <script type="text/javascript" src="/js/rock.validate.js"></script>
 *       <script type="text/javascript" src="/js/jquery.min.js"></script>
 *       <link rel="stylesheet" href="/css/public.css" type="text/css"></link>
 *  
 *  其他可单独调用验证方法： 
 *  inputValidate:function(input) 验证单个文本框的方法，input表示一个input对象
 *  isDemical:function(value,digit)判断是否是整数，且位数在规定位数内，可以为负，value——需要判断的数 digit——小数位数
 *  isNegDemical:function(value,digit)判断是否是整数，且位数在规定位数内，不可以为负，value——需要判断的数 digit——小数位数
 *  isDate:function(format, value)判断是否是日期格式 format——所要验证的日期格式(如：yyyymmdd) value——所要验证的值
 *
 *  create by hjj 2010-02-02
 */
$(document).ready(function()
{
    // KEY_INT 绑定键盘事件,限制只能输入正整数
    $("input[KEY_INT=1]").addClass("number")
    .on("keyup", function(event)
    {
        var keyCode = event.which;
        validate.onlyInputInt(this, keyCode);
    })
    .on("blur", function(event)
    {
        validate.onlyInputInt(this);
    });
    
    // KEY_INT 绑定键盘事件,限制只能输入正负整数
    $("input[KEY_INT=2]").addClass("number")
    .on("keyup", function(event)
    {
        var keyCode = event.which;
        validate.onlyInputSignedInt(this, keyCode);
    })
    .on("blur", function(event)
    {
        validate.onlyInputSignedInt(this);
    });
    
    
    // KEY_FLOAT 绑定键盘事件,限制只能输入正浮点数
    $("input[KEY_FLOAT=1]").addClass("number")
    .on("keyup", function(event)
    {
        var keyCode = event.which;
        validate.onlyInputFloat(this, keyCode);
    })
    .on("blur", function(event)
    {
        validate.onlyInputFloat(this);
    });

    // KEY_FLOAT 绑定键盘事件,限制只能输入正负浮点数
    $("input[KEY_FLOAT=2]").addClass("number")
    .on("keyup", function(event)
    {
        var keyCode = event.which;
        validate.onlyInputSignedFloat(this, keyCode);
    })
    .on("blur", function(event)
    {
        validate.onlyInputSignedFloat(this);
    });
    
    validate.inputValidate(this, true);

    try
    {
        //在ie下, 如果对象不可见时, 对其focus会提示错误
        var focusObj = $("[tabIndex='1']");
        if (focusObj.length == 0)
            $("input:not(.Wdate,#page_size,#current_page):first").focus();
        else
            focusObj.focus();
    }
    catch (e)
    {
    }

    $("form").submit(function()
    {
        return validate.formValidate();
    });
});

var validate =
{
    /**
     * session失效验证
     * @param data
     */
    loginValidate:function(data)
    {
        if (typeof(data.error) == "undefined") //登录已失效
        {
            //alert("登录已失效，请重新登录");
            document.open("text/html", "replace");
            document.write(data);
            document.close();
        }
    },
    
    formValidate:function()
    {
        var retval = true;
        
        $("form input").each(function()
        {
            var inputType = nvl($(this).attr("type"), "text");

            if (inputType == "text" || inputType == "password" || inputType == "file")
            {
                if(!validate.inputValidate($(this)))
                {
                    retval = false;
                    return false;
                }
            }
        });
        
        if (!retval) return false;
            
        $("form textarea").each(function()
        {
            if (!validate.inputValidate($(this)))
            {
                retval = false;
                return false;
            }
        });
        
        return retval;
    },

    /*
     *   NULLABLE      是否可以为空 0——不能为空
     *   NUMBER        是否可以是数值类型 1——必须为数值类型 
     *   MIN_VALUE     允许输入的最小值
     *   MIN_VALUE     允许输入的最大值
     *   SHOW_NAME     提示错误信息要显示的名称
     *   MIN_LENGTH    输入的最少字符数
     *   MAX_LENGTH    输入的最大字符数
     *   DEMICAL       允许输入的小数位数
     *   EMAIL         是否需要验证邮箱格式 1——验证
     */
    inputValidate:function(input, ignoreName) 
    {
        input = $(input);
        
        if (!ignoreName && typeof(input.attr("name"))=="undefined")
        {
            return true;
        }
        
        var nullable     = input.attr('NULLABLE');
        var number       = input.attr('NUMBER');
        var email        = input.attr('EMAIL');
        var decimal      = input.attr('DECIMAL');
        var minValue     = input.attr('MIN_VALUE');
        var maxValue     = input.attr('MAX_VALUE');
        var minLength    = input.attr('MIN_LENGTH');
        var maxLength    = input.attr('MAX_LENGTH');
        var showName     = nvl(input.attr('SHOW_NAME'), '该项');

        //验证是否为空
        if (nullable == "0" && input.val() == "")
        {
            //日期选择框如果自动 focus 会导致死循环
            validate.showErrorMsg(input,showName,"不能为空！", input.attr("class").indexOf("Wdate") < 0);
            return false;
        }
        
        //验证是否为整数类型
        if (number == "1" && input.val() != "" && (isNaN(input.val())))
        {
            validate.showErrorMsg(input,showName,"必须为数值类型！");
            return false;
        }
        
        //验证邮箱格式
        if (email != undefined && input.val() != "")
        {
            var pattern =  /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
            
            if (!pattern.test(input.val()))
            {    
                validate.showErrorMsg(input, showName ,"格式不正确！");
                return false;
            }
        }
        
        //判断最小值
        if (minValue != undefined && input.val() != "")
        {
            if (parseFloat(input.val()) < minValue)
            {
                validate.showErrorMsg(input, showName, "不能小于："+minValue+"！");
                return false;
            }
        }
        
        //判断最大值
        if (maxValue != undefined && input.val() != "")
        {
            if (parseFloat(input.val()) > maxValue)
            {
                validate.showErrorMsg(input, showName, "不能大于："+ maxValue +"！");
                return false;
            }
        }
        
        //判断最少字符数
        if (minLength != undefined && input.val() != "")
        {
            if(input.val().length < minLength)
            {
                validate.showErrorMsg(input, showName, "不能小于"+ minLength +"个字符！");
                return false;
            }
        }
        
        //判断最大值
        if (maxLength != undefined && input.val() != "")
        {
            if(input.val().length > maxLength)
            {
                validate.showErrorMsg(input, showName, "不能大于"+ maxLength +"个字符！");
                return false;
            }
        }
        
        //判断小数位数
        if (decimal != undefined)
        {
            digits = decimal == "" ? "0" : decimal;
            if(!validate.isDecimal(input.val(), parseInt(digits)))
            {
                validate.showErrorMsg(input, showName, "小数部分不能大于"+ decimal +"位！");
                return false;
            }
        }
        
        return true;
    },
    
    /*
     *  显示错误信息
     *  input 所验证的对象
     *  showName 提示错误信息要显示的名称
     *  showMsg  统一的错误信息
     *  isfocus   提示错误的文本框是否获取焦点，不写默认为true
     */
    showErrorMsg:function(input, showName, showMsg, isfocus)
    {
        var obj = $(input);
        
        //确保错误对象是可见的
        //while (obj.css("display") == "none")     //这种写法有时失效
        while (obj.is(":hidden"))                  //这种写法效率极低
        {
            obj.show();
            obj = obj.parent();
        }
        
        var offset = $(input).offset();
        var clientWidth = document.body.clientWidth;
        var left = offset.left + $(input).width() +15;
        var top = offset.top;
        var height = $(input).innerHeight();
        
        if($(".input_msg").html() != null)
        {
            $(".input_msg").hide();
        }
        
        $("body").append("<div class='msg_style' style='position:absolute;top:"+ top +"px;background-color:rgba(222, 227, 231, 0.8);'>" + showName + showMsg + "</div>");
        
        var msgWidth = $(".msg_style").width();
        left = (clientWidth > (left+msgWidth) ? left : (offset.left-msgWidth-15));
        left = left < 0 ? clientWidth-msgWidth-15 : left;
        
        $(".msg_style").css({
            "left"             : left,
            "font-size"        : "12px",
            "color"            : "red",
            "z-index"          : "999",
            "padding"          : "5px",
            "display"          : "inline",
            "white-space"      : "nowrap"
        });
        
        if (isfocus == undefined || isfocus)
        {
            $(input).focus();
        }
        
        $(input).keydown(function()
        {
               $(".msg_style").hide("slow");
               $(".msg_style").remove();
        });
        
        $("body").mousedown(function()
        {
               $(".msg_style").hide("slow");
               $(".msg_style").remove();
        });
    },
    
    /*
     * 判断两次输入的密码是否相等
     */
    isPswEqual:function(password1, password2)
    {
        if ($(password1).val() != $(password2).val())
        {
            validate.showErrorMsg($(password1),"","两次输入密码不一致！");
            $(password2).focus();
            
            return false;
        }
        
        return true;
    },
    
    /*
     *  判断是否是整数，且位数在规定位数内，可以为负
     *  value 需要判断的数
     *  digit 小数位数
     */
    isDecimal:function(value, digit)
    {
        if (value.length == 0)
        {
            return true;
        }
//        eval("var pattern = /^(-[1-9]|[1-9]|(0[.])|(-(0[.])))[0-9]{0,}(([.]*\d{1,"+ digit +"})|[0-9]{0,})$/;");
//        
//        var aa =   /^(-[1-9]|[1-9]|(0[.])|(-(0[.])))[0-9]{0,}(([.]*\d{1,2})|[0-9]{0,})$/; 
//        
//        if (!pattern.test(value))
//        {    
//            return false;
//        }
        
        var bInDot = false;
        for (var i=0; i < value.length; i++)
        {
            //只运行一个小数点
            if (value.charAt(i) == "."){
                if (bInDot)
                {
                    return false;
                }
                else 
                {
                    bInDot = true;
                    //小数位只允许两位
                   if ((value.length-i)>(digit+1))
                   {
                       return false;
                   }
               }
          }
          else if (value.charAt(i) == "-")
          {
             if (i != 0)
             {
                 return false;
             }
          }
          else if (((value.charAt(i) <"0") || (value.charAt(i) >"9")))
          {
              return false;
          }
      }
        
      return true;
    },
    
    /*
     *  判断是否是整数，且位数在规定位数内，不可以为负
     *  value 需要判断的数
     *  digit 小数位数
     */
    isNegDemical:function(value, digit)
    {
        if (value.length == 0)
        {
            return true;
        }
        
        var bInDot = false;
        
        for (var i=0; i < value.length; i++)
        {
            //只运行一个小数点
            if (value.charAt(i) == ".")
            {
                if (bInDot)
                {
                    return false;
                }
                else
                {
                    bInDot = true;
                    //小数位只允许两位
                    if ((value.length-i)>(digit+1))
                    {
                        return false;
                    }
                }
            }
            else if (((value.charAt(i) <"0") || (value.charAt(i) >"9")))
                return false;
        }
        return true;
    },
    
     /*
     *  判断输入是否是日期型
     *  format 所需验证的日期格式
     *  value  需要判断的数
     */
    isDate:function(format, value)
    {
        var iAddSubWei = 0, iYYYY = -1, iMM = -1 , iDD = -1, iPos = -1;
        var sConvertedStr, sYYYY, sMM, sDD;
        //格式搜索
        iPos = format.indexOf("yyyy");
        
        if (iPos > -1)
        {
            iYYYY = iPos;
        }
        
        iPos = format.indexOf("mm");
        if (iPos > -1)
        {
            iMM = iPos;
        }
        
        iPos = format.indexOf("dd");
        if (iPos > -1)
        {
            iDD = iPos;
        }
        
        //判断长度是否相等
        if ((format.length+iAddSubWei) != value.length)
        {
            return false;
        }
        
        var dTest = new Date();
        var iTemp, iDay;
        
        //判断年
        if (iYYYY > -1)
        {
               sYYYY = value.substring(iYYYY, iYYYY+4);
    
            iTemp = parseInt(sYYYY);
            if ((iTemp < 1900) || (iTemp > 2070))
                return false;
            dTest.setYear(iTemp);
        }
        
        //判断月
        if (iMM > -1)
        {
            sMM = value.substring(iMM, iMM+2);
            iTemp = parseInt(sMM, 10);
            
            if ((iTemp < 1) || (iTemp > 12))
            {
                return false;
            }
            
            dTest.setMonth(iTemp - 1);
            dTest.setDate(40);
            iDay = dTest.getDate();
            iDay = 40 - iDay;
            
            //判断天
            sDD = value.substring(iDD, iDD+2);
            iTemp = parseInt(sDD,10);
            
            if ((iTemp < 1) || (iTemp > iDay))
            {
              return false;
            }
        }
        
        return true;
    },
    
    /**
     * 只能输入正整数
     * @param inputObj
     * @param keyCode
     */
    onlyInputInt:function(inputObj, keyCode)
    {
        //左右方向键无需处理
        if (keyCode==37 || keyCode==39)
        {
            return;
        }

        var inputValue = $(inputObj).val();
        //var reg = inputValue.length == 1 ? /[^1-9]/g : /\D/g;  //首位不能为0
        var reg = /\D/g;
        
        if (reg.test(inputValue))
        {
            $(inputObj).val(inputValue.replace(reg, ''));
        }
     },
    
    /**
     * 只能输入整数
     * @param inputObj
     * @param keyCode
     */
    onlyInputSignedInt:function(inputObj, keyCode)
    {
        //左右方向键无需处理
        if (keyCode==37 || keyCode==39)
        {
            return;
        }
   
        var inputValue = $(inputObj).val();
        var reg;
        
        if (inputValue.length == 1)
            reg = $(inputObj).is(':focus') ? /^-|\d/ : /^\d/;    //只有一位时有效值为0-9
        else if (inputValue.length == 2)
            reg = /^-[1-9]$|^[1-9]\d+$/;  //第一位为负号时，第二位不能为0
        else 
            reg = /^-?[1-9]\d+$/;         //首位有效值为负号或1-9

        if (!reg.test(inputValue))
        {
            //还有焦点时允许为空，方便用户继续输入，失去焦点时把空值转为0
            if (keyCode == null)
            {
                var oldValue = inputValue == "-" ? "" : parseInt(inputValue);  //失去焦点时确保值为整数
                $(inputObj).val(isNaN(oldValue) ? "" : oldValue);
            }
            else
            {
                //g表示全局搜索 i表示忽略大小写
                var oldValue = inputValue.replace(new RegExp(String.fromCharCode(keyCode), "gi"), ""); //删除新输入的字符
                $(inputObj).val(oldValue);
            }
        }
    },
    
    /**
     * 只能输入浮点数
     * @param inputObj
     * @param keyCode
     */
    onlyInputFloat:function(inputObj, keyCode)
    {
        //左右方向键无需处理
        if (keyCode==37 || keyCode==39)
        {
            return;
        }
        
        var inputValue = $(inputObj).val();
               
        if (!/^\d+[.]?\d*$/.test(inputValue))
        {
            $(inputObj).val(/^\d+[.]?\d*/.exec(inputValue));
        }
    },
        
    /**
     * 只能输入浮点数
     * @param inputObj
     * @param keyCode
     */
    onlyInputSignedFloat:function(inputObj, keyCode)
    {
        //左右方向键无需处理
        if (keyCode==37 || keyCode==39)
        {
            return;
        }
        
        var inputValue = $(inputObj).val();
        var reg;
        
        if (inputValue.length == 1)
        {
            reg = $(inputObj).is(':focus') ? /^-|\d/ : /^\d/;    //只有一位时有效值为0-9
        }
        else if (inputValue.length == 2)
        {
            reg = /^0\.$|^-\d$|^[1-9](\.|\d)$/; 
        }
        else if (inputValue.length == 3)
        {
            reg = /^0\.\d*$|^-0\.$|^[1-9]\d*\.?\d*$|^-[1-9]\d*\.?\d*$/;
        }
        else 
        {
            reg = /^-?([1-9]\d*\.?\d*|0\.\d*[1-9]\d*|0?\.0+|0)$/;
        }
        
        if (!reg.test(inputValue))
        {
            //还有焦点时允许为空，方便用户继续输入，失去焦点时把空值转为0
            if (keyCode == null)
            {
                var oldValue = inputValue == "-" ? 0 : parseFloat(inputValue);  //失去焦点时确保值为浮点数
                $(inputObj).val(isNaN(oldValue) ? 0 : oldValue);
            }
            else
            {
                var oldValue = inputValue.replace(new RegExp(String.fromCharCode(keyCode), "gi"), "");
                $(inputObj).val(oldValue);
            }
        }
    }
}

//捕获页面的keydown事件
//function document.onkeydown()
document.onkeydown = function(evt)
{
    //兼容ie 和 ff
    evt = (evt) ? evt : ((window.event) ? window.event : "") //兼容IE和Firefox获得keyBoardEvent对象
    var key = evt.keyCode?evt.keyCode:evt.which; //兼容IE和Firefox获得keyBoardEvent对象的键值
    
    //屏蔽 Ctrl+n
    if(evt.ctrlKey && key==78)
    {
        evt.returnValue=false;
    }
    
    var srcElement = evt.srcElement || evt.target;
    //回车键
    if(key==13 && srcElement.type.toLowerCase()!='textarea' && srcElement.type.toLowerCase()!='button' && srcElement.type.toLowerCase()!='submit' && srcElement.type.toLowerCase()!='reset' && srcElement.type!='')
    {
       
        if(srcElement.type.submitButton != null)
        {
            var submitButton=srcElement.type.submitButton;
            var obj=document.getElementById(submitButton);
            
            if(obj.type == 'submit' || obj.type == 'button')
            {
                obj.focus();
            }
           }
        else
        {
            evt.which=9;
            evt.keyCode=9;
        }
    }
}

