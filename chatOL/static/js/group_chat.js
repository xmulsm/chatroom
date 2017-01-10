/*
 * msgQueue的数据格式，
 *  {
 *      type:"CHAT",
 * 	    toUser: your_user_id,
 *      source:{userName: "", message: "", date: 1223434}
 *   }
 */

var msgQueue = new Array(); //消息队列
var maxCol = 500; //最多查看的消息条数
var uiMaxCol = 200; //页面最多可同时显示的消息条数
var pageCol = 10; //每页显示的信息数量

$(function()
{
    if (typeof(g_msg_type) == "undefined")
    {
        g_msg_type = "chat";        
    }
    
    $("#msg_content").focus();

	//显示聊天历史记录
	for (var i=g_chat_log.length-1; i>=0; i--)
	{
		var chatData = g_chat_log[i];
		var message={
			fromUser: chatData['USER_ID'],
			timestamp: chatData['CREATE_DATE'],
			source:
			{
				id: chatData['MSG_ID'],
				message: chatData['CONTENT'],
				avatar: chatData['HEAD_IMG'],
				userName: chatData['USER_NAME']
			}
		}
		
    	pushMsgQueue(message);
	}
	
	addNewMsg();

	//页面加载完后自动定位到最底部
	var div = $('#msg_list').get(0);
	div.scrollTop = div.scrollHeight;
	
    //将消息显示在网页上
    ChatRoom.register(g_msg_type, function(msg)
    {
    	pushMsgQueue(msg);
    	addNewMsg();
    });

    //将消息显示在网页上
    ChatRoom.register("revoke", function(msg)
    {
        $("#" + msg.source).off().find(".content.talkbubble").html("消息已撤回");
    });
    
    ChatRoom.connect("/ws/lotto?group_id=" + g_group_id);
    ChatRoom.loginUser = g_account;  //加这句断线时就能够自动重连
    
    //发送消息
    $("#btn_send_msg").click(function send()
    {
    	if ($("#msg_content").val().trim() != "")
    	{
        	var msg = {'type':g_msg_type, 'source':$("#msg_content").val().trim()};
        	
        	if ("undefined" != typeof g_to_user && g_to_user != null)
        	{
        		msg.toUser = g_to_user;
        	}
        	
            ChatRoom.sendObject(msg);
            $("#msg_content").val("");
            $("#msg_content").focus();
    	}
    });
    
    $("#msg_content").keydown(function(e)
    {  
        if (!e.ctrlKey && e.keyCode == 13)
        {  
            $("#btn_send_msg").click();  
            return false;
        }
    });
    
  	$(".user_name").click(function()
  	{
  	    $("#input_msg").val($("#input_msg").val() + "@" + $(this).html());
  	});
  	
  	//如果未登录不显示用户头像
    if ($("#user_head_img").attr("src") == "")
    {
        $(".head_div").hide();
        $(".discuss_div").addClass("no_head_img");
    }
    else
    {
        $(".head_div").show();
        $(".discuss_div").removeClass("no_head_img");
    }
    
    if (window.addEventListener)
    {
    	window.addEventListener('DOMMouseScroll', function(e){
    		var dir = getScrollDir(e);
    		wipeUp(dir);
    	}, false);
    	
    	window.addEventListener('touchmove', function(e) {
    		var dir = getScrollDir(e);
    		wipeUp(dir);
    	}, false);
    }
    var scrollTimer;
    window.onmousewheel = document.onmousewheel = function(e){
    	var dir = getScrollDir(e);
    	//防止鼠标滚动时重复执行多次
    	if(scrollTimer){
    		clearTimeout(scrollTimer);
    	} 
    	scrollTimer = setTimeout(function(){
    		wipeUp(dir);
    	}, 200);
    };
    
    //长按头像后输入框显示"@user_name"
    var time = 0;//初始化起始时间  
    $(".discuss_li").on('touchstart', '.head_img_div', function(e)
    {  
        e.stopPropagation();  
        var imgObj = $(this);
        time = setTimeout(function()
        {  
        	var parentObj = $(imgObj).parent(".discuss_li");
        	if (!$(parentObj).hasClass("myself"))
        	{
        		var userName = $(parentObj).data("user_name");
        		$("#msg_content").val("@" + userName + " ");
        	} 
        }, 500);//这里设置长按响应时间  
    });  
      
    $(".discuss_li").on('touchend', '.head_img_div', function(e)
    {  
        e.stopPropagation();  
        clearTimeout(time);    
    });  
    
    //头像消息内容，弹出“撤销”小窗
    var time2 = 0;//初始化起始时间  
    $(".discuss_li").on("touchstart", ".content", function(e)
    {  
        e.stopPropagation();  
        var thisObj = $(this);
        time2 = setTimeout(function()
        {  
        	var parentObj = $(thisObj).parents(".discuss_li");
        	if ($(parentObj).hasClass("myself"))
        	{
        		var msgID = $(thisObj).data("msg_id");
        		$("#content_modal").find("#recall").attr("msg_id", msgID);
        		$("#content_modal").modal();
        	}
        }, 500);//这里设置长按响应时间  
    });  
      
    $(".discuss_li").on("touchend", ".content", function(e)
    {  
        e.stopPropagation();  
        clearTimeout(time2);    
    }); 
    
    //撤销消息 
    $("#content_modal").on("touchend", "#recall", function(e)
    {
    	e.stopPropagation();  
    	ChatRoom.sendObject({'type':'cancel_order', 'source': $(this).attr("msg_id")});
    	
        $("#content_modal").modal("hide");
    });
    
    //对话框中图片点击显示大图事件
    $(".content").on("touchend", ".talk_img", function(e)
    {
    	$(this).toggleClass("zoom_in")
    });
});

/**
 * 在信息队列中添加信息
 * @param msgData 
 */
function pushMsgQueue(msgData)
{
	msgQueue.push(msgData);
}

/**
 * 从msgQueue队列中，取得最新加载的消息，并显示在界面上
 * @param maxCol      页面最多可显示的消息数量
 * @param msgQueue    消息队列
 */
function addNewMsg()
{
	var lastIndex = -1;
	var length = $(".discuss_li:visible").length;
	if (length > 0)
	{
		lastIndex = parseInt($(".discuss_li:last").attr("index"));
	}
	
	for (var i=lastIndex+1; i<msgQueue.length; i++)
	{
		addMsgToUI(msgQueue[i], i, "bottom");
	}
	
	//如果当前不在评论页，则在菜单上显示新消息条数
	if ($("#msg_list").css("display") == "none")
	{
		
	}
	
	//当手动往上滚动滚动对象的1.5倍高度后，不自动定位到底部
	var msgObj = $(".discuss_li:visible:last");

	if ($(msgObj).length > 0 && $(msgObj).position().top <= 1.5*$(".discuss_ul").height())
	{
		if ($(msgObj).position().top <= 1.5*$(".discuss_ul").height())
		{
			//自动定位到最底部
			var div = document.getElementById('msg_list');
			div.scrollTop = div.scrollHeight;
		}
	}	
}

/**
 * 在界面中添加历史信息（添加在顶部）
 * @param message  消息对象
 * @param index    与数组的序列号对应
 * @param maxCol   页面最多可显示的消息数量
 * @param dir      从底部添加或是从顶部添加 值为："top","bottom"
 */
function addMsgToUI(message, index, dir)
{
	var chatMsg = message.source;
	
	var demoObj = $("#msg_list").children(".demo_li");
	var liObj = $(demoObj).clone(true)
				.attr("id", chatMsg.id)
				.attr("index", index)
				.data("user_name", chatMsg.userName)
				.removeClass("demo_li").show();
	
	var avatarUrl = chatMsg.avatar
	avatarUrl = (avatarUrl == ""||avatarUrl == undefined) ? "/mobile/img/def_head.png" : avatarUrl;
	
	var msg = chatMsg.message.replace(/\r\n/g,"<BR>")  
    msg = msg.replace(/\n/g,"<BR>"); 
	
	$(liObj).find(".head_img").attr("src", avatarUrl);
    $(liObj).find(".user_name").text(chatMsg.userName);
    $(liObj).find(".chat_date").text(new Date(message.timestamp).format("MM-dd hh:mm:ss"));
    $(liObj).find(".content").data("msg_id", chatMsg.id).html(msg);
    //带图片写法
    //$(liObj).find(".content").data("msg_id", chatMsg.id).html(msg+"<div class='talk_img'><img src='/img/public/building.jpg'/>");
	
    if (message.fromUser == g_user_id)
    {
    	$(liObj).addClass("myself");
    }
    
	var length = $(".discuss_li").length;
    
	if (dir == "top")
	{
		if (length > uiMaxCol)
		{
			$(".discuss_li:visible:gt("+ maxCol +")").remove();
		}
		$(liObj).prependTo($("#msg_list"));
	}
	else if (dir == "bottom")
	{
		if (length > uiMaxCol)
		{
			$(".discuss_li:visible:lt("+ (length-maxCol) +")").remove();
		}
		$(liObj).appendTo($("#msg_list"));
	}
}

//滑动加载更多事件

var currentPage = 1;
/**
 * 滑动加载更多事件
 * @param pageCol   每次滚动加载的信息数
 * @param direction 滚动方向，值为"up"、"down"
 * @param maxCol 最大可以显示的信息数
 */
function wipeUp(direction)
{
	//界面少于4条消息时，不处理滚动事件
	if ($(".discuss_li:visible").length <= 4)
	{
		return false;
	}
	
    //向上滚
    if (direction == "up")
    {
    	var msgObj = $(".discuss_li:first");
    	
    	if($(msgObj).position().top >= $(".discuss_ul").position().top)
    	{
    		var fistIndex = parseInt($(msgObj).attr("index"));
    		
    		var stopIndex = (fistIndex-pageCol) <= 0 ? 0 : (fistIndex-pageCol);
    		for (var i=fistIndex; i<= stopIndex; i--)
    		{
    			addMsgToUI(msgQueue[i].source, i, "top");
    		}
    	}
    }//向下滚
    else if((direction == "down"))
    {
    	var msgObj = $(".discuss_li:last");
    	var nextTolastIndex =  $(".discuss_li[class!='demo_li']").length-2;
    	var msgObj2 = $(".discuss_li:eq("+ nextTolastIndex +")");
    	
		var lastPos = $(msgObj).position();
		var lastPos2 = $(msgObj2).position();
    	
		var lastHeight = lastPos.top - lastPos2.top;
    	var bottom = $(".discuss_ul").position().top + $(".discuss_ul").height();
		
    	//如果已经滚到最底部，则再加载消息队列里的消息
    	var msgTop = $(msgObj).position().top;
    	if ((msgTop + lastHeight) >= bottom)
    	{
    		var lastIndex = parseInt($(msgObj).attr("index"));
    		var stopIndex = (lastIndex+pageCol) >= msgQueue.length ? msgQueue.length : (lastIndex+pageCol);
    		
    		for (var i=lastIndex+1; i< stopIndex; i++)
    		{
    			addMsgToUI(msgQueue[i].source, i, "bottom");
    		}
    	}
    }
}

