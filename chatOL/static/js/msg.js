/**
 * 各种工具
 * zhangjg
 */
var msg = (function () {
    var createElement, show, _ready,hide;
    //生成模板
    _ready = {
        createElement: function (msg, type) {
            $('body').append('<div class="sets-msg ' + type + '">' + msg + '</div>');
        },
    };

    show = function (msg, type, time) {
        type = type || 'success';
        msg = msg || '';
        time = time || 2000
        _ready.createElement(msg, type);
        $('.sets-msg').removeClass('none');
        setTimeout(function(){
            hide();
        },time);
    };
    hide = function(){
        $('.sets-msg').addClass('none');
    }

    return {
        show: show
    };
})();