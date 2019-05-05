<div class='user-panel'>
    <div class='user-panel-menu'>
        <div class='user-panel-menu__reg-block'>  
            <button class='user-panel-menu__button' title='Регистрация на сайте'>Регистрация</button>
            <button class='user-panel-menu__button' title='Войти на сайт под своим логином'>Войти</button>
            <button class='user-panel-menu__button user-panel_hide'>Личный кабинет</button>
        </div>
        <div class='user-panel-menu__user-block'>        
            <p class='user-block__name'>Здравствуйте Гость!</p>
            <div class='user-block__foto user-panel_hide' title='Гость'>
                <img src='' alt='Фото пользователя' class='user-block-foto__img'>
            </div>
        </div>
        <div class='user-panel-menu__busket-block'>
            <button class='busket-block__busket-button' title='Открыть корзину'>
                <img src='images/icons/busket-white.png' alt='Кнопка - корзина покупок' class='busket-button__img'>
            </button>
            <p class='busket-block__info'>Корзина пуста</p>
        </div>
        <button class='user-panel-menu__mod' title='Скрыть/показать панель пользователя'>
            <img src='images/icons/arrow-hide.png' alt='Кнопка управления меню' class='mod__img'>
        </button>
    </div>
    
    <div class='busket-content user-panel_hide'>
        <div class='busket-content__scroll'>
            <p class='busket-content__header busket-content-header__text'>Заказ на оказание услуг</p>
            <table class='busket-content__items'></table> <!-- Заполняется автоматически из файла user-panel.js -->
            <div class='busket-content__total'>
                <div class='total__button-block'>
                    <button class='total-button-block__button total-button-block__button-add' title='Добавить новую запись'>+</button>
                    <button class='total-button-block__button total-button-block__button-remove' title='Удалить выбранные записи'>-</button>
                </div>
                <p class='total__cost-label'>Всего: <span class='total__cost-label-span'>___ руб.</span></p>
            </div>
            <div class='busket-content__control'>
                <button id='control__button-buy' class='control__button link__button' title='Отправить заявку на оказание услуг'>Заказать</button>
                <button id='control__button-close' class='control__button link__button' title='Закрыть'>Закрыть</button>
            </div>
            <p class='busket-content-info'>* При оформлении заказа не забудте ознакомиться с разделом <b>"Дополнительные расходы"</b>.</p>
            <p class='busket-content-info'>Заявка на <b>"Выезд специалиста"</b> является обязательной.</p>
        </div>
    </div>
</div>