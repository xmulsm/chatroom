//socket state define
var SS_CONNECTING = 0;  //连接尚未建立
var SS_OPEN = 1;        //已经建立连接
var SS_CLOSING = 2;     //正在关闭
var SS_CLOSED = 3;      //已经关闭或不可用

var ChatRoom = {};

//默认将消息显示在控制台
ChatRoom.showText = function(message)
{
    console.log(message);
};

ChatRoom.showObject = function(message)
{
    console.log(JSON.stringify(message));
};

ChatRoom.processors = {};

ChatRoom.register = function(type, fuc)
{
    this.getProcessor(type).push(fuc);
};

ChatRoom.getProcessor = function(type)
{
    var processorOfType = this.processors[type];
    
    if (processorOfType == null)
    {
        processorOfType = [];
        this.processors[type] = processorOfType; 
    }
    
    return processorOfType;
};

ChatRoom.reconnect = function()
{
    this.connect(this.uri);
}

ChatRoom.connect = function(uri)
{
    if (this.socket && this.socket.readyState == SS_OPEN)
    {
        //已经关闭，自动重连
        if (uri == this.uri)
            return;
        else
            ChatRoom.close(4501, "connect_another_url");
    }

    this.uri = uri;
    var urn = (window.location.protocol == 'https:' ? 'wss://' : 'ws://') + window.location.host + "/chat"+ window.location.pathname;

    this.socket = new ReconnectingWebSocket(urn);
  
//    if ('WebSocket' in window) //Chrome、Safari、IE11等
//    {
//        this.socket = new ReconnectingWebSocket(urn);
//    }
//    else if ('MozWebSocket' in window)  //火狐
//    {
//      this.socket = new ReconnectingWebSocket(urn);
//    }
//    else
//    {
//        this.showText("您使用的浏览器不受支持，请更换或升级您的浏览器");
//        return;
//    }
    
    //连接发生错误的回调方法
    this.socket.onerror = function(event)
    {
        ChatRoom.showText("连接服务器错误，请尝试重新登录");
    };
     
    //连接成功建立的回调方法
    this.socket.onopen = function(event)
    {
        ChatRoom.triggerListener("onopen", event);
    }
     
    //接收到消息的回调方法
    this.socket.onmessage = function(event)
    {
        var msg = JSON.parse(event.data);
        ChatRoom.triggerListener(msg.type, msg);
    }
     
    //连接关闭的回调方法, 如果是客户端主动调用 socket.close 方法， 不会触发本事件
    this.socket.onclose = function(event)
    {
        ChatRoom.triggerListener("onclose", event);
    };
    
    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    $(window).bind('beforeunload',function()
    {
        ChatRoom.close(4500, "page_reload");
    });
};

ChatRoom.triggerListener = function(type, args)
{
    var listeners = ChatRoom.getProcessor(type);
    
    for (var i in listeners)
    {
        listeners[i].apply(ChatRoom.socket, [args]);  
    }
}

//关闭连接
ChatRoom.close = function(code, reason)
{
    if (this.socket != null)
    {
        this.socket.close(code, reason);
    }
}

//发生数据
ChatRoom.send = function (message)
{
    //readyState: 0-CONNECTING-连接尚未建立、1-OPEN-已经建立连接、2-CLOSING-正在关闭、3-CLOSED-已经关闭或不可用
    if (this.socket == null || this.socket.readyState == SS_CONNECTING)
    {
        this.showText("尚未连接服务器, 请登录")
        return;
    }

    if (this.socket.readyState >= SS_CLOSING) //已经关闭，自动重连
    {
        this.onclose();
        return;
    }

    if (message != null && message.trim() != '')
    {
        this.socket.send(message);
    }
}

//判断是否已连接
ChatRoom.isActive = function()
{
    return this.socket.readyState == 1;
}

//发生数据
ChatRoom.sendObject = function (message)
{
    this.send(JSON.stringify(message));
}

ChatRoom.register("onclose", function(event)
{
    //断线重连
    if (ChatRoom.loginUser == null || event.code >= 3000)
    {
        //console.log(event.reason);
        //ChatRoom.showText("您与服务器已断开连接");
        return;
    }
    
    $.post
    (
        "/login/check",
        "",
        function(data)
        {
            if (data.account != ChatRoom.loginUser)
                location.reload();
            else
                ChatRoom.reconnect();
        }
    );
});
