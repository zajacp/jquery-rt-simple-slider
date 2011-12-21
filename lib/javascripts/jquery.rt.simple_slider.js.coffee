# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

    
    
$ ->
    #simple_slider()
    $(".simple_slider_content").simpleSlider
        "speed":5000
        'multiplication':2
        
    
    
(($) ->
    $.fn.simpleSlider = ( options )->
        $my_this  = $(this)
        settings = $.extend
            'speed': 5000      # domyślna szybkość
            'multiplication':2 # jak mamy mało elementów to możemy wstawić żeby więcej razy się 1 powielał
        ,options
        
        inter =  setInterval () ->
            true
        , 1000000
        methods = {
            run : ()->
                inter = setInterval () ->
                    $("ul", $my_this)..stop(true, true).animate
                        left: "-="+element_width
                    , () ->
                        if parseInt($("ul", $my_this).css("left")) < -1*(width-1)
                            $("ul", $my_this).css("left", 0)

                ,settings.speed
            stop : () ->
                clearInterval inter
        }
        element_width = parseInt $("ul li", $my_this).css("width") # długość li z css
        element_length = $("ul li", $my_this).length # ilość elementów
        width = element_width * element_length # długość ul
        width_2 = settings.multiplication * width
        $("ul", $my_this).css("width",width_2)
        for i in [1..settings.multiplication-1]
            $("ul", $my_this).append($("ul", $my_this).html())
        
        methods['run']()
        $("ul li", $my_this).hover () ->
            methods['stop']()
        ,() ->
            methods['run']()
        
)(jQuery)  
