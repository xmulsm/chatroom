$(function()
{
	var currentUrl = window.location.href;
	var host = window.location.host;
	var menuMeID; //菜单‘我’的ID
	//获取一级菜单
	for (var i=0; i < parentList.length; i++)
    {
		var url=parentList[i][3];
        if (parentList[i][4] != "" || url != "")
        {
        	url += (url.indexOf("?") >= 0 ? "&" : "?") + parentList[i][4];
        }
        
        var parentObj = $(".demo_menu").clone("true").removeClass("demo_menu")
        				.attr("id", parentList[i][0])
        				.attr("parent_id", parentList[i][1])
        				.attr("url", url);
        
        $(parentObj).children("a").text(parentList[i][2]);
        
//        if (url!="" && currentUrl.indexOf(url) >= 0)
        if (url!="" && ("http://"+host+url) == currentUrl)
        {
        	$(parentObj).addClass("active").addClass("showing");
        }
        $(parentObj).appendTo($(".activity_top"));
        
        //获得‘我’菜单
        if(url.indexOf("me") >= 0)
        {
        	menuMeID = parentList[i][0];
        	$(parentObj).addClass("menu_me");
        }
    }
//	console.log((new Date().getMilliseconds()-testTime));
//	testTime = new Date().getMilliseconds();
	//获取二级菜单
	for (var j=0; j < childList.length; j++)
	{
		var url=childList[j][3];
		if (childList[j][4] != "" || url != "")
        {
        	url += (url.indexOf("?") >= 0 ? "&" : "?") + childList[j][4];
        }
        
        var parentObj = $("#"+childList[j][1]);
        $(parentObj).addClass("have_children");
        
        var childrenObj = $(".demo_li2").clone(true).removeClass("demo_li2")
					      .attr("parent_id", childList[j][1])
                          .attr("id", childList[j][0])
          				  .attr("url", url)
          				  .text(childList[j][2]);
        
    	if (url!="" && ("http://"+host+url) == currentUrl)
        {
        	$(childrenObj).addClass("active").addClass("showing");
        	while (!$(parentObj).hasClass("first_menu_li"))
        	{
        		parentObj = $("#" + $(parentObj).attr("parent_id"));
        	}
        	$(parentObj).addClass("active");
        }
        if (url.indexOf("logout") >= 0)
        {
        	$(childrenObj).addClass("menu_li_logout");
        }
        
        $(childrenObj).appendTo($(".children_menu_ul"));
	}
	$(".demo_menu").remove();
	$(".demo_li2").remove();
	$(".demo_tab").remove();
	
	$(".first_menu_li").css("width", (100/$(".first_menu_li").length).toFixed(0) + "%");
	//菜单事件
	$(".menu_li").on("click", function()
	{
		var url = $(this).attr("url");
		var ID = $(this).attr("id");
		
		//如果带有子菜单，则显示子菜单
		if (!$(this).hasClass("have_children"))
		{
			window.location.href = url;
			return;
		}
		
		//如果子菜单的url中含有game_type参数，则默认显示含有game_type=localStorage.GAME_TYPE的子菜单
		try
		{
			if (localStorage.GAME_TYPE != undefined && localStorage.GAME_TYPE != "undefined" && localStorage.GAME_TYPE != "")
			{
				var childUrl = "";
				$(".child_menu_li[parent_id='"+ ID +"']").each(function()
				{
					childUrl = $(this).attr("url");
					if (childUrl.indexOf("game_type="+localStorage.GAME_TYPE) >= 0)
					{
						if ($(this).hasClass("have_children"))
						{
							var ID = $(this).attr("id");
							childUrl = getChildMenuUrl(ID);
						}
						//showLoader();
						window.location.href = childUrl;
						return;
					}
				});
			}
			else
			{
				//直接跳转到第一个子菜单
				window.location.href = getChildMenuUrl(ID);
				return;
				//显示子菜单
//			$(".child_menu_li").hide();
//			$(".child_menu_li[parent_id='"+ ID +"']").show();
//			//如果是第三级菜单，则显示返回按钮
//			if ($("#left_menu").hasClass("show_menu") && $(this).hasClass("child_menu_li"))
//			{
//				$("#go_back").show();
//			}
//			else
//			{
//				$("#left_menu").addClass("show_menu");
//			}
//			
//			$(".child_menu_li:visible:first").css("border-top", "0");
//			$("#left_menu").show();
			}
		}catch(ex)
		{
			//直接跳转到第一个子菜单
			window.location.href = getChildMenuUrl(ID);
			return;
		}
	});
	
	//关闭事件
	$("#close_menu").click(function()
	{
		$("#left_menu").hide();
	});
	
	//返回事件
	$("#go_back").click(function()
	{
		var parentID = $(".menu_li:visible").first().attr("parent_id");
		$(".menu_li").hide();
		$("#" + parentID).show();
		
		$("#go_back").hide();
	});
	
	//要显示的页面位置class为other_child_menu，为了使引入member_menu.jsp的页面可以以其他方式展示子菜单
	if($("#other_child_menu").length > 0)
	{
		//如果当前显示的菜单有子菜单，则获取子菜单，否则获取同级菜单
		var showID;
		
		if ($(".showing").hasClass("have_children"))
		{
			showID =  $(".showing").attr("id");
		}
		else
		{
			showID = $(".showing").attr("parent_id");
		}
		
		$(".menu_li[parent_id='"+ showID +"']").each(function(index)
		{
			$(this).clone(true)
			       .removeClass("list-group-item")
			       .removeClass("child_menu_li")
			       .addClass("nav_li")
			       .addClass("other_menu_li")
			       .attr("show_index", index)
			       .appendTo($("#other_menu_ul"));
		});
		
		var length = $(".other_menu_li").length;
		var maxCol =4;
		
		$("#other_menu_ul").appendTo($(".other_child_menu"));
		
		//landscape表示横向排列, portrait表示纵向排列
		if ($(".other_child_menu").hasClass("landscape"))
		{
			$(".other_menu_li").css("width", 100/length+"%");
			if (length >= maxCol)
			{
				$("#other_menu_ul").css("width", (length/maxCol*100) + "%");
				
				var showIndex = parseInt($(".showing.other_menu_li").attr("show_index"));
				var lastLastObj = $(".other_menu_li[show_index='"+ (showIndex-2) +"']");
				var lastObj = $(".other_menu_li[show_index='"+ (showIndex-1) +"']");
				var nextObj = $(".other_menu_li[show_index='"+ (showIndex+1) +"']");
				
				if ($(lastLastObj).length > 0)
				{
					$(".other_child_menu").before("<span class='last_more'></span>");
					$(".other_child_menu").scrollLeft($(".other_menu_li").width()*(showIndex-1));
				}
				if ($(nextObj).length > 0)
				{
					$(".other_child_menu").after("<span class='next_more'></span>");
				}
			}
		}
		else if ($(".other_child_menu").hasClass("portrait"))
		{
			var showIndex = parseInt($(".showing.other_menu_li").attr("show_index"));
			$(".other_child_menu").scrollTop($(".other_menu_li").height()*(showIndex-1));
		}
	}
	//如果页面需要显示返回
	if ($(".have_return").length > 0)
	{
		$("body").append
		(
			"<div class='return_div'>" +
				"<span id='return_arrow' class='return_arrow'>‹</span>" +
				"<span class='showing_name'>"+ $(".showing").text() +"</span>"+
			"</div>"
		);
		
		$("#return_arrow").click(function()
		{
			if (/(iPhone|iPad|iPod|Safari)/i.test(navigator.userAgent)) 
			{             
	            window.location.href = window.document.referrer;
			} 
			else 
			{
				window.history.go("-1"); 
			}
		});
	}
	
	//显示玩项
	if ($("#game_change").length > 0)
	{
		var currentGameType = getUrlPara("game_type", window.location.href);
		var currentPowerID;
		
		for (var i = 0; i< gameTypeList.length; i++)
		{
			var gameTypeMenuObj = $(".child_menu_li[id='"+ gameTypeList[i][0] +"']").clone();
			
			$(gameTypeMenuObj).removeAttr("id")
				.removeAttr("parent_id", "")
				.attr("game_type",  getUrlPara("game_type", $(gameTypeMenuObj).attr("url")))
				.removeAttr("url")
				.appendTo($("#game_types_ul"));
			
			if (gameTypeList[i][4].indexOf("game_type=" + currentGameType) >= 0)
			{
				currentPowerID = gameTypeList[i][0]; 
				$("#game_type_name").prepend(gameTypeList[i][2]);
				$(gameTypeMenuObj).addClass("active");
			}
		}
		
		$("#game_types_ul").on("click", "li", function()
		{
			var gameType = $(this).attr("game_type");
			changeMenuByGameType(gameType);
			localStorage.GAME_TYPE = gameType;
		});
		var dir;
		$("body").on("touchstart", function(e) {
		    startX = e.originalEvent.changedTouches[0].pageX,
		    startY = e.originalEvent.changedTouches[0].pageY;
//		    e.preventDefault();
		    
		});
		$("body").on("touchmove", function(e) {
		    moveEndX = e.originalEvent.changedTouches[0].pageX,
		    moveEndY = e.originalEvent.changedTouches[0].pageY,
		    X = moveEndX - startX,
		    Y = moveEndY - startY;
		    if (startX < 50)
		    {
		    	return;
		    }
		    //left to right
		    if ( Math.abs(X) > Math.abs(Y) && X > 20 && X <= 60) 
		    {
		    	$("#game_types").addClass("show");
		    	$(".have_menu").addClass("have_game_types");
		    	
		    	$(".have_game_types").css("left", (X-20)+"%");
				$("#game_change").find(".arrow").removeClass("right").addClass("left");
				
				dir = "left2right";
		    }
		    //right to left
		    else if ( Math.abs(X) > Math.abs(Y) && X < 0) 
		    {
		    	if (X >= -40)
		    	{
		    		$(".have_game_types").css("left", (40-(Math.abs(X)))+"%");
		    	}
		    	$("#game_change").find(".arrow").removeClass("left").addClass("right");
		    	
		    	dir = "right2left";
		    }
//		    e.preventDefault();
		});
		$("body").on("touchend", function(e) 
		{
//			if ($("#me_div").hasClass("open"))
//			{
//				$("#me_div").click();
//			}
			if (dir == "left2right")
			{
				$(".have_game_types").css("left", "");
			}
			else if (dir == "right2left")
			{
				$("#game_types").removeClass("show");
				$(".have_game_types").css("left", "");
				$(".have_menu").removeClass("have_game_types");
			}
			stopBubble(e);
//			e.preventDefault();
		});
		
		$("#game_change").on("click", function()
		{
			if ($("#game_types").hasClass("show"))
			{
				$("#game_types").removeClass("show");
				$(".have_menu").removeClass("have_game_types");
				$("#game_change").find(".arrow").removeClass("left").addClass("right");
			}
			else
			{
				$("#game_types").addClass("show");
				$(".have_menu").addClass("have_game_types");
				$("#game_change").find(".arrow").removeClass("right").addClass("left");
			}
		});
		
		//显示玩项的子项
		if ($("#game_type_children").length > 0)
		{
			$(".menu_li[parent_id='"+ currentPowerID +"']").each(function(index)
			{
				var menuObj = $(this).clone(true)
				       .removeClass("list-group-item")
				       .removeClass("child_menu_li")
				       .addClass("nav_li")
				       .addClass("other_menu_li")
				       .attr("show_index", index)
				       .appendTo($("#other_menu_ul"));
				
				if ($(this).hasClass("have_children"))//如果有第四级菜单
				{
					$(menuObj).addClass("on_off").addClass("off").removeClass("menu_li").off("click");
					showID = $(this).attr("id");
					
					$(".menu_li[parent_id='"+ showID +"']").clone(true)
					    .removeClass("list-group-item")
					    .removeClass("child_menu_li")
					    .addClass("game_tab")
					    .addClass("nav_li")
					    .addClass("other_menu_li")
					    .appendTo($("#other_menu_ul")).hide();
				}
			});
			$("#other_menu_ul").appendTo($("#game_type_children"));
			
			if ($(".game_tab").length > 0)
			{
				$("#game_type_children").find(".other_menu_li").addClass("align_left");
			}
			
			$(".on_off").click(function()
			{
				var ID = $(this).attr("id");
				var childrenObj = $("#game_type_children").find(".other_menu_li[parent_id='"+ ID +"']");
				
				if ($(this).hasClass("off"))
				{
					window.location.href = $("#game_type_children").find(".other_menu_li[parent_id='"+ ID +"']:first").attr("url");
//					$(this).addClass("on");
//					$(this).removeClass("off");
//					
//					$(childrenObj).show();
//					
//					var index = $(this).attr("show_index")
//					var prevLength = $(this).prevAll().length-$(this).prevAll(".game_tab:hidden").length;
//					$("#game_type_children").scrollTop($(".other_menu_li").height()*(prevLength-1));
				}
				else
				{
					$(this).removeClass("on");
					$(this).addClass("off");
					$(childrenObj).hide();
					
				}
			});
			
			var showingObj = $("#game_type_children").find(".showing");
			var showingParentID = $("#game_type_children").find(".showing").attr("parent_id");
			var showingParentObj = $("#game_type_children").find("#" + showingParentID);
			$("#game_type_children").find(".game_tab[parent_id='"+ showingParentID +"']").addClass("on_bg")
			if ($(showingParentObj).hasClass("on_off"))
			{
				$(showingParentObj).addClass("on_bg");
				
				$(showingParentObj).addClass("on");
				$(showingParentObj).removeClass("off");
				var childrenObj = $("#game_type_children").find(".other_menu_li[parent_id='"+ showingParentID +"']");
				
				$(childrenObj).show();
				
			}
			
			var prevLength = ($(showingObj).prevAll().length+$(showingObj).length)-$(showingObj).prevAll(".game_tab:hidden").length;
			var scrollTop = $(".other_menu_li").height()*(prevLength+1);
			if (scrollTop > $("#game_type_children").height())
			{
				$("#game_type_children").scrollTop($(".other_menu_li").height()*(prevLength-1));
			}
		}
	}
	
    var logouMenu = $(".child_menu_li[url*='logout']");
    
    if (logouMenu.length > 0)
    {
        logouMenu.html(logouMenu.html().replace("{account}", g_account).replace('{user_name}', g_user_name));
    }

	//排版‘我’菜单为下拉菜单
	if ($("#me_div").length > 0)
	{
		$(".child_menu_li[parent_id='"+ menuMeID +"']").clone(true).appendTo($("#me_ul"));
		
		$(".me_div").width((100/$(".first_menu_li").length)+"%");
		$(".me_div").height($(".first_menu_li").height());
		
		$("#me_div").on("click", function(){
            $.post
            (
                "/bet/userInfo",
                "",
                function(data)
                {
                    $("#balance").text(data.credit_limit - data.credit_used);
                    $("#losewin").text(data.today_suplus);
                }
            );
		})
		
		$('#me_div').on('show.bs.dropdown', function () {
		   if ($("#game_types").hasClass("show"))
		   {
			   $("#game_change").click();
		   }
		})
	}
});

function changeMenuByGameType(gameType)
{
	var firstParentID = $(".first_menu_li.active").attr("id");
	
	$("#left_menu").find(".child_menu_li[parent_id='"+ firstParentID +"']").each(function()
	{
		if ($(this).attr("url").indexOf("game_type=" + gameType) >= 0)
		{
			window.location.href =  getChildMenuUrl($(this).attr("id"));
			return;
		}
	});
}

/**
 * 根据菜单ID递归取得菜单url
 */
function getChildMenuUrl(menuID)
{
	var urlObj = null;
	for (var i=0; i<parentList.length; i++)
	{
		if (parentList[i][0] == menuID)
		{
			urlObj = parentList[i];
			break;
		}
	}
	
	if (urlObj == null)
	{
		for (var i=0; i<childList.length; i++)
		{
			 if (childList[i][0] == menuID)
			 {
				   urlObj = childList[i];
				   break;
			 }
		}
	}
    //如果第一个菜单项没有指定url，则取其第一个子菜单的url
   while(urlObj[3] == '')
   {
	   for (var i=0; i<childList.length; i++)
	   {
		   if (childList[i][1] == menuID)
      	   {
      		   urlObj = childList[i];
      		   menuID = urlObj[0]
      		   break;
      	   }
		  
	   }
   }

	var url = urlObj[4] = '' ? urlObj[3] : urlObj[3] + "?" + urlObj[4];
	   
    return url;
}
