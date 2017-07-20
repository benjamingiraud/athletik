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
    $(document).on("click", ".menudown-container", function() {
        if ($("div").not($(this)).hasClass("activated")) {
            var wasOpen = $(".activated");
            wasOpen.removeClass("activated");
            wasOpen.children(".plusinfo-container").children().removeClass('active');
            wasOpen.children(".plusinfo-container").children().html('Plus d\'infos');
            wasOpen.parent().next().slideUp("1500");
        }
        $(this).toggleClass("activated");
        if ($(this).hasClass("activated")) {
            $(this).children(".plusinfo-container").children().addClass('active');
            $(this).children(".plusinfo-container").children().html('Moins d\'infos');
        } else {
             $(this).children(".plusinfo-container").children().removeClass('active');
            $(this).children(".plusinfo-container").children().html('Plus d\'infos');
        }
        $(this).parent().next().slideToggle("1500");
    });
    
    $(document).on("change", '.timeedit', function() {
       $id = $(this).attr('id');
       
       $category = $('#category' + $id).html();
       $coeff = getCoeff($category);
       
       $points = (1000/$(this).val()) * $coeff;
       $('#time' + $id).html(Math.floor($points));
    });
    function getCoeff($category) {
        switch($category) {
            case 'Masters':
                return 1.35;
            case 'Seniors':
                return 1;
            case 'Espoirs':
                return 1.09;
            case 'Juniors':
                return 1.18;
            case 'Cadets':
                return 1.21;
            case 'Minimes':
                return 1.35;
            case 'Benjamin':
                return 1.42;
            case 'Poussins':
                return 1.5;
        }
    }
});
