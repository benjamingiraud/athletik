$(document).ready(function() {
    var slider = $('.bxslider').bxSlider({
        auto: true,
        infiniteLoop: true,
        controls: false,
        hideControl: true,
        mode: 'horizontal',
        useCSS: false,
        easing: 'easeInOutBack',
        speed: 1500,
        randomStart: true,
        pager: false,
        responsive: true
    });

    $( "#what" ).show( "slide", {}, 500);
    $( "#who" ).show( "slide", {direction: 'right'}, 1000);
    $( "#how" ).show( "slide", {}, 1500);
//    $( "#where" ).show( "slide", {direction: 'right'}, 1500, showSlider());
//    
//    function showSlider() {
//        $('.bxslider').show( "slide", {direction: 'right'}, 750, slider.reloadSlider());
//    }
//    
});
