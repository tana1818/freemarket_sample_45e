jQuery(function($){

var _window = $(window),
    _header = $('.site-header'),
    _resmenu = $('#responsive-menu-button'),
    _logo = $('.logo'),
    heroBottom;

_window.on('scroll',function(){
    heroBottom = $('.hero').height();
    if(_window.scrollTop() > heroBottom){
        _header.addClass('transform');
        _resmenu.addClass('transform');
        _logo.addClass('transform');
    }
    else{
        _header.removeClass('transform');
        _resmenu.removeClass('transform');
        _logo.removeClass('transform');
    }
});

_window.trigger('scroll');

});
