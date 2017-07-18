$(document).ready(function() {
    
    var slider = $('.bxslider').fadeIn("1000"). bxSlider({
        auto: true,
        infiniteLoop: true,
        controls: false,
        hideControl: true,
        mode: 'horizontal',
        useCSS: false,
        easing: 'easeInExpo',
        speed: 1500,
        randomStart: true,
        pager: false,
        responsive: true
    });
    $("#sticker").sticky({topSpacing:0});
    $('#sticker').on('sticky-start', function() {
        console.log("test");
        $(this).css('background' , 'rgba(0, 0, 0, 0.75)');
        $("nav a").css('color' , 'white');
    });
    $('#sticker').on('sticky-end', function() {
        console.log("test");
        $(this).css('background' , 'rgba(255, 255, 255, 0.35)');
        $("nav a").css('color' , 'black');
    });
    
    var speed = 500;
    $(".effect").each(function(i, el) {
        if (i % 2 === 0)
            $(this).show("slide", {}, speed);
        else 
            $(this).show( "slide", {direction: 'right'}, speed);
       speed+= 500;
    });
    $(".nav-wrapper").show("slide", {direction: 'right'}, 500);
    $(".visibility").animate({
                opacity: '1'
            }, 2000, "swing");
    
    $(document).on("click", ".menudown", function() {
        if ($("div").not($(this)).hasClass("active")) {
            var wasOpen = $(".active");
            wasOpen.removeClass("active");
            wasOpen.parent().parent().parent().next().slideUp("1500");
            wasOpen.html('Plus d\'infos');
        }
        $(this).toggleClass("active");
        if ($(this).hasClass("active")) {
            $(this).html('Moins d\'infos');
        } else $(this).html('Plus d\'infos');
        $(this).parent().parent().parent().next().slideToggle("1500");
    });
});
