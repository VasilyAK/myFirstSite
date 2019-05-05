var boo_BusketSel = false;
var boo_UserPanelVisible = true;
var isMob;
var totalCost = 0;
var totalCostCoef = 1;
var totalCostExpertDeparture = 0;
var WIwidth;


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
        $('.busket-content__header').addClass('phone-busket-content__header');
        $('.phone-busket-content__header').removeClass('busket-content__header');
        $('.phone-busket-content__header').addClass('phone-busket-content-header__text');
        $('.phone-busket-content__header').removeClass('busket-content-header__text');
        $('.busket-content__items').addClass('phone-busket-content__items');
        $('.phone-busket-content__items').removeClass('busket-content__items');
        $('.busket-content__total').addClass('phone-busket-content__total');
        $('.phone-busket-content__total').removeClass('busket-content__total');
        $('.total__button-block').addClass('phone-total__button-block');
        $('.phone-total__button-block').removeClass('total__button-block');
        $('.total-button-block__button').addClass('phone-total-button-block__button');
        $('.phone-total-button-block__button').removeClass('total-button-block__button');
        $('.total-button-block__button-add').addClass('phone-total-button-block__button-add');
        $('.phone-total-button-block__button-add').removeClass('total-button-block__button-add');
        $('.total-button-block__button-remove').addClass('phone-total-button-block__button-remove');
        $('.phone-total-button-block__button-remove').removeClass('total-button-block__button-remove');
        $('.total__cost-label').addClass('phone-total__cost-label');
        $('.phone-total__cost-label').removeClass('total__cost-label');
        $('.total__cost-label-span').addClass('phone-total__cost-label-span');
        $('.phone-total__cost-label-span').removeClass('total__cost-label-span');
        $('.busket-content__control').addClass('phone-busket-content__control');
        $('.phone-busket-content__control').removeClass('busket-content__control');
        $('.control__button').addClass('phone-control__button');
        $('.phone-control__button').removeClass('control__button');
        $('.busket-content-info').addClass('phone-busket-content-info');
        $('.phone-busket-content-info').removeClass('busket-content-info');
    } else {
        isMob = '';
        WIwidth = window.innerWidth;
    }
     
    if (WIwidth < 550) {
        $('.user-block__name').addClass('user-panel_hide');
        $('.busket-block__info').addClass('user-panel_hide');
    } else if (WIwidth >= 550) {
        $('.user-block__name').removeClass('user-panel_hide');
        $('.busket-block__info').removeClass('user-panel_hide');
    }
    
    if (WIwidth === 'portrait') {
        $('.user-block__name').addClass('user-panel_hide');
        $('.busket-block__info').addClass('user-panel_hide');
        $(document).ready(function(){
            $('.'+isMob+'item-name__total:first').text('С-ть');
        });
    } else if (WIwidth === 'landscape')  {
        $('.user-block__name').removeClass('user-panel_hide');
        $('.busket-block__info').removeClass('user-panel_hide');
        $(document).ready(function(){
            $('.'+isMob+'item-name__total:first').text('Стоимость');
        });
    }
}

$(window).on('resize orientationchange', fn_ScreenSize);
fn_ScreenSize ();


/* Показать/скрыть панель при нажатии на кнопку  "Скрыть/показать панель пользователя"*/
$('.user-panel-menu__mod').on('click', function(){
    if (boo_UserPanelVisible){
        $('.user-panel-menu__reg-block').addClass('user-panel_hide');
        $('.user-panel-menu__user-block').addClass('user-panel_hide');
        $('.user-panel-menu__busket-block').addClass('user-panel_hide');
        $('.user-panel-menu').attr('class', 'user-panel-menu_min');
        $('.mod__img').attr('class', 'mod__img_min');
        $('.main-header-block').css('margin','5px 0 4px -1%');
        boo_UserPanelVisible = false;
    } else {
        $('.user-panel-menu__reg-block').removeClass('user-panel_hide');
        $('.user-panel-menu__user-block').removeClass('user-panel_hide');
        $('.user-panel-menu__busket-block').removeClass('user-panel_hide');
        $('.user-panel-menu_min').attr('class', 'user-panel-menu');
        $('.mod__img_min').attr('class', 'mod__img');
        $('.main-header-block').css('margin','30px 0 4px -1%');
        boo_UserPanelVisible = true;
    }
})

$('.busket-block__busket-button').on('click', fn_CloseBusket);

function fn_CloseBusket() {
    if (boo_BusketSel) {      
        $('.busket-content').addClass('user-panel_hide');
        boo_BusketSel = false;
    } else {
        $('.busket-content').removeClass('user-panel_hide');
        boo_BusketSel = true;
    }
}


/* функция-запрос на наличие итемов-заказов в сессии */
$(document).ready(function() {
    $.ajax ({
        url: '../ajax/mySQL_busket.php',
        type: 'POST',
        data: {on_load: true},
        dataType: 'html',
        beforeSend: fn_BeforeMoveToBusket,
        success: fn_SuccessMoveToBusket
    });
})

function fn_BeforeMoveToBusket () {
    
}

function fn_SuccessMoveToBusket (data) {
    if (data != "null") {
        totalCost = 0;
        totalCostCoef = 1;
        totalCostExpertDeparture = 0;
        $('.'+isMob+'busket-content__items').children().remove();
        /* Создается заголовок таблицы */
        $('<thead>', {class: isMob+'busket-content__items-tread'}).appendTo('.'+isMob+'busket-content__items');
            $('<tr>', {class: isMob+'busket-content__items-tr'}).appendTo('.'+isMob+'busket-content__items-tread');
                $('<td>', {class: isMob+'item-name__sel '+isMob+'busket-content__items-td'}).appendTo('.'+isMob+'busket-content__items-tr:last');
                $('<td>', {class: isMob+'item-name__number '+isMob+'busket-content__items-td', text: '№'}).appendTo('.'+isMob+'busket-content__items-tr:last');
                $('<td>', {class: isMob+'item-name__servise '+isMob+'busket-content__items-td', text: 'Наименование услуги'}).appendTo('.'+isMob+'busket-content__items-tr:last');
                $('<td>', {class: isMob+'item-name__quant '+isMob+'busket-content__items-td', text: 'Количество'}).appendTo('.'+isMob+'busket-content__items-tr:last');
                $('<td>', {class: isMob+'item-name__cost '+isMob+'busket-content__items-td', text: 'Цена'}).appendTo('.'+isMob+'busket-content__items-tr:last');
                if (WIwidth === 'portrait') {
                    $('<td>', {class: isMob+'item-name__total '+isMob+'busket-content__items-td', text: 'С-ть'}).appendTo('.'+isMob+'busket-content__items-tr:last');
                } else {
                    $('<td>', {class: isMob+'item-name__total '+isMob+'busket-content__items-td', text: 'Стоимость'}).appendTo('.'+isMob+'busket-content__items-tr:last');
                }
        var arr_answer = JSON.parse(data);
        $.each(arr_answer, function(name, arr_value){            
            var item_numb = parseInt(name,10)+1;
            var textAfter = ' руб.';
            if (arr_value['metrics'] == 'коэф.') {
                textAfter = '';
            }
            $('<tr>', {class: isMob+'busket-content__items-tr'}).appendTo('.'+isMob+'busket-content__items');
                $('<td>', {class: isMob+'item-name__sel '+isMob+'busket-content__items-td'}).appendTo('.'+isMob+'busket-content__items-tr:last');
                    $('<input>', {class: isMob+'item-name__sel-input', id: 'item-name__sel-input-'+item_numb, type: 'checkbox'}).appendTo('.'+isMob+'item-name__sel:last');
                $('<td>', {class: isMob+'item-name__number '+isMob+'busket-content__items-td', text: item_numb}).appendTo('.'+isMob+'busket-content__items-tr:last');
                $('<td>', {class: isMob+'item-name__servise '+isMob+'busket-content__items-td', id: 'item-name__servise-'+item_numb, text: arr_value['name']}).appendTo('.'+isMob+'busket-content__items-tr:last');
                $('<td>', {class: isMob+'item-name__quant '+isMob+'busket-content__items-td'}).appendTo('.'+isMob+'busket-content__items-tr:last');
                $('<div>', {class: isMob+'item-name__quant-block'}).appendTo('.'+isMob+'item-name__quant:last');
                    if (arr_value['metrics'] != 'коэф.') {    
                        $('<button>', {
                            class: isMob+'item-name__quant-block-button '+isMob+'item-name__quant-block-plus',
                            id: 'item-name__quant-block-plus-'+item_numb,
                            on: {
                                click: function (){
                                    var id_plus = $(this).attr('id').substr(28);
                                    $.ajax ({
                                        url: '../ajax/mySQL_busket.php',
                                        type: 'POST',
                                        data: {busket_change_plus: id_plus},
                                        dataType: 'html'
                                    });
                                    $('#item-name__quant-block-'+id_plus).val(parseInt($('#item-name__quant-block-'+id_plus).val())+1);
                                    $('#item-name__total-'+id_plus).text((arr_value['cost']*parseInt($('#item-name__quant-block-'+id_plus).val()))+textAfter);
                                    /* Особые условия для пунктов "Дополнительные расходы"*/
                                    if ($('#item-name__servise-'+id_plus).text().substr(0,17) != 'Выезд специалиста') {
                                        totalCost += parseInt(arr_value['cost']);
                                    } else {
                                       totalCostExpertDeparture += parseInt(arr_value['cost']);
                                    }
                                    $('.'+isMob+'total__cost-label-span').text(totalCost*totalCostCoef+totalCostExpertDeparture+' руб.');
                                }
                            },
                            text: '+',
                            title: 'Увеличить'
                        }).appendTo('.'+isMob+'item-name__quant-block:last');
                        
                        $('<input>', {
                            class: isMob+'item-name__quant-block-text',
                            id: 'item-name__quant-block-'+item_numb,
                            on: {
                                /* Запрет вводить все кроме чисел, значение не может быть меньше 1 */
                                keydown: function (e) {
                                    if(e.key.length == 1 && e.key.match(/[^0-9]/)) {
                                        return false;
                                    }
                                },
                                change: function () {
                                    var id_input = $(this).attr('id').substr(17);
                                    do {
                                        if($(this).val().substr(0,1) == '0') {
                                            $(this).val($(this).val().substr(1)); 
                                        } else {
                                            break;
                                        }
                                    } while ($(this).val().length >0);
                                    if ($(this).val() == '') {
                                        $(this).val('1');
                                    }
                                    $.ajax ({
                                        url: '../ajax/mySQL_busket.php',
                                        type: 'POST',
                                        data: {busket_change_input: id_input, busket_change_quant: $('#item-name__quant-block-'+id_input).val()},
                                        dataType: 'html'
                                    });
                                    $('#item-name__total-'+id_input).text((arr_value['cost']*parseInt($('#item-name__quant-block-'+id_input).val()))+textAfter);
                                     /* Особые условия для пунктов "Дополнительные расходы" */
                                    totalCost = 0;
                                    totalCostExpertDeparture = 0;
                                    $.each($('.'+isMob+'item-name__total'), function(key, val){
                                        if ($(this).text().slice(-4) == 'руб.') {
                                            if ($('#item-name__servise-'+key).text().substr(0,17) != 'Выезд специалиста') {
                                               totalCost += parseInt($(this).text().slice(0, -5));
                                            } else {
                                                totalCostExpertDeparture += parseInt($(this).text().slice(0, -5));
                                            }  
                                       }
                                    });
                                    $('.'+isMob+'total__cost-label-span').text(totalCost*totalCostCoef+totalCostExpertDeparture+' руб.');
                                }
                            },
                            type: 'text',
                            value: arr_value['quant']
                        }).appendTo('.'+isMob+'item-name__quant-block:last');
                        
                        $('<button>', {
                            class: isMob+'item-name__quant-block-button '+isMob+'item-name__quant-block-minus',
                            id: 'item-name__quant-block-minus-'+item_numb,
                            on: {
                                click: function (){
                                    var id_minus = $(this).attr('id').substr(29);
                                    if ($('#item-name__quant-block-'+id_minus).val()>1) {
                                        $.ajax ({
                                            url: '../ajax/mySQL_busket.php',
                                            type: 'POST',
                                            data: {busket_change_minus: id_minus},
                                            dataType: 'html'
                                        });                                        
                                        $('#item-name__quant-block-'+id_minus).val(parseInt($('#item-name__quant-block-'+id_minus).val())-1);
                                        /* Особые условия для пунктов "Дополнительные расходы" */
                                        if ($('#item-name__servise-'+id_minus).text().substr(0,17) != 'Выезд специалиста') {
                                            totalCost -= parseInt(arr_value['cost']);
                                        } else {
                                           totalCostExpertDeparture -= parseInt(arr_value['cost']);
                                        }
                                    }
                                    $('#item-name__total-'+id_minus).text((arr_value['cost']*parseInt($('#item-name__quant-block-'+id_minus).val()))+textAfter);
                                    $('.'+isMob+'total__cost-label-span').text(totalCost*totalCostCoef+totalCostExpertDeparture+' руб.');
                                }
                            },
                            text: '-',
                            title: 'Уменьшить'
                        }).appendTo('.'+isMob+'item-name__quant-block:last');
                    }     
                    
                    if (arr_value['metrics'] != null) {
                        $('<p>', {class: isMob+'item-name__quant-block-metric', text: arr_value['metrics']}).appendTo('.'+isMob+'item-name__quant-block:last');
                    } 
                $('<td>', {
                    class: isMob+'item-name__cost '+isMob+'busket-content__items-td',
                    text: arr_value['cost']+textAfter
                }).appendTo('.'+isMob+'busket-content__items-tr:last');
                $('<td>', {
                    class: isMob+'item-name__total '+isMob+'busket-content__items-td',
                    id: 'item-name__total-'+item_numb,
                    text: arr_value['cost']*arr_value['quant']+textAfter
                }).appendTo('.'+isMob+'busket-content__items-tr:last');
                /* Особые условия для пунктов "Дополнительные расходы" */
                if (arr_value['metrics'] != 'коэф.'){
                    if (arr_value['name'].substr(0,17) != 'Выезд специалиста') {
                        totalCost += parseInt(arr_value['cost'])*parseInt(arr_value['quant']);
                    } else {
                        totalCostExpertDeparture += parseInt(arr_value['cost']);
                    }
                } else {
                        totalCostCoef *= parseFloat(arr_value['cost']);
                }
        });
        $('.'+isMob+'total__cost-label-span').text(totalCost*totalCostCoef+totalCostExpertDeparture+' руб.');
        fn_BusketWarning ();
    } else {
        $('.'+isMob+'busket-content__items').children().remove();
        $('<td>', {class: isMob+'busket-content-items__info', text: 'Корзина пуста'}).appendTo('.'+isMob+'busket-content__items');
        $('.'+isMob+'total__cost-label-span').text('___ руб.');
        fn_BusketWarning ();
    }
}


/* предупреждение о изменении состояния корзины */
function fn_BusketWarning () {
    if ($('.'+isMob+'busket-content__items-tr').length > 0) {
        $('.busket-block__info').text('Всего наименований: '+($('.'+isMob+'busket-content__items-tr').length-1));
        if ($('.busket-content').hasClass('user-panel_hide')) {
        var boo_BusketHide = true;
        var timer_BusketWarning = window.setInterval(function(){
            if (boo_BusketHide){
                $('.user-panel-menu__busket-block').addClass('user-panel-menu__busket-block_bgred');
                boo_BusketHide = false;
            } else {
                $('.user-panel-menu__busket-block').removeClass('user-panel-menu__busket-block_bgred');
                boo_BusketHide = true;
            }
        }, 500);
        setTimeout(function() {
            clearInterval(timer_BusketWarning);
            $('.user-panel-menu__busket-block').removeClass('user-panel-menu__busket-block_bgred');
        }, 3000);            
        }
    } else {
        $('.busket-block__info').text('Корзина пуста');
    }
}


/* кнопки управления корзины */
/* нажатие на кнопку удаления записей из корзины */
$('.'+isMob+'total-button-block__button-remove').on('click', function(){
    var id_del_item = [];
    $.each($('.'+isMob+'item-name__sel-input'), function(){
        if ($(this).prop('checked') == true){
            id_del_item.push($(this).attr('id').substr(21));
        }  
    })
    
    if (id_del_item.length != 0) {
        $.ajax ({
            url: '../ajax/mySQL_busket.php',
            type: 'POST',
            data: {busket_del_item: id_del_item},
            dataType: 'html',
            beforeSend: fn_BeforeMoveToBusket, /* функция взята из файла user-panel.js */
            success: fn_SuccessMoveToBusket /* функция взята из файла user-panel.js */
        });
    } else {
        fn_infoMessage('order_create_info',{
            header: 'Невозможно удалить',
            text: 'Не выбрана ни одна запись'
        });
    }
});


/* нажатие на кнопку добавления записей в корзину */
$('.'+isMob+'total-button-block__button-add').on('click', function(){
    $(location).attr('href', 'http://mysite.ipgerasimchuk.ru/index.php?price_inc_open');
});

$(document).ready(function(){
    if ($(location).attr('href').split('?')[1] == 'price_inc_open') {
        $('html, body').scrollTop($(".price-inc").offset().top-50);
        $('.price_details').attr('open', 'true');
    }
});


/* нажати на кнопку закрытия корзины */
$('#control__button-close').on('click', fn_CloseBusket);

$(document).ready(function() {
    $('.user-panel').on('click', function(event){
        if($(this).hasClass(event.target.className)) {
            fn_CloseBusket();
        }
    });
});


/* нажатие на кнопку заказа услуг */
$(document).ready(function() {
    $('#control__button-buy').on('click', function() {
        var boo_serviceSpecial = false;
        if ($('.'+isMob+'item-name__servise').length != 0) {
            $.each($('.'+isMob+'item-name__servise'), function(){
                if ($(this).html().substr(0,17) == "Выезд специалиста"){
                    boo_serviceSpecial = true;
                    $.ajax ({
                        url: '../ajax/mySQL_busket.php',
                        type: 'POST',
                        data: {busket_add_order_user: '1'},
                        dataType: 'html',
                        beforeSend: fn_BeforeFormOrder,
                        success: fn_SuccessFormOrder
                    });
                    return false;
                }
            });
            if (!boo_serviceSpecial) {
                fn_infoMessage('order_create_info',{
                    header: 'Невозможно сформировать заказ',
                    text: 'В вашем заказе отсутствует <b>"Выезд специалиста"</b>. Пожалуйста, перейдите в раздел <b>"Дополнительные расходы"</b>.'
                });
            }
        } else {
            fn_infoMessage('order_create_info',{
                header: 'Невозможно сформировать заказ',
                text: 'Корзина пуста.'
            });
        }
    });
});

function fn_BeforeFormOrder () {
    
}

function fn_SuccessFormOrder(data) {
    if (data != null) {
        $('<div>', {class: isMob+'busket-buy__disabled'}).appendTo('body');
            $('<div>', {class: isMob+'busket-buy__send-form'}).appendTo('.'+isMob+'busket-buy__disabled');
                $('<p>', {class: isMob+'busket-buy-send-form__header', text: 'Сформирован заказ'}).appendTo('.'+isMob+'busket-buy__send-form');
                $('<p>', {class: isMob+'busket-buy-send-form__order-number', text: '№ '+data}).appendTo('.'+isMob+'busket-buy__send-form');

                $('<label>', {class: isMob+'busket-buy-send-form__label', for: 'busket-buy-send-form__phone', text: '* Ваш телефон'}).appendTo('.'+isMob+'busket-buy__send-form');
                $('<input>', {
                    class: isMob+'busket-buy-send-form__input',
                    id: 'busket-buy-send-form__phone',
                    on: {
                        input: fn_ValidPhone,
                        change: fn_ValidPhone
                    },
                    type: 'phone'
                }).appendTo('.'+isMob+'busket-buy__send-form');
                $('<span>', {class: isMob+'busket-buy-send-form__span-error user-panel_hide', id: 'busket-buy-send-form__span-error-phone', text: 'Проверьте Ваш телефон'}).appendTo('.'+isMob+'busket-buy__send-form');

                $('<label>', {class: isMob+'busket-buy-send-form__label', for: 'busket-buy-send-form__from', text: 'Ваше имя'}).appendTo('.'+isMob+'busket-buy__send-form');
                $('<input>', {
                    class: isMob+'busket-buy-send-form__input',
                    id: 'busket-buy-send-form__from',
                    type: 'text'
                }).appendTo('.'+isMob+'busket-buy__send-form');
 
                $('<label>', {class: isMob+'busket-buy-send-form__label', for: 'busket-buy-send-form__email', text: '* Ваш e-mail'}).appendTo('.'+isMob+'busket-buy__send-form');
                $('<input>', {
                    class: isMob+'busket-buy-send-form__input',
                    id: 'busket-buy-send-form__email',
                    on: {
                        input: fn_ValidEmail,
                        change: fn_ValidEmail
                    },
                    type: 'text'
                }).appendTo('.'+isMob+'busket-buy__send-form');
                $('<span>', {class: isMob+'busket-buy-send-form__span-error user-panel_hide', id: 'busket-buy-send-form__span-error-email', text: 'Проверьте Ваш e-mail'}).appendTo('.'+isMob+'busket-buy__send-form');

                /* маска ввода на поле "телефон" */    
                $('#busket-buy-send-form__phone').mask('\8 (999) 999-99-99', {
                    checkstep: fn_ValidPhone});

                $('<label>', {class: isMob+'busket-buy-send-form__label', for: 'busket-buy-send-form__message', text: 'Текст сообщения'}).appendTo('.'+isMob+'busket-buy__send-form');
                $('<textarea>', {
                    class: isMob+'busket-buy-send-form__message',
                    cols: '25',
                    id: 'busket-buy-send-form__message',
                    rows: '8', 
                    type: 'text'
                }).appendTo('.'+isMob+'busket-buy__send-form');

                $('<div>', {class: isMob+'busket-buy-send-form__button-block'}).appendTo('.'+isMob+'busket-buy__send-form');
                    $('<button>', {
                        class: isMob+'busket-buy-send-form-button-block__button '+isMob+'busket-buy-send-form-button-block__button-cancel',
                        id: 'busket-buy-send-form-button-block__button-send',
                        on: {
                            click: function() {
                                fn_SendOrder();
                            }                        
                        },
                        text: 'Отправить'
                    }).appendTo('.'+isMob+'busket-buy-send-form__button-block');

                    $('<button>', {
                        class: isMob+'busket-buy-send-form-button-block__button '+isMob+'busket-buy-send-form-button-block__button-cancel',
                        id: 'busket-buy-send-form-button-block__button-cancel',
                        on : {
                            click: function() {
                                $('.busket-buy__disabled').remove();
                            }                        
                        },
                        text: 'Отмена'
                    }).appendTo('.'+isMob+'busket-buy-send-form__button-block');

                $('<p>', {class: isMob+'busket-buy-send-form__info'}).appendTo('.'+isMob+'busket-buy__send-form');
                $('.'+isMob+'busket-buy-send-form__info').html('* В сообщении обязательно укажите Ваш <strong>e-mail</strong> или <strong>телефон</strong> для того, чтобы мы могли ответить на Ваш заказ.');
    }
}


var validEmail = false;
var validPhone = false;

// проверка валидности поля "Ваш e-mail"
function fn_ValidEmail() {
    var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
    if (pattern.test($('#busket-buy-send-form__email').val())) {
        $('#busket-buy-send-form__email').addClass(isMob+'busket-buy-send-form__input_green-border');
        $('#busket-buy-send-form__span-error-email').addClass('user-panel_hide');
        $('#busket-buy-send-form__span-error-phone').addClass('user-panel_hide');
        validEmail = true;
    } else {
        $('#busket-buy-send-form__email').removeClass(isMob+'busket-buy-send-form__input_green-border');
        validEmail = false;
    }
    fn_ValidSendButton();
}


/* проверка валидности поля "Ваш телефон" */
function fn_ValidPhone() {
    var pattern = /[0-9]\s\([0-9]{3}\)\s[0-9]{3}\-[0-9]{2}\-[0-9]{2}/;
    if (pattern.test($('#busket-buy-send-form__phone').val())) {
        $('#busket-buy-send-form__phone').addClass(isMob+'busket-buy-send-form__input_green-border');
        $('#busket-buy-send-form__span-error-email').addClass('user-panel_hide');
        $('#busket-buy-send-form__span-error-phone').addClass('user-panel_hide');
        validPhone = true;
    } else {
        $('#busket-buy-send-form__phone').removeClass(isMob+'busket-buy-send-form__input_green-border');
        validPhone = false;
    }
    fn_ValidSendButton();
}


/* проверка валидности всех полей */
function fn_ValidSendButton() {
    if (validEmail || validPhone){
        $('#busket-buy-send-form-button-block__button-send').removeClass(isMob+'busket-buy-send-form-button-block__button-cancel');
        $('#busket-buy-send-form-button-block__button-send').addClass(isMob+'busket-buy-send-form-button-block__button-send');
    } else {
        $('#busket-buy-send-form-button-block__button-send').removeClass(isMob+'busket-buy-send-form-button-block__button-send');
        $('#busket-buy-send-form-button-block__button-send').addClass(isMob+'busket-buy-send-form-button-block__button-cancel');
    }    
}


/* отправка заказа */
function fn_SendOrder() {
    if (validEmail || validPhone) {
        $.ajax ({
            url: '../ajax/busket_mail.php',
            type: 'POST',
            data: ({
                busket_add_order_id: $('.'+isMob+'busket-buy-send-form__order-number').text().substr(2),
                busket_mail_fhone: $('#busket-buy-send-form__phone').val(),
                busket_mail_from: $('#busket-buy-send-form__from').val(),
                busket_mail_email: $('#busket-buy-send-form__email').val(),
                busket_mail_user_message: $('#busket-buy-send-form__message').val(),
                busket_mail_total_cost: $('.'+isMob+'total__cost-label-span').text().slice(0, -5)
            }),
            dataType: 'html',
            beforeSend: fn_BeforeFormOrderSend,
            success: fn_SuccessFormOrderSend
        });
    } else {
        if (!validEmail) {
            $('#busket-buy-send-form__span-error-email').removeClass('user-panel_hide');
        }
        if (!validPhone) {
            $('#busket-buy-send-form__span-error-phone').removeClass('user-panel_hide');
        }
    }
}

function  fn_BeforeFormOrderSend()  {
    
}

function  fn_SuccessFormOrderSend(data)  {
    fn_infoMessage('order_send_success', data)
    $('.'+isMob+'busket-buy__disabled').remove();
}


/* нажати не кнопку сохранения содержимого корзины */


/* Функция вызова окна сообщения */
function fn_infoMessage(type, parametr){
    $('<div>', {class: isMob+'infoMessage__disabled'}).appendTo('body');
    $('<div>', {class: isMob+'infoMessage__answer'}).appendTo('.'+isMob+'infoMessage__disabled');
        if (type == 'order_send_success'){
            var emailErrorCheck = false;
            var phoneErrorCheck = false;    
            $('<p>', {
                id: 'infoMessage-answer__error-header',
                class: isMob+'infoMessage-answer__header user-panel_hide',
                text: 'Во время отправки сообщения произошол сбой:'
            }).appendTo('.'+isMob+'infoMessage__answer');
            $('<p>', {
                id: 'infoMessage-answer__thanks-header',
                class: isMob+'infoMessage-answer__header user-panel_hide',
                text: 'Спасибо за Ваш заказ!'
            }).appendTo('.'+isMob+'infoMessage__answer');
            $('<p>', {class: isMob+'infoMessage-answer__message user-panel_hide', text: 'В ближайшее время мы свяжемся с Вами.'}).appendTo('.'+isMob+'infoMessage__answer');
            $('<p>', {class: isMob+'infoMessage-answer__message user-panel_hide', text: 'С уважением, Герасимчук Ю.Л.'}).appendTo('.'+isMob+'infoMessage__answer');
            if (parametr != null) {
                var arr_answer = JSON.parse(parametr);
                $.each(arr_answer, function(name, arr_value){
                    if (arr_value == true) {
                        if ((name == 'email_error' || name == 'phone_error') && !(validEmail || validPhone)) {   
                            $('#infoMessage-answer__error-header').removeClass('user-panel_hide');
                            $('<p>', {class: isMob+'infoMessage-answer__error-text', text: 'Ошибка:'}).appendTo('.'+isMob+'infoMessage__answer');
                            $('<p>', {class: isMob+'infoMessage-answer__error-name', text: name}).appendTo('.'+isMob+'infoMessage__answer');
                        }
                    }
                });
            } else {
                $('#infoMessage-answer__error-header').removeClass('user-panel_hide');
                $('<p>', {class: isMob+'infoMessage-answer__error-text', text: 'Ошибка:'}).appendTo('.'+isMob+'infoMessage__answer');
                $('<p>', {class: isMob+'infoMessage-answer__error-name', text: 'Не удалось связаться с сервером'}).appendTo('.'+isMob+'infoMessage__answer');
            }
            if ($('#infoMessage-answer__error-header').hasClass('user-panel_hide')) {
                $('#infoMessage-answer__thanks-header').removeClass('user-panel_hide');
                $('.'+isMob+'infoMessage-answer__message').removeClass('user-panel_hide');
            }
            $('<button>', {
                class: isMob+'infoMessage-answer__button-close',
                on: {
                    click: function (){
                        $('.'+isMob+'infoMessage__disabled').remove();
                        $.ajax ({
                            url: '../ajax/mySQL_busket.php',
                            type: 'POST',
                            data: ({busket_remove_order: true}),
                            dataType: 'html'
                        });
                        fn_SuccessMoveToBusket('null');
                    }
                },
                text: 'OK'
                }).appendTo('.'+isMob+'infoMessage__answer');
        } 
        else if (type == 'order_create_info') {
            $('<p>', {
                class: isMob+'infoMessage-answer__header',
                text: parametr['header'],
            }).appendTo('.'+isMob+'infoMessage__answer');
            $('<p>', {
                class: isMob+'infoMessage-answer__message',
                html: parametr['text'],
            }).appendTo('.'+isMob+'infoMessage__answer');
            $('<button>', {
                class: isMob+'infoMessage-answer__button-close',
                on: {
                    click: function (){
                        $('.'+isMob+'infoMessage__disabled').remove();
                    }
                },
                text: 'OK'
                }).appendTo('.'+isMob+'infoMessage__answer');
        }
}