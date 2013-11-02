$(document).ready(function(){

    $(".map").fancybox({
        'width'             : '80%',
        'height'            : '80%',
        'autoScale'         : false,
        'transitionIn'      : 'none',
        'transitionOut'     : 'none',
        'type'              : 'iframe'
    });

    $(".expand").fancybox({
        'transitionIn'      : 'none',
        'transitionOut'     : 'none'
    });

    //$("#signature_cpf_cnpj").inputmask("{ mask: ["999.999.999-99", "99.999.999/9999-99"]}");
    $("#contact_phone, #signature_phone").inputmask("(99)9999-9999");
    $("#signature_birth").inputmask("99/99/9999");

    $('#banner').bxSlider({
      preloadImages: 'all',
      pager: false
    });
});
