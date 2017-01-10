/**
 * 各种工具
 * zhangjg
 */
var plugin = (function(){
	var transform,rotating,isWeiXin,formatTime,textFormate,logout,showAlert,htmlEncode,_charEntities,_rIsHtml,_rHtmlEncode,_getCharEntity,setTimeStamp;
	
	_charEntities = { // HTML 和 属性 编码使用
			"&" : "&amp;",
			"<" : "&lt;",
			">" : "&gt;",
			"\x00" : "&#0;",
			"'" : "&#39;",
			'"' : "&#34;",
			"`" : "&#96;"
		}, _rIsHtml = /[\x00`><\"'&]/, _rHtmlEncode = /[\x00`><"'&]/g
	
	//图片旋转
	transform = function(){
		var $this = $(this);
		if ($this.hasClass("role3")) {
			$this.removeClass("role3").addClass("role2");
			setTimeout(function() {
				$this.removeClass("role2").addClass("role1");
				setTimeout(function() {
					$this.removeClass("role1");
				}, 45)
			}, 45);
			if($this.closest('.partdesc').length>0){
				var $div = $($this.closest('.partdesc'));
				if($div.find('.sharecontent').length>0){
					$div.find('.sharecontent').addClass('none');
				}
				setTimeout(function(){
					$div.find('.p-min')./*html(textFormate($div.data("desc"),60))*/hide();
					$div.find('.title-area').hide();
				},10);
		}else if($this.closest('.activity').length>0){
			$this.closest('.activity').find('.address-setting').addClass("none");
		}
		} else {
			$this.addClass("role1");
			setTimeout(function() {
				$this.removeClass("role1").addClass("role2");
				setTimeout(function() {
					$this.removeClass("role2").addClass("role3");
				}, 45)
			}, 45);
			if($this.closest('.partdesc').length>0){
				var $div = $($this.closest('.partdesc'));
				$div.find('.p-min')./*html($div.data("desc"))*/show();
				$div.find('.title-area').show();
				$div.find('.sharecontent').removeClass('none');
			}else if($this.closest('.activity').length>0){
				$this.closest('.activity').find('.address-setting').removeClass("none");
			}
		};
	};
	rotating = function($container){
		$container.bind('click',transform);
	};
	/**
	 * 结尾补0
	 */
	appendZero = function(n, pos) {
		n = '' + n;
		if (n.length < pos) {
			n = n + '0'.repeat(pos - n.length);
		}
		return n;
	};
	
	_getCharEntity = function(ch) {
		return _charEntities[ch] || (_charEntities[ch] = "&#" + ch.charCodeAt(0) + ";");
	};
	
	htmlEncode = function(text) {
		// HTML encode: Replace < > & ' and " by corresponding entities.
		return text != null ? _rIsHtml.test(text) && ("" + text).replace(_rHtmlEncode, _getCharEntity) || text : "";
	};
	
	//格式化时间戳
	formatTime = function(timeStamp, precise, defaultVal) {
		if (!isNaN(timeStamp * 1) && timeStamp * 1 > 0) {
			timeStamp = appendZero(timeStamp, 13) * 1;
			var currT = new Date();
			currT.setTime(timeStamp);
			var fmt = '';
			precise = precise || 'second';
			switch (precise) {
			case 'second':
				fmt = ':' + ((currT.getSeconds() + '').length == 2 ? currT.getSeconds() : ('0' + currT.getSeconds()));
			case 'minute':
				fmt = ':' + ((currT.getMinutes() + '').length == 2 ? currT.getMinutes() : ('0' + currT.getMinutes())) + fmt;
			case 'hour':
				fmt = ' ' + ((currT.getHours() + '').length == 2 ? currT.getHours() : ('0' + currT.getHours())) + fmt;
			case 'day':
				fmt = '-' + ((currT.getDate() + '').length == 2 ? currT.getDate() : ('0' + currT.getDate())) + fmt;
			case 'month':
				fmt = '-'
						+ ((currT.getMonth() + 1 + '').length == 2 ? (currT.getMonth() + 1) : ('0' + (currT.getMonth() + 1)))
						+ fmt;
			case 'year':
				fmt = currT.getFullYear() + fmt;
			}
			return fmt;
		} else {
			return defaultVal || '';
		}
	};
	//文字截取
	textFormate = function(str,i){
		 var str = $.trim(""+str);
		 if(str.length>i){
			 str = str.substring(0,i)+"…";
		 }else{
			 str = str;
		 }
		 return str;
	};
	//登出
	logout = function(){
		$.ajax({
			url:"account/logout",
			type:"post",
			success:function(result){
				location.replace(root+'/home');
			}
		});
	};
	//提示条
  showAlert = function($alert, text, timeout){

    $alert.text(text).show();

    setTimeout(function(){
      $alert.text('').hide();
    }, timeout || 2000);
    
  };
	isWeiXin =  function (){
		var ua = window.navigator.userAgent.toLowerCase();
		if(ua.match(/MicroMessenger/i) == 'micromessenger'){
			return true;
		}else{
			return false;
		}
	}
  setTimeStamp = function(time,sign){
        var date = new Date();
        date.setYear(time.split('-')[0]);
        date.setMonth(time.split('-')[1]*1-1);
        date.setDate(time.split('-')[2].split(sign)[0]);
        date.setHours(time.split('-')[2].split(sign)[1].split(':')[0]);
        date.setMinutes(time.split('-')[2].split(sign)[1].split(':')[1]);
        date.setSeconds(0);
        return date.getTime();
  };
	return{
		rotating : rotating,
		formatTime :formatTime,
		textFormate : textFormate,
		logout:logout,
		showAlert:showAlert,
		htmlEncode : htmlEncode,
        setTimeStamp : setTimeStamp,
		isWeiXin : isWeiXin
	};
})();