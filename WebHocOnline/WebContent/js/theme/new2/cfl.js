(function ($) {
    function showConfirmPhoneModal($sid) {
        $('#confirmPhoneModal').find('[name="sid"]').val($sid)
        $('#confirmPhoneModal').modal('show');
    }

    function afterLoginCallback() {
        var $sid = $.cookie('cfl-register');
        if ($sid) {
            showConfirmPhoneModal($sid);
            $.removeCookie('cfl-register');
        }
    }

    function learnTrial() {
        $('[data-scroll="course-outline"]').trigger('click');
    }

    $(document).ready(function () {
        /*--------------------- CTA CLICK -------------------*/
        $(document).on('click', '[data-toggle="freelearn"]', function(e){
            e.preventDefault();
            var $this = $(this),
                $sid = $this.data('sourse'),
                $category = $this.data('category');

            $.ajax({
                url: '/luyen-thi-quoc-gia/course-free-learn/check-login.php',
                type: 'POST',
                data: {sid: $sid, category: $category},
                dataType: 'JSON',
                success: function ($response) {
                    switch ($response.status) {
                        case 'login':
                            $.cookie('cfl-register', $sid);
                            $('#loginModal').modal('show');
                            break;
                        case 'redirect':
                            window.location.href = $response.url;
                            break;
                        case 'reload':
                            window.location.reload();
                            break;
                        case 'cta-link':
                            window.location.href = $this.attr('href');
                        case 'logged':
                            //ÄĂ£ Ä‘Äƒng nháº­p
                            showConfirmPhoneModal($sid);
                            break;
                        case 'skipphone':
                        default:
                            learnTrial();
                            break;
                    }
                }
            });
        });
        /*--------------------- CTA CLICK -------------------*/

        /*--------------------- PHONE CONFIRM FORM -------------------*/
        $('#cfl-phone-form').validate({
            rules: {
                phone: {
                    required: true,
                    phone: true
                },
                phone2: {
                    required: true,
                    phone: true
                },
                code: {
                    required: true
                }
            },
            messages: {
                phone: {
                    required: '* báº¡n chÆ°a nháº­p sá»‘ Ä‘iá»‡n thoáº¡i',
                    phone: '* sá»‘ Ä‘iá»‡n thoáº¡i khĂ´ng há»£p lá»‡'
                },
                phone: {
                    required: '* báº¡n chÆ°a nháº­p láº¡i sá»‘ Ä‘iá»‡n thoáº¡i',
                    phone: '* sá»‘ Ä‘iá»‡n thoáº¡i khĂ´ng há»£p lá»‡'
                },
                code: {
                    required: '* báº¡n chÆ°a nháº­p mĂ£ xĂ¡c nháº­n'
                }
            },
            errorElement: 'div',
            errorPlacement: function (place, element) {
                place.addClass('error-message').appendTo(element.closest('div'));
            },
            highlight: function (element, errorClass, validClass) {
                if (element.type === "radio") {
                    this.findByName(element.name).addClass(errorClass).removeClass(validClass);
                } else if (element.type === "select-one" || element.type === "select-multiple") {
                    var $element = $(element);
                    $element.addClass(errorClass).removeClass(validClass);
                    var $next = $element.next();
                    if ($next.length > 0 && $next.hasClass('select2')) {
                        $next.addClass(errorClass).removeClass(validClass);
                    }
                } else {
                    $(element).addClass(errorClass).removeClass(validClass);
                }
            },
            unhighlight: function (element, errorClass, validClass) {
                if (element.type === "radio") {
                    this.findByName(element.name).addClass(validClass).removeClass(errorClass);
                } else if (element.type === "select-one" || element.type === "select-multiple") {
                    var $element = $(element);
                    $element.addClass(validClass).removeClass(errorClass);
                    var $next = $element.next();
                    if ($next.length > 0 && $next.hasClass('select2')) {
                        $next.addClass(validClass).removeClass(errorClass);
                    }
                } else {
                    $(element).addClass(validClass).removeClass(errorClass);
                }
            },
            submitHandler: function (form) {
                var $thisForm = $(form),
                    $modal = $thisForm.parents('.modal'),
                    $sbButton = $thisForm.find('#cfl-button');

                if ($thisForm.valid()) {
                    $sbButton.button('loading');
                    $.ajax({
                        type: "POST",
                        url: '/luyen-thi-quoc-gia/course-free-learn/register.php',
                        data: $thisForm.serialize(),
                        dataType: 'JSON',
                        success: function ($response) {
                            switch ($response.status) {
                                case 'success':
                                    $modal.modal('hide');
                                    learnTrial();
                                    break;
                                case 'error':
                                    $thisForm.find('.res-message').html('<p class="red">' + $response.message + '</p>').show();
                                    break;
                            }
                            $sbButton.button('reset').blur();
                        },
                        error: function () {
                            $modal.modal('hide');
                            show_message('Lá»—i', 'CĂ³ lá»—i xáº£y ra, vui lĂ²ng thá»±c hiá»‡n láº¡i thao tĂ¡c.');
                            $sbButton.button('reset').blur();
                        }
                    });
                }
                return false;
            }
        });
        /*--------------------- PHONE CONFIRM FORM -------------------*/

        $(document).on('click', 'a.scorm-free', function (e) {
            if ($('[data-toggle="freelearn"]').length > 0) {
                e.preventDefault();
                var $this = $(this);
                $.ajax({
                    url: '/luyen-thi-quoc-gia/course-free-learn/check-login.php',
                    type: 'POST',
                    data: {},
                    dataType: 'JSON',
                    success: function ($response) {
                        switch ($response.status) {
                            case 'skipphone':
                                //ÄĂ£ Ä‘Äƒng kĂ½ há»c miá»…n phĂ­
                                window.location.href = $this.attr('href');
                                break;
                            default:
                                $('[data-toggle="freelearn"]').trigger('click');
                                break;
                        }
                    }
                });
            }
        });

        afterLoginCallback();
    });
})(jQuery);