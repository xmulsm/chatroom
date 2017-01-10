var msgQueue = new Array(); //消息队列
var maxCol = 500; //最多查看的消息条数
var uiMaxCol = 200; //页面最多可同时显示的消息条数
var pageCol = 10; //每页显示的信息数量

$(function() {
    // When we're using HTTPS, use WSS too.
    var ws_scheme = window.location.protocol == "https:" ? "wss" : "ws";
    var chatsock = new ReconnectingWebSocket(ws_scheme + '://' + window.location.host  + "/chat" + window.location.pathname);

    if (typeof(g_msg_type) == "undefined")
    {
        g_msg_type = "chat";
    }

    $("#msg_content").focus();

//	//显示聊天历史记录
//	for (var i=g_chat_log.length-1; i>=0; i--)
//	{
//		var chatData = g_chat_log[i];
//		var message={
//			handle: chatData['handle'],
//			message: chatData['message'],
//			timestamp:chatData['timestamp']
////			source:
////			{
////				id: chatData['MSG_ID'],
////				message: chatData['CONTENT'],
////				avatar: chatData['HEAD_IMG'],
////				userName: chatData['USER_NAME']
////			}
//		}
//
//    	pushMsgQueue(message);
//	}

    chatsock.onmessage = function(message) {
        var data = JSON.parse(message.data);
        console.log(data);
        var message={
            handle:data.handle,
            message:data.message,
            timestamp:data.timestamp,
        }
//        pushMsgQueue(message);
        addNewMsg(message);
    };

    //   回车发送消息
       $("#msg_content").keydown(function(e)
    {
        if (!e.ctrlKey && e.keyCode == 13)
        {
            $("#btn_send_msg").click();
            return false;
        }
    });

    //页面加载完后自动定位到最底部
	var div = $('#msg_list').get(0);
	div.scrollTop = div.scrollHeight;

      //发送消息
    $("#btn_send_msg").click(function send()
    {
    	if ($("#msg_content").val().trim() != "")
    	{
        chatlog['message']=$('#msg_content').val();
//        console.log(message)
//        chatlog['avatar']='user';
//        var time=new Date();
//        var mytime=time.toLocaleTimeString();
//        chatlog['timestamp']=mytime
        chatsock.send(JSON.stringify(chatlog));
        $("#msg_content").val('').focus();
        return false;
    	}
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
function addNewMsg(msgData)
{
	var lastIndex = -1;
	var length = $(".discuss_li:visible").length;
	if (length > 0)
	{
		lastIndex = parseInt($(".discuss_li:last").attr("index"));
	}

//	for (var i=0; i<msgQueue.length; i++)
//	{
	addMsgToUI(msgData,"bottom");
//	}

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
function addMsgToUI(message, dir)
{
	var chatMsg = message;
	var demoObj = $("#msg_list").children(".demo_li");
    console.log(message);
	var liObj = $(demoObj).clone(true)
                .data("user_name", chatMsg.handle)
				.removeClass("demo_li").show();

//	var avatarUrl = chatMsg.avatar
    var user=chatMsg.handle
	avatarUrl = (user == "系统管理员") ? "/static/images/adm_head.png":"/static/images/def_head.png" ;

//	var msg = chatMsg;
//    msg = msg.replace(/\n/g,"<BR>");

	$(liObj).find(".head_img").attr("src", avatarUrl);
    $(liObj).find(".user_name").text(chatMsg.handle);
    console.log(chatMsg.timestamp)
    $(liObj).find(".chat_date").text(chatMsg.timestamp);
    $(liObj).find(".content").data("msg_id", chatMsg.id).html(chatMsg.message);
    //带图片写法
    //$(liObj).find(".content").data("msg_id", chatMsg.id).html(msg+"<div class='talk_img'><img src='/img/public/building.jpg'/>");
    if (chatMsg.handle==chatlog.handle)
    {
    	$(liObj).addClass("myself");
    }

	var length = $(".discuss_li").length;
	console.log(length);

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


