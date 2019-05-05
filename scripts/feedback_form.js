var isMob;
var WIwidth;
var validFrom = false;
var validEmail = false;
var validPhone = false;
var validSubject = true;
var validMessage = false;

/* проверка валидности поля "Ваше имя" */
$('#feedback-form__from').on('input change', fn_ValidFrom);

function fn_ValidFrom() {
    if ($('#feedback-form__from').val() != '') {
        $('#feedback-form__from').addClass('feedback-form-blank__input_green-border');
        $('#feedback-form__span-from').addClass('feedback-form_hide');
        validFrom = true;
    } else {
        $('#feedback-form__from').removeClass('feedback-form-blank__input_green-border');
        validFrom = false;
    }
    fn_ValidSubmit();
}

/* проверка валидности поля "Ваш e-mail" */
$('#feedback-form__email').on('input change', fn_ValidEmail);

function fn_ValidEmail() {
    var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
    if (pattern.test($('#feedback-form__email').val())) {
        $('#feedback-form__email').addClass('feedback-form-blank__input_green-border');
        $('#feedback-form__span-email').addClass('feedback-form_hide');
        $('#feedback-form__span-phone').addClass('feedback-form_hide');
        validEmail = true;
    } else {
        $('#feedback-form__email').removeClass('feedback-form-blank__input_green-border');
        validEmail = false;
    }
    fn_ValidSubmit();
}

/* проверка валидности поля "Ваш телефон"*/
$('#feedback-form__phone').mask('\8 (999) 999-99-99',
    {checkstep: fn_ValidPhone});
$('#feedback-form__phone').on('change', fn_ValidPhone);

function fn_ValidPhone() {
    var pattern = /[0-9]\s\([0-9]{3}\)\s[0-9]{3}\-[0-9]{2}\-[0-9]{2}/;
    if (pattern.test($('#feedback-form__phone').val())) {
        $('#feedback-form__phone').addClass('feedback-form-blank__input_green-border');
        $('#feedback-form__span-email').addClass('feedback-form_hide');
        $('#feedback-form__span-phone').addClass('feedback-form_hide');
        validPhone = true;
    } else {
        $('#feedback-form__phone').removeClass('feedback-form-blank__input_green-border');
        validPhone = false;
    }
    fn_ValidSubmit();
}

/* проверка валидности поля "Тема сообщения" */
if ($('select#feedback-form__select-subject').val() == 'Другое'){
	$('#feedback-form__subject').removeClass('feedback-form_hide');
    $('select#feedback-form__select-subject').removeClass('feedback-form-blank__input_green-border');
    fn_ValidSubject();
}

$('#feedback-form__select-subject').on("change",fn_ShowInputSubject);

function fn_ShowInputSubject (){
	if ($('select#feedback-form__select-subject').val() == 'Другое'){
		$('#feedback-form__subject').removeClass('feedback-form_hide');
        $('select#feedback-form__select-subject').removeClass('feedback-form-blank__input_green-border');
        validSubject = false;
	} else {
		$('#feedback-form__subject').addClass('feedback-form_hide');
        $('select#feedback-form__select-subject').addClass('feedback-form-blank__input_green-border');
        validSubject = true;
	}
    fn_ValidSubmit();
}

$('#feedback-form__subject').on('input change', fn_ValidSubject);

function fn_ValidSubject() {
    if ($('#feedback-form__subject').val() != '') {
        $('#feedback-form__subject').addClass('feedback-form-blank__input_green-border');
        $('select#feedback-form__select-subject').addClass('feedback-form-blank__input_green-border');
        $('#feedback-form__span-subject').addClass('feedback-form_hide'); 
        validSubject = true;
    } else {
        $('#feedback-form__subject').removeClass('feedback-form-blank__input_green-border');
        $('select#feedback-form__select-subject').removeClass('feedback-form-blank__input_green-border');
        validSubject = false;
    }
    fn_ValidSubmit();
}


/* проверка валидности поля "Текст сообщения" */
$('#feedback-form__message').on('input change',fn_ValidMessage);

function fn_ValidMessage() {
    if ($('#feedback-form__message').val() != '') {
        $('#feedback-form__message').addClass('feedback-form-blank__input_green-border');
        $('#feedback-form__span-message').addClass('feedback-form_hide');
        validMessage = true;
    } else {
        $('#feedback-form__message').removeClass('feedback-form-blank__input_green-border');
        validMessage = false;
    }
    fn_ValidSubmit();
}

/*проверка валидности всех полей */
function fn_ValidSubmit() {
    if (validFrom && (validEmail || validPhone) && validSubject && validMessage){
        $('#feedback-form__send').addClass('feedback-form-blank__all-valid-button');
    } else {
        $('#feedback-form__send').removeClass('feedback-form-blank__all-valid-button');
    }    
}


/* нажатие на кнопку отправки сообщения */
$('#feedback-form__send').on('click', function(){
    if (validFrom) {
        $('#feedback-form__span-from').addClass('feedback-form_hide');        
    } else {
        $('#feedback-form__span-from').removeClass('feedback-form_hide');        
    }
    
    if (validEmail || validPhone) {
        $('#feedback-form__span-email').addClass('feedback-form_hide');
        $('#feedback-form__span-phone').addClass('feedback-form_hide');       
    } else {
        $('#feedback-form__span-email').removeClass('feedback-form_hide');
        $('#feedback-form__span-phone').removeClass('feedback-form_hide');        
    }
    
    if (validSubject) {
        $('#feedback-form__span-subject').addClass('feedback-form_hide');      
    } else {
        $('#feedback-form__span-subject').removeClass('feedback-form_hide');        
    }
    
    if (validMessage) {
        $('#feedback-form__span-message').addClass('feedback-form_hide');        
    } else {
        $('#feedback-form__span-message').removeClass('feedback-form_hide');        
    }
    
    if (validFrom && (validEmail || validPhone) && validSubject && validMessage){
        $.ajax ({
            url: '../ajax/feedback_form_mail.php',
            type: 'POST',
            data: ({
                mail_from: $('#feedback-form__from').val(),
                mail_email: $('#feedback-form__email').val(),
                mail_phone: $('#feedback-form__phone').val(),
                mail_subject: function(){
                    if (($('select#feedback-form__select-subject').val() == 'Другое')){
                        return $('#feedback-form__subject').val()
                    } else {
                        return $('select#feedback-form__select-subject').val()
                    }
                },
                mail_user_message: $('#feedback-form__message').val()
            }),
            dataType: 'html',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            beforeSend: fn_FeedbackBefore,
            success: fn_FeedbackSuccess
        });
    }
});

function fn_FeedbackBefore () {
    
}

function fn_FeedbackSuccess (data) {
    var emailErrorCheck = false;
    var phoneErrorCheck = false;
    $('<div>', {class: 'feedback-form__disabled'}).appendTo('body');
        $('<div>', {class: isMob+'feedback-form__mail-answer'}).appendTo('.feedback-form__disabled');
        $('<p>', {
            id: 'feedback-form-mail-answer__error-header',
            class: isMob+'feedback-form-mail-answer__header feedback-form_hide',
            text: 'Во время отправки сообщения произошол сбой:'
        }).appendTo('.'+isMob+'feedback-form__mail-answer');
        $('<p>', {
            id: 'feedback-form-mail-answer__thanks-header',
            class: isMob+'feedback-form-mail-answer__header feedback-form_hide',
            text: 'Спасибо за ваше сообщение!'
        }).appendTo('.'+isMob+'feedback-form__mail-answer');
        $('<p>', {class: isMob+'feedback-form-mail-answer__thanks-message feedback-form_hide', text: 'В ближайшее время мы свяжемся с Вами.'}).appendTo('.'+isMob+'feedback-form__mail-answer');
        $('<p>', {class: isMob+'feedback-form-mail-answer__thanks-message feedback-form_hide', text: 'С уважением, Герасимчук Ю.Л.'}).appendTo('.'+isMob+'feedback-form__mail-answer');
        if (data != null) {
            var arr_answer = JSON.parse(data);
            $.each(arr_answer, function(name, arr_value){
                if (arr_value == true) {
                    if ((name == 'email_error' || name == 'phone_error') && !(validEmail || validPhone)) {   
                        $('#feedback-form-mail-answer__error-header').removeClass('feedback-form_hide');
                        $('<p>', {class: isMob+'feedback-form-mail-answer__error-text', text: 'Ошибка:'}).appendTo('.'+isMob+'feedback-form__mail-answer');
                        $('<p>', {class: isMob+'feedback-form-mail-answer__error-name', text: name}).appendTo('.'+isMob+'feedback-form__mail-answer');
                    } else if (!(name == 'email_error' || name == 'phone_error')) {
                        $('#feedback-form-mail-answer__error-header').removeClass('feedback-form_hide');
                        $('<p>', {class: isMob+'feedback-form-mail-answer__error-text', text: 'Ошибка:'}).appendTo('.'+isMob+'feedback-form__mail-answer');
                        $('<p>', {class: isMob+'feedback-form-mail-answer__error-name', text: name}).appendTo('.'+isMob+'feedback-form__mail-answer');
                    }
                }
            });
        } else {
            $('#feedback-form-mail-answer__error-header').removeClass('feedback-form_hide');
            $('<p>', {class: isMob+'feedback-form-mail-answer__error-text', text: 'Ошибка:'}).appendTo('.'+isMob+'feedback-form__mail-answer');
            $('<p>', {class: isMob+'feedback-form-mail-answer__error-name', text: 'Не удалось связаться с сервером'}).appendTo('.'+isMob+'feedback-form__mail-answer');
        }
        if ($('#feedback-form-mail-answer__error-header').hasClass('feedback-form_hide')) {
            $('#feedback-form-mail-answer__thanks-header').removeClass('feedback-form_hide');
            $('.'+isMob+'feedback-form-mail-answer__thanks-message').removeClass('feedback-form_hide');
        }
    $('<button>', {
        class: isMob+'feedback-form-mail-answer__button-close',
        on: {
            click: function (){
                    $('.feedback-form__disabled').remove();
                    fn_FormClean();
                }
            },
        text: 'OK'
        }).appendTo('.'+isMob+'feedback-form__mail-answer');
}

function fn_FormClean() {
    $('#feedback-form__from').val('');
    $('#feedback-form__from').removeClass('feedback-form-blank__input_green-border');
    $('#feedback-form__email').val('');
    $('#feedback-form__email').removeClass('feedback-form-blank__input_green-border');
    $('#feedback-form__phone').val('');
    $('#feedback-form__phone').removeClass('feedback-form-blank__input_green-border');
    $('#feedback-form__select-subject').val(1);
    $('#feedback-form__message').val('');
    $('#feedback-form__message').removeClass('feedback-form-blank__input_green-border');
    $('#feedback-form__send').removeClass('feedback-form-blank__all-valid-button');
}

/* Функции ниже для изменения функционала для телефона и пк */
function isMobile() {
	try {
        if(/Android|webOS|iPhone|iPad|iPod|pocket|psp|kindle|avantgo|blazer|midori|Tablet|Palm|maemo|plucker|phone|BlackBerry|symbian|IEMobile|mobile|ZuneWP7|Windows Phone|Opera Mini/i.test(navigator.userAgent)) {
			return true;
		};
		return false;
	} catch(e){ console.log("Error in isMobile"); return false; }
}

function fn_ScreenSize () {
    if (isMobile()) {
		isMob = 'phone-';
        if (screen.width > screen.height) {
            WIwidth = 'landscape';
        } else {
            WIwidth = 'portrait';
        }
    } else {
        isMob = '';
        WIwidth = window.innerWidth;
    }
}

$(window).on('resize orientationchange', fn_ScreenSize);