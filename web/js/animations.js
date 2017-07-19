$(document).ready(function() {
    
    // Declaration du slider de l'index
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
    // Declaration des calendriers
    $( ".js-datepicker" ).datepicker({
        dateFormat: "yy/mm/dd"
    });
    // Declaration du stikcy
    $("#sticker").sticky({topSpacing:0});
    // Gestion des effets quand le sticky commence
    $('#sticker').on('sticky-start', function() {
        $(this).css('background' , 'rgba(0, 0, 0, 0.75)');
        $("#minititle").slideUp("500");
        $("nav a").css('color' , 'white');
        $(".nav-wrappering").animate({
            width: '95%'
        }, 500, function() {
            $("#minititle").slideDown("500");
        });
    });
    // Gestion des effets quand le sticky ne fait plus effet
    $('#sticker').on('sticky-end', function() {
        $(this).css('background' , 'rgba(255, 255, 255, 0.35)');
        $("#minititle").slideUp("500");
        $("nav a").css('color' , 'black');
        $(".nav-wrappering").animate({
            width: '75%'
        }, 500, function() {
           
        });
    });
    
    // Effet d'apparition des div de chaques pages, chaque div arrive 0.5s plus 
    // lentement que celle qui la précède
    var speed = 500;
    $(".effect").each(function(i, el) {
        if (i % 2 === 0)
            $(this).show("slide", {}, speed);
        else 
            $(this).show( "slide", {direction: 'right'}, speed);
       speed += 500;
    });
    $(".nav-wrapper").show("slide", {direction: 'right'}, 500);
    $(".visibility").animate({
                opacity: '1'
            }, 2000, "swing");
    
    // Affichage/Désaffichage des infos des meetings/result
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
