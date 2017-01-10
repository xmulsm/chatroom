$(document).ready(function()
{
    $(window).bind('beforeunload', showLoader);

    //鼠标点击选中,应用：<input class='pitch'>
    $(".pitch").on("focus, click",function()
    {
        $(this).select();
    });
    
    //鼠标点击清空,应用：<input class='clear'>
    $(".clear").on("focus, click", function()
    {
        $(this).val("");
    });
    
    //显示列表页面的鼠标滑过效果，应用<ul class='hover_style'></ul>
    $(".hover_style").hover(
        function()
        {
            $(this).addClass("ul_hover");
        },
        
        function()
        {
            $(this).removeClass("ul_hover");
        }
    );
    
    $("form").on("submit", function(event) {
        event.stopPropagation();
      });
    
    //表格各行鼠标划过效果
    $(".tr_hover,.tr_hover2").on
    ({
        mouseenter: function()
        {
            if ($(this).children().length == 0)
            {
                $(this).data("bg_color", $(this).css("background-color")).css("background-color", "#DDEEFE");
                return;
            }

            $.each($(this).children(), function(i, child)
            {
                $(child).data("bg_color", $(child).css("background-color")).css("background-color", "#DDEEFE");
            });
        },
        mouseleave: function()
        {
            if ($(this).children().length == 0)
            {
                $(this).css("background-color", $(this).data("bg_color"));
                return;
            }
            
            $.each($(this).children(), function(i, child)
            {
                $(child).css("background-color", $(child).data("bg_color"));
            });
        }
    });
    
    //返回上一个页面
    $(".back").click(function()
    {
        history.go(-1);
    });
});

//删除左右两端的空格
String.prototype.trim=function()
{
    return this.replace(/(^\s*)|(\s*$)/g, "");
}

//删除左边的空格
String.prototype.ltrim=function()
{
    return this.replace(/(^\s*)/g, "");
}
 
//删除右边的空格
String.prototype.rtrim=function()
{
    return this.replace(/(\s*$)/g, "");
}

//**********************************************************
//修改表格行颜色;使用onMouseOver方法
//记录每一个单元格的着色,在OUT事件的时候重新赋值
//用于一行当中各个单元格颜色不一样的情况
//**********************************************************
//var colorArray;//全局变量，用来记录原来的色
//function ModColor(tr, color)
//{
//  var td = tr.cells;
//  colorArray = new Array(td.length);
//  for(var i=0; i<td.length; i++)
//  {
//    //记录原来的着色
//    colorArray[i] = td[i].style.backgroundColor;
//    if(color == null)
//      td[i].style.backgroundColor = "#DDEEFF";
//    else
//      td[i].style.backgroundColor = color;
//
//  }
//}
//
////鼠标移开换色
//function MoveColor(tr,className)
//{
//  var td = tr.cells;
//  for(var j=0; j<td.length; j++)
//  {
//    td[j].style.backgroundColor = colorArray[j];
//  }
//}

//获取cookie
function getCookie(cookieName)
{
     var cookies = document.cookie.split(";");
     
     for (var i = 0; i < cookies.length; i++)
     {
         var cookieValue = cookies[i].replace(/ /, "");

         if (cookieValue.indexOf(cookieName) == 0)
         {
             return cookieValue.substring(cookieName.length + 1);
         }
     }
     
     return "";
}

/**
 * 悬浮显示错误信息
 * @param showID   显示的位置id
 * @param errorMsg 信息内容
 * @param hideAble 鼠标点击其他位置后是否隐藏
 * @return
 */
function showError(showID, errorMsg, hideAble, color)
{
    $("#show_msg").remove();

    if(color != null)
        $("#" + showID).append("<span style='color:"+color+";' id='show_msg'>&nbsp;&nbsp;" + errorMsg + "</span>");
    else
        $("#" + showID).append("<span style='color:red;' id='show_msg'>&nbsp;&nbsp;" + errorMsg + "</span>");
    
    if (hideAble)
    {
        $("body").mousedown(function()
        {
            $("#show_msg").hide("slow");
            $("#show_msg").remove();
        });
    }
}

/**
 * 在鼠标坐标处悬浮显示信息(msg),点击其他地方该悬浮div消失
 * @param msg
 * @param clientX 鼠标所在位置x坐标
 * @param clientY 鼠标所在位置y坐标
 */

function showMsg(msg, clientX, clientY)
{
    $("body").append("<div class='msg_div' id='show_msg' style='display:inline;' title='点击任意地方即消失'>"+ msg +"</div>");
    
    var clientWidth = document.body.clientWidth;
    var clientHeight = document.body.clientHeight;
    
    var msgWidth = $("#show_msg").width();
    var msgHeight = $("#show_msg").height();
    
    clientX = (clientX + msgWidth) >= clientWidth ? (clientX - msgWidth) : clientX;
    clientY = (clientY + msgHeight) >= clientHeight ? (clientY - msgHeight) : clientY;
    
    $(".msg_div").css
    ({
        "position"         : "absolute",
        "z-index"          : "999",
        "left"             : clientX,
        "top"              : clientY,
        "background-color" : "#dee3e7",
        "font-size"        : "12px",
        "color"            : "red",
        "padding"          : "5px",
        "white-space"      : "nowrap"
    });
    
    $("body").mousedown(function()
    {
        $("#show_msg").hide("slow");
        
        $("#show_msg").remove();
    });
}

/**
 * 获得网页地址传递的参数
 * @returns map
 */
function getUrlParas(url)
{
    if (url == null)
    {
        url = location.href
    }
    
    var paraString = url.substring(url.indexOf("?")+1,url.length).split("&"); 
    
    var paraObj = {};
    
    for (var i=0; i<paraString.length; i++)
    { 
        var j=paraString[i];
        
        paraObj[j.substring(0,j.indexOf("="))] = j.substring(j.indexOf("=")+1,j.length); 
    } 
    
    return paraObj;
}

/**
 * 根据参数名称获得网页地址传递的参数值
 * paraName 参数名
 */
function getUrlPara(paraName, url)
{
    return getUrlParas(url)[paraName];
}

/**
 * 获得网页地址传递的第index个参数的参数值
 * index 所查询参数的序列号 第一个为1
 */
function getUrlParaByIndex(index, url)
{
    if (url == null)
    {
        url = location.href
    }
 
    var paraString = url.substring(url.indexOf("?")+1,url.length).split("&"); 
    var indexPara = paraString[index-1];
    
    return indexPara.split("=")[1];
}

/**
 * 根据参数名称获得网页地址传递的参数值
 * paraName 参数名
 */
function getParaByUrl(url, paraName)
{ 
    var paraObj = getUrlParas(url);
    
    var returnValue = paraObj[paraName];
    
    if (typeof(returnValue)=="undefined")
    { 
        return ""; 
    }
    else
    { 
        return returnValue; 
    } 
}

function getOS() 
{ 
   if(navigator.userAgent.indexOf("MSIE")>0) 
   { 
        return "MSIE"; 
   } 
   
   if(isFirefox=navigator.userAgent.indexOf("Firefox")>0)
   { 
        return "Firefox"; 
   } 
   
   if(isSafari=navigator.userAgent.indexOf("Safari")>0) 
   { 
        return "Safari"; 
   }  
   
   if(isCamino=navigator.userAgent.indexOf("Camino")>0)
   { 
        return "Camino"; 
   } 
   
   if(isMozilla=navigator.userAgent.indexOf("Gecko/")>0)
   { 
        return "Gecko"; 
   } 
} 

/**
 * 将 null 值转换为默认值
 * @param value
 * @param defaultValue
 * @returns
 */
function nvl(value, defaultValue)
{
    return value != null ? value : (defaultValue != null ? defaultValue : 0);
}

/**
 * 将json对象转化为字符串
 * @param o
 * @returns {String}
 */
function json2str(o) 
{
    return JSON.stringify(o);  //在ie7下没有JSON对象, 引用 rock.json.js 可解决
}

/**
 * 得到 json 对象的所有key, 并且按自然顺序排序
 * 
 * @param jsonObject
 * @param needSort
 * @returns {Array}
 */
function getJsonKeys(jsonObject, needSort)
{
    var keys = [];
    
    $.each(jsonObject, function(key, val)
    {
        keys[keys.length] = key;
    });
    
    if (needSort)
    {
        keys.sort();
    }
    
    return keys;
}

/**
 * 将一个数组序列化，方便提交到服务端的List参数中
 * 
 * @param paraName      服务端的set、get参数名
 * @param paraValues
 * @returns {Array}
 */
function serializeArray(paraName, paraValues)
{
    var result = [];
    
    for (var i=0; i<paraValues.length; i++)
    {
        result[i] = {"name": paraName, "value": paraValues[i]};
    }
    
    return result;
}

/**
 * 数组按数值排序
 * @param a
 * @param b
 * @returns {Number}
 * 
 * 调用如下：
 *     var array = new Array();
 *     array.sort(); 按字符排序
 *     array.sort(sortNumber); 按数值排序
 */
function sortNumber(a, b)
{
    return a - b
}

/**
 * 二维数组排序
 * 
 * @param data
 * @param key
 * @param desc
 * @returns
 */
function sortByKey(data, key, desc)
{
    if (key instanceof Array)
    {
        data.sort(function(a, b)
        {
            for (var i=0; i<key.length; i++)
            {
                var valueA = nvl(a[key[i]]);
                var valueB = nvl(b[key[i]]);
                
                if (valueA == valueB) continue;
                
                if (desc != null && desc[i])
                    return valueA > valueB ? -1 : 1;
                else
                    return valueA > valueB ? 1 : -1;
            }
            
            return 0;
        });
    }    
    else
    {
        data.sort(function(a, b)
        {
            var valueA = nvl(a[key]);
            var valueB = nvl(b[key]);
            var result = valueA == valueB ? 0 : (valueA > valueB ? 1 : -1);
            
            return desc ? -result : result; 
        });
    }
    
    return data;
}

/**
 * alert("我是{0}，今年{1}了".format("loogn",22)); 
 * alert("我是{name}，今年{age}了".format({name:"loogn",age:22}));
 *  
 * 两个结果都是"我是loogn，今年22了"
 */
String.prototype.format = function(args)
{
    if (arguments.length == 0)
    {
        return this;
    }

    var result = this;
    
    if (arguments.length == 1 && typeof(args) == "object")
    {
        for (var key in args)
        {
            var reg = new RegExp("({" + key + "})", "g");
            result = result.replace(reg, nvl(args[key], ""));
        }
    }
    else 
    {
        for (var i = 0; i < arguments.length; i++)
        {
            var reg = new RegExp("({[" + i + "]})", "g");
            result = result.replace(reg, nvl(arguments[i], ""));
        }
    }
    
    return result;
} 

/**
 * 阻止事件冒泡
 * 
 * @param e
 */
function stopBubble(e)
{
    if (e && e.stopPropagation)
    {
        e.stopPropagation();
    }
    else
    {
        window.event.cancelBubble=true;
    }
}

/**
 * 给数值加前导0
 * @param num    数值
 * @param len    需要的长度
 * @returns {String}  
 */
function lPad(num, len)
{  
    var numLen = num.toString().length;  
    
    while(numLen < len)
    {  
        num = "0" + num;  
        numLen++;  
    }

    return num;  
}

//对Date的扩展，将 Date 转化为指定格式的String   
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
//例子：   
//(new Date()).format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423   
//(new Date()).format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18   
//author: meizz  
Date.prototype.format = function(fmt)
{
    var o = {
        "M+" : this.getMonth() + 1,                       //月份   
        "d+" : this.getDate(),                            //日   
        "h+" : this.getHours(),                           //小时   
        "m+" : this.getMinutes(),                         //分   
        "s+" : this.getSeconds(),                         //秒   
        "q+" : Math.floor((this.getMonth() + 3) / 3),     //季度   
        "S" : this.getMilliseconds()                      //毫秒   
    };
    
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    
    for ( var k in o)
    {
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    }
    
    return fmt;
}

/**
 * 显示加载中
 */
function showLoader()
{
	$("body").append("<div id='loader' class='loader_bg'><div class='loader loader_spinningDisc'></div></div>");
}

/**
 * 删除加载中
 */
function removeLoader()
{
    $("#loader").remove();
}

//判断滚动方向
var getScrollDir = function (e) 
{  
    e = e || window.event;  

    if (e.wheelDelta) //判断浏览器IE，谷歌滑轮事件 
        return e.wheelDelta > 0 ? "up" : "down";
    else if (e.detail)  //Firefox滑轮事件   
        return e.detail > 0 ? "up" : "down";
}  
