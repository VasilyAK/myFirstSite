var isMob;
var WIwidth;
var numSel = 0;
var numSelSec = 0;
var numSelItem = 0;

$(document).ready(function(){    
    $('.'+isMob+'price-nav__term-block').on('click', function(){
        numSel = $(this).attr('id').substr(22);
        $.ajax ({
            url: '../ajax/mySQL_price.php',
            type: 'POST',
            data: ({number: numSel}),
            dataType: 'html',
            beforeSend: fn_BeforePrice,
            success: fn_SuccessPrice
        });
    });
})
    
function fn_BeforePrice () {
    
}

function fn_SuccessPrice (data){
    if (WIwidth < 975 || WIwidth === 'portrait') {
        $('.'+isMob+'price__nav').addClass('price_hide');
        $('.price__btn-hide').removeClass('price__btn-hide_open-nav');
        $('.price__btn-hide').addClass('price__btn-hide_open-price-list');
    } else if (WIwidth >= 975 || WIwidth === 'landscape') {
        $('.'+isMob+'price__nav').attr('class', isMob+'price__nav_open-max-nav');
        $('.'+isMob+'price-nav__term-block').attr('class', isMob+'price-nav__term-block_open-max-nav');
        $('.'+isMob+'price-nav__icon').attr('class', isMob+'price-nav__icon_open-max-nav');
        $('.'+isMob+'price-nav__term-name').attr('class', isMob+'price-nav__term-name_open-max-nav');
        $('.price__btn-hide').removeClass('price_hide');
    } else {
        console.log('Ошибка в определении размера экрана fn_Success');
        window.stop();
    }
   
    /* выделение выбранного элемента */
    if ($('.'+isMob+'price__nav').length) {
        var termClass = $('.'+isMob+'price-nav__term-block');
    } else if ($('.'+isMob+'price-nav__term-block_open-max-nav').length) {
        var termClass = $('.'+isMob+'price-nav__term-block_open-max-nav');
    } else if ($('.'+isMob+'price-nav__term-block_open-min-nav').length) {
        var termClass = $('.'+isMob+'price-nav__term-block_open-min-nav');
    } else {
        console.log ('Ошибка в выборе класса term-block при нажатии на кнопку навигаци');
        window.stop();
    }
    $.each(termClass, function (key, value){
        if (key == numSel-1){
            $(this).addClass('price-nav__term-block_open-sel');
        } else {
            $(this).removeClass('price-nav__term-block_open-sel');
        }
    });
    
    $('.'+isMob+'price__list').removeClass('price_hide');
    $('.price__controls').removeClass('price_hide');
    $('.'+isMob+'price__list').children().remove();
    var arr_answer = JSON.parse(data);
    var TableNumb = 1;
    $.each(arr_answer, function(name, arr_value){
        $('<div>', {class: isMob+'price-list__block'}).appendTo('.'+isMob+'price__list');
        $('<p>', {class: isMob+'price-list__block-name', text: fn_GetTableName(name)}).appendTo('.'+isMob+'price-list__block:last');
        $.each(arr_value, function(key, arr_value2){
            $('<div>', {class: isMob+'price-list__block-info'}).appendTo('.'+isMob+'price-list__block:last');
            $('<p>', {class: isMob+'price-list__block-info-number', text: arr_value2['number']+'.'}).appendTo('.'+isMob+'price-list__block-info:last');
            $('<p>', {class: isMob+'price-list__block-info-name', text: arr_value2['name']}).appendTo('.'+isMob+'price-list__block-info:last');
            $('<div>', {class: isMob+'price-list__block-info-usable'}).appendTo('.'+isMob+'price-list__block-info:last');
            var backText = ''; //условия для стоимости
            if (arr_value2['metrics'] != 'коэф.') {
                backText = ' руб.';
            }
            $('<p>', {class: isMob+'price-list__cost', text: arr_value2['cost']+backText}).appendTo('.'+isMob+'price-list__block-info-usable:last');
            if (arr_value2['metrics'] != null) { //условия для единиц измерения
                var frontText = '';
                if (arr_value2['metrics'] != 'коэф.') {
                    frontText = 'за ';
                }
                $('<p>', {class: isMob+'price-list__metrics', text: frontText+arr_value2['metrics']}).appendTo('.'+isMob+'price-list__block-info-usable:last');
            }
            
            $('<button>', {
                id: 'price-list__btn-add-calc-'+arr_value2['number']+'_'+TableNumb,
                class: isMob+'price-list__btn-add-calc',
                text: 'В корзину',
                on: {
                    /* По клику создается окно выбора количества услуг */
                    click: function() {                        
                        var quantityBackText = ' руб.'
                        numSelItem = $(this).attr('id').substr(25).split('_')[0];
                        numSelSec = $(this).attr('id').substr(25).split('_')[1];
                        $('<div>', {class: 'price-list__disabled'}).appendTo('body');
                            $('<div>', {class: isMob+'price-list__quantity'}).appendTo('.price-list__disabled');
                                $('<p>', {class: isMob+'price-list-quantity__header', text: fn_GetTableName(name)}).appendTo('.'+isMob+'price-list__quantity');
                                $('<p>', {class: isMob+'price-list-quantity__text', text: arr_value2['name']}).appendTo('.'+isMob+'price-list__quantity');
                                if (!(arr_value2['metrics'] == 'коэф.')) {
                                    $('<div>', {class: isMob+'price-list-quantity__set'}).appendTo('.'+isMob+'price-list__quantity');
                                        $('<p>', {class: isMob+'price-list-quantity-set__text-before', text: 'Кол-во:'}).appendTo('.'+isMob+'price-list-quantity__set');
                                        $('<button>', {
                                            class: isMob+'price-list-quantity-set__button_plus '+isMob+'price-list-quantity-set__button',
                                            on: {
                                                click: function (){
                                                    $('.'+isMob+'price-list-quantity-set__text').val(parseInt($('.'+isMob+'price-list-quantity-set__text').val())+1);
                                                    $('.'+isMob+'price-list-quantity-total-block__val').text((arr_value2['cost']*parseInt($('.'+isMob+'price-list-quantity-set__text').val()))+' руб.'); 
                                                }
                                            },
                                            text: '+',
                                            title: 'Увеличить'
                                            }).appendTo('.'+isMob+'price-list-quantity__set');
                                        
                                        $('<input>', {
                                            class: isMob+'price-list-quantity-set__text',
                                            on: {
                                                /* Запрет вводить все кроме чисел, значение не может быть меньше 1 */
                                                keydown: function (e) {
                                                    if(e.key.length == 1 && e.key.match(/[^0-9]/)) {
                                                        return false;
                                                    }
                                                },
                                                change: function () {
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
                                                    $('.'+isMob+'price-list-quantity-total-block__val').text((arr_value2['cost']*parseInt($('.'+isMob+'price-list-quantity-set__text').val()))+' руб.'); 
                                                }
                                            },
                                            type: 'text',
                                            value: '1'
                                        }).appendTo('.'+isMob+'price-list-quantity__set');
                                        
                                        $('<button>', {
                                            class: isMob+'price-list-quantity-set__button_minus '+isMob+'price-list-quantity-set__button',
                                            on: {
                                                click: function (){
                                                    if ($('.'+isMob+'price-list-quantity-set__text').val()>1) {
                                                        $('.'+isMob+'price-list-quantity-set__text').val(parseInt($('.'+isMob+'price-list-quantity-set__text').val())-1);
                                                        $('.'+isMob+'price-list-quantity-total-block__val').text((arr_value2['cost']*parseInt($('.'+isMob+'price-list-quantity-set__text').val()))+' руб.'); 
                                                    }
                                                }
                                            },
                                            text: '-',
                                            title: 'Уменьшить'
                                        }).appendTo('.'+isMob+'price-list-quantity__set');
                                            if (!(arr_value2['metrics'] == null)) {
                                                $('<p>', {class: isMob+'price-list-quantity-set__text-after', text: arr_value2['metrics']}).appendTo('.'+isMob+'price-list-quantity__set');
                                            }
                                } else if (arr_value2['metrics'] == 'коэф.') {
                                    quantityBackText = arr_value2['metrics'];
                                }
                                
                                $('<div>', {class: isMob+'price-list-quantity__total-block'}).appendTo('.'+isMob+'price-list__quantity');
                                    $('<p>', {class: isMob+'price-list-quantity-total-block__text', text: 'Всего:'}).appendTo('.'+isMob+'price-list-quantity__total-block');    
                                    $('<p>', {class: isMob+'price-list-quantity-total-block__val', text: arr_value2['cost']+quantityBackText}).appendTo('.'+isMob+'price-list-quantity__total-block');
                                
                                $('<div>', {class: isMob+'price-list-quantity__button-block'}).appendTo('.'+isMob+'price-list__quantity');
                                    $('<button>', {
                                        class: isMob+'price-list-quantity-button-block__button price-list-quantity-button-block__button-ok',
                                        on: {
                                            /* Событие подтверждения количества услуг */
                                            click: function (){
                                                var quantSelItem;
                                                if ($('.'+isMob+'price-list-quantity__set').length) {
                                                    quantSelItem = $('.'+isMob+'price-list-quantity-set__text').val()
                                                } else {
                                                    quantSelItem = 1;
                                                }
                                                $.ajax ({
                                                    url: '../ajax/mySQL_busket.php',
                                                    type: 'POST',
                                                    data: ({busket_number: numSel, busket_number_sec: numSelSec, busket_item: numSelItem, busket_quant: quantSelItem}),
                                                    dataType: 'html',
                                                    beforeSend: fn_BeforeMoveToBusket, /* функция взята из файла user-panel.js */
                                                    success: fn_SuccessMoveToBusket /* функция взята из файла user-panel.js */
                                                });
                                                $('.price-list__disabled').remove();
                                            }
                                        },
                                        text: 'OK'
                                    }).appendTo('.'+isMob+'price-list-quantity__button-block');
                                    $('<button>', {
                                        class: isMob+'price-list-quantity-button-block__button  price-list-quantity-button-block__button-cancel',
                                        on: {
                                            click: function (){
                                                $('.price-list__disabled').remove();
                                            }
                                        },
                                        text: 'Отмена'
                                    }).appendTo('.'+isMob+'price-list-quantity__button-block');
                    }
                }}).appendTo('.'+isMob+'price-list__block-info-usable:last');
        });
        TableNumb++;
    });
}


/* Функция заменяет имена таблиц плученных из mysql */
function fn_GetTableName (name){
    switch (name){
        case 'Pricelist_Boiler':    
            name = 'Установка котлов и котельного оборудования';
            break;
        case 'Pricelist_Heating_system':    
            name = 'Система отопления';
            break;
        case 'Pricelist_Radiator':    
            name = 'Радиаторы отопления, конвекторы, теплые полы';
            break;
        case 'Pricelist_Pipes':    
            name = 'Трубы и стояки';
            break;
        case 'Pricelist_Pipes_thread':    
            name = 'Нарезка резьбы трубы';
            break;
        case 'Pricelist_Pipes_strobe':    
            name = 'Штробление под сантехнические трубы';
            break;
        case 'Pricelist_Bath':    
            name = 'Ванны и душевые колонки';
            break;
        case 'Pricelist_Shower_cabin':    
            name = 'Душевые кабины';
            break;
        case 'Pricelist_Toilet':    
            name = 'Унитазы, биде, писуары';
            break;
        case 'Pricelist_Sink':    
            name = 'Раковины, мойки - без смесителей';
            break;
        case 'Pricelist_Mixer':    
            name = 'Смесители';
            break;
        case 'Pricelist_Filters':    
            name = 'Фильтры для очистки воды';
            break;
        case 'Pricelist_Water_meter':    
            if (isMobile()){
                name = 'Счетчики воды и другие приборы';
                break;
            } else {
                name = 'Счетчики воды и приборы в систему водоснабжения';
                break;
            }
        case 'Pricelist_Polote_dryer':    
            name = 'Полотенцесушители';
            break;
        case 'Pricelist_Connecting_home_appliances':    
            name = 'Монтаж и подключение бытовой техники';
            break;
        case 'Pricelist_Plumbing_repair':    
            if (isMobile()){
                name = 'Ремонт сантехники';
                break;
            } else {
                name = 'Ремонт сантехнических коммуникаций, навеска аксессуаров';
                break;
            }
        case 'Pricelist_Dismantling':    
            name = 'Демонтаж';
            break;
        case 'Pricelist_Additional_expenses':    
            name = 'Дополнительные расходы на сантехнические работы';
            break;
        case 'Pricelist_Expert_departure':    
            name = 'Выезд специалиста на объект';
            break;
    }
    return name;
}


$('.price__btn-hide').on('click', function (){
    if ($(this).hasClass('price__btn-hide_open-nav')){
        if (WIwidth < 975 || WIwidth === 'portrait') {
            $('.'+isMob+'price__nav').addClass('price_hide');
            $('.'+isMob+'price__list').removeClass('price_hide');
        } else if (WIwidth >= 975 || WIwidth === 'landscape') {
            $('.'+isMob+'price__nav_open-max-nav').attr('class', isMob+'price__nav_open-min-nav');
            $.each($('.'+isMob+'price-nav__term-block_open-max-nav'), function(){    
                if ($(this).hasClass('price-nav__term-block_open-sel')) {
                        $(this).attr('class', isMob+'price-nav__term-block_open-min-nav price-nav__term-block_open-sel');
                    } else {   
                        $(this).attr('class', isMob+'price-nav__term-block_open-min-nav');
                };
            });
            $('.'+isMob+'price-nav__icon_open-max-nav').attr('class', isMob+'price-nav__icon_open-min-nav');
            $('.'+isMob+'price-nav__term-name_open-max-nav').addClass('price_hide');   
        } else {
            console.log('Ошибка в определении размера экрана при нажати на кнопку price__btn-hide');
            window.stop();
        }
        $(this).removeClass('price__btn-hide_open-nav');
        $(this).addClass('price__btn-hide_open-price-list');
    } else if ($(this).hasClass('price__btn-hide_open-price-list')){
        if (WIwidth < 975 || WIwidth === 'portrait') {
            $('.'+isMob+'price__list').addClass('price_hide');
            $('.'+isMob+'price__nav').removeClass('price_hide');
        } else if (WIwidth >= 975 || WIwidth === 'landscape') {
            $('.'+isMob+'price__nav_open-min-nav').attr('class', isMob+'price__nav_open-max-nav');
            $.each($('.'+isMob+'price-nav__term-block_open-min-nav'), function(){    
                if ($(this).hasClass('price-nav__term-block_open-sel')) {
                    $(this).attr('class', isMob+'price-nav__term-block_open-max-nav price-nav__term-block_open-sel');
                } else {   
                    $(this).attr('class', isMob+'price-nav__term-block_open-max-nav');
                };
            });
            $('.'+isMob+'price-nav__icon_open-min-nav').attr('class', isMob+'price-nav__icon_open-max-nav');
            $('.'+isMob+'price-nav__term-name_open-max-nav').removeClass('price_hide');
        } else {
            console.log('Ошибка в определении размера экрана при нажати на кнопку price__btn-hide');
            window.stop();
        }
        $(this).removeClass('price__btn-hide_open-price-list');
        $(this).addClass('price__btn-hide_open-nav');
        $('html, body').scrollTop($(".price-inc").offset().top-30);
    } 
});


$('.price-controls__btn-close').on('click', function(){
    if ($('.'+isMob+'price__nav').length) {
        $.each($('.'+isMob+'price-nav__term-block'), function() {
            $(this).removeClass('price-nav__term-block_open-sel');
        });
    } else if ($('.'+isMob+'price__nav_open-max-nav').length) {   
        $('.'+isMob+'price__nav_open-max-nav').attr('class', isMob+'price__nav');
        $('.'+isMob+'price-nav__term-block_open-max-nav').attr('class', isMob+'price-nav__term-block');
        $('.'+isMob+'price-nav__icon_open-max-nav').attr('class', isMob+'price-nav__icon');
        $('.'+isMob+'price-nav__term-name_open-max-nav').attr('class', isMob+'price-nav__term-name');
    } else if ($('.'+isMob+'price__nav_open-min-nav').length) {
        $('.'+isMob+'price__nav_open-min-nav').attr('class', isMob+'price__nav');
        $('.'+isMob+'price-nav__term-block_open-min-nav').attr('class', isMob+'price-nav__term-block');
        $('.'+isMob+'price-nav__icon_open-min-nav').attr('class', isMob+'price-nav__icon');
        $('.'+isMob+'price-nav__term-name_open-max-nav').attr('class', isMob+'price-nav__term-name');
    }
    
    if (WIwidth < 975 || WIwidth === 'portrait') {
            $('.price__btn-hide').removeClass('price_hide');
            $('.price__btn-hide').removeClass('price__btn-hide_open-price-list');
            $('.price__btn-hide').addClass('price__btn-hide_open-nav');
            $('.'+isMob+'price__nav').removeClass('price_hide');
    } else if (WIwidth >= 975 || WIwidth === 'landscape') {
        $('.price__btn-hide').addClass('price_hide');
    } else {
        console.log('Ошибка в определении размера экрана при нажати на кнопку price-controls__btn-close');
        window.stop();
    }
    
    $('.'+isMob+'price__list').children().remove();
    $('.'+isMob+'price__list').addClass('price_hide');
    $('<p>', {class: '.'+isMob+'price-list__block-name', text: 'Не выбрана ни одна категория'}).appendTo('.'+isMob+'price__list');
    $('.price__controls').addClass('price_hide');
    $('html, body').scrollTop($(".price-inc").offset().top-50);
})

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
    var boo_selTrue = false;
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
     
    if (WIwidth < 975 || WIwidth === 'portrait') {
        if ($('.'+isMob+'price__nav').length) {
            $('.price__btn-hide').removeClass('price_hide');
            if ($('.'+isMob+'price__list').hasClass('price_hide')) {
                    $('.price__btn-hide').addClass('price__btn-hide_open-nav');
                    $('.price__btn-hide').removeClass('price__btn-hide_open-price-list');
                } else {
                    $('.price__btn-hide').removeClass('price__btn-hide_open-nav');
                    $('.price__btn-hide').addClass('price__btn-hide_open-price-list');
                }
            
        } else if ($('.'+isMob+'price__nav_open-max-nav').length) {
            $('.'+isMob+'price__nav_open-max-nav').attr('class', isMob+'price__nav');
            $.each($('.'+isMob+'price-nav__term-block_open-max-nav'), function (key, value){
                if ($(this).hasClass('price-nav__term-block_open-sel')){
                    $(this).attr('class', isMob+'price-nav__term-block price-nav__term-block_open-sel');
                    boo_selTrue = true;
                } else {
                    $(this).attr('class', isMob+'price-nav__term-block');
                }
            });
            $('.'+isMob+'price-nav__icon_open-max-nav').attr('class', isMob+'price-nav__icon');
            $('.'+isMob+'price-nav__term-name_open-max-nav').attr('class', isMob+'price-nav__term-name');
            if (boo_selTrue = false){
                $('.'+isMob+'price__list').addClass('price_hide');
                $('.price__btn-hide').addClass('price__btn-hide_open-nav');
                $('.price__btn-hide').removeClass('price__btn-hide_open-price-list');   
            } else {
                $('.'+isMob+'price__nav').addClass('price_hide');
                $('.price__btn-hide').addClass('price__btn-hide_open-price-list');
                $('.price__btn-hide').removeClass('price__btn-hide_open-nav');
            }
        } else if ($('.'+isMob+'price__nav_open-min-nav').length) {
           $('.'+isMob+'price__nav_open-min-nav').attr('class', isMob+'price__nav');
            $.each($('.'+isMob+'price-nav__term-block_open-min-nav'), function (key, value){
                if ($(this).hasClass('price-nav__term-block_open-sel')){
                    $(this).attr('class', isMob+'price-nav__term-block price-nav__term-block_open-sel');
                    boo_selTrue = true;
                } else {
                    $(this).attr('class', isMob+'price-nav__term-block');
                }
            });
            $('.'+isMob+'price-nav__icon_open-min-nav').attr('class', isMob+'price-nav__icon');
            $('.'+isMob+'price-nav__term-name_open-max-nav').attr('class', isMob+'price-nav__term-name');
            if (boo_selTrue = false){
                $('.'+isMob+'price__list').addClass('price_hide');
                $('.price__btn-hide').addClass('price__btn-hide_open-nav');
                $('.price__btn-hide').removeClass('price__btn-hide_open-price-list');
            } else {
                $('.'+isMob+'price__nav').addClass('price_hide');
                $('.price__btn-hide').addClass('price__btn-hide_open-price-list');
                $('.price__btn-hide').removeClass('price__btn-hide_open-nav');
            }
        }
    } else if (WIwidth >= 975 || WIwidth === 'landscape')  {
        if ($('.'+isMob+'price__nav').length) {
            if ($('.'+isMob+'price-nav__term-block').hasClass('price-nav__term-block_open-sel')) {                        
                $('.'+isMob+'price__nav').attr('class', isMob+'price__nav_open-max-nav');
                $.each($('.'+isMob+'price-nav__term-block'), function (key, value){
                    if ($(this).hasClass('price-nav__term-block_open-sel')){
                        $(this).attr('class', isMob+'price-nav__term-block_open-max-nav price-nav__term-block_open-sel');
                    } else {
                        $(this).attr('class', isMob+'price-nav__term-block_open-max-nav');
                    }
                });
                $('.'+isMob+'price-nav__icon').attr('class', isMob+'price-nav__icon_open-max-nav');
                $('.'+isMob+'price-nav__term-name').attr('class', isMob+'price-nav__term-name_open-max-nav');
                $('.price__btn-hide').addClass('price__btn-hide_open-nav');
                $('.price__btn-hide').removeClass('price__btn-hide_open-price-list');
                $('.price__btn-hide').removeClass('price_hide');
                $('.'+isMob+'price__list').removeClass('price_hide');
            } else {
                if ($('.'+isMob+'price__list').hasClass('price_hide')) {
                    $('.price__btn-hide').addClass('price_hide');
                } else {
                    $('.'+isMob+'price__nav').removeClass('price_hide');
                    $('.'+isMob+'price__list').addClass('price_hide');
                }
                
            }
        }
    } else {
        console.log('Ошибка в определении размера экрана fn_ScreenSize');
        window.stop();
    }   
}

$(window).on('resize orientationchange', fn_ScreenSize);

/* Функции ниже выполняются единожды при загрузке */
if (isMobile()) {
    $('.price__nav').attr('class', 'phone-price__nav');
    $('.price-nav__term-block').attr('class', 'phone-price-nav__term-block');
    $('.price-nav__icon').attr('class', 'phone-price-nav__icon');
    $('.price-nav__term-name').attr('class', 'phone-price-nav__term-name');
    $('.price__list').attr('class', 'phone-price__list price_hide');
    $('.price-list__block').attr('class', 'phone-price-list__block');
    $('.price-list__block-name').attr('class', 'phone-price-list__block-name');
    $('.price-list__block-info').attr('class', 'phone-price-list__block-info');
    $('.price-list__block-info-number').attr('class', 'phone-price-list__block-info-number');
    $('.price-list__block-info-name').attr('class', 'phone-price-list__block-info-name');
    $('.price-list__block-info-usable').attr('class', 'phone-price-list__block-info-usable');
    $('.price-list__cost').attr('class', 'phone-price-list__cost');
    $('.price-list__metrics').attr('class', 'phone-price-list__metrics');
    $('.price-list__btn-add-calc').attr('class', 'phone-price-list__btn-add-calc');
    $('#price-nav__term-block-11 > p').text('Счетчики воды и другие приборы');
    $('#price-nav__term-block-14 > p').html('Ремонт сантех&shy;ники');
}

fn_ScreenSize ();