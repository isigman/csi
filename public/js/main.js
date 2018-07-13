$(document).ready(function ($) {
    $('.fading-carousel').slick({
        dots: true,
        arrows: true,
        infinite: true,
        speed: 600,
        fade: true,
        cssEase: 'linear'
    });
    $('.fading-carousel').slick('slickPlay');

    $('.scroll').slick({
        speed: 10000,
        autoplay: true,
        autoplaySpeed: 0,
        cssEase: 'linear',
        slidesToShow: 1,
        slidesToScroll: 1,
        variableWidth: true
    });
    $('.scroll').slick('slickPlay');

    $('#criteria').hide();

    $("#crit_btn").click(function () {
        $("#criteria").slideToggle("slow");
    });

});




