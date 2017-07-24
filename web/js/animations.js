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
    
    // Effet d'apparition des div de chaques pages, chaque div arrive 0.5s plus lentement que celle qui la précède
    var speed = 500;
    $(".effect").each(function(i, el) {
        if (i % 2 === 0)
            $(this).show("slide", {}, speed);
        else 
            $(this).show( "slide", {direction: 'right'}, speed);
       speed += 150;
    });
    $(".nav-wrapper").show("slide", {direction: 'right'}, 500);
    $(".visibility").animate({ opacity: '1' }, 2000, "swing");
    
    // Affichage/Désaffichage des infos des meetings/result
    $(document).on("click", ".menudown-container", function() {
        if ($("div").not($(this)).hasClass("activated")) {
            var wasOpen = $(".activated");
            wasOpen.removeClass("activated");
            wasOpen.children(".plusinfo-container").children().removeClass('active');
            wasOpen.children(".plusinfo-container").children().html('Plus d\'infos');
            if (wasOpen.parent().next().hasClass("row-start"))
                wasOpen.parent().next().slideUp("1500").css('display', 'flex');
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
        if ($(this).parent().next().hasClass("row-start"))
            $(this).parent().next().slideToggle("1500").css('display', 'flex');
        else 
            $(this).parent().next().slideToggle("1500");
    });
    
    $(document).on("change", '.timeedit', function() { 
        
        var self = $(this);
        
        var id_meeting = $(this).parent().parent().parent().attr('id'); // retrieve current meeting's id
        var id = $(this).attr('id'); // retrieve current athlete's id
        var category = $('#category' + id).text(); // retrieve current athelete's category
        
        var coeff = getCoeff(category); // get coeff according to previously retrieved category
        var time = $(this).val(); // retrieve time's value typed in the input
        var points = Math.floor((1000/time) * coeff); // calculate athlete's points according to its time and coeff

        $('#points' + id).text(points); // update row "points" with the new calculated value
        
        // and send the data to the controller to add/update this result into database
        $.ajax({
            type: 'POST',
            url: "",
            data: {
                meeting_id    : id_meeting,
                user_id       : id,
                result_time   : time,
                result_points : points
            },
            success: function() {
                self.css("color", "#98FB98");
            },
            error: function() {
                self.css("color", "#FF6961");
                $('#points' + id).text("Veuillez rentrer un temps valide");
            }
        });
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
            case 'Benjamins':
                return 1.42;
            case 'Poussins':
                return 1.5;
        }
    }
});
