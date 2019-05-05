<div class='feedback-form'>    
    <p class='headline feedback-form__headline'>Задайте Ваш вопрос заполнив форму</p>
    
    <div class='feedback-form-border'>
        <div class='feedback-form__blank'>
            <div class='feedback-form-blank__block'>
                <label for='feedback-form__from' class='feedback-form-blank__label'>Ваше имя:</label>
                <input id='feedback-form__from' type='text' class='feedback-form-blank__input' placeholder='Обязательное'>
                <span id='feedback-form__span-from' class='feedback-form-blank__span feedback-form_hide'>Поле обязательно к заполнению</span>

                <label for='feedback-form__email' class='feedback-form-blank__label'>* Ваш e-mail:</label>
                <input id='feedback-form__email' type='text' class='feedback-form-blank__input'>
                <span id='feedback-form__span-email' class='feedback-form-blank__span feedback-form_hide'>Проверьте Ваш e-mail</span>

                <label for='feedback-form__phone' class='feedback-form-blank__label'>* Ваш телефон:</label>
                <input id='feedback-form__phone' type='tel' class='feedback-form-blank__input'>
                <span id='feedback-form__span-phone' class='feedback-form-blank__span feedback-form_hide'>Проверьте Ваш телефон</span>

                <label for='feedback-form__select-subject' class='feedback-form-blank__label'>Тема сообщения</label>
                <select id='feedback-form__select-subject' class='feedback-form-blank__input feedback-form-blank__input_green-border'>
                    <option>Отопление</option>
                    <option>Водоснабжение</option>
                    <option>Теплые полы</option>
                    <option>Строительство</option>
                    <option>Администратору сайта</option>
                    <option>Другое</option>
                </select>

                <input id='feedback-form__subject' type='text' class='feedback-form-blank__input feedback-form_hide'  placeholder='Обязательное'>
                <span id='feedback-form__span-subject' class='feedback-form-blank__span feedback-form_hide'>Поле обязательно к заполнению</span>
            </div>

            <div class='feedback-form-blank__block'>
                <label for='feedback-form__message' class='feedback-form-blank__label'>Текст сообщения:</label>
                <textarea id='feedback-form__message' rows='8' cols='25' class='feedback-form-blank__text'  placeholder='Обязательное'></textarea>
                <span id='feedback-form__span-message' class='feedback-form-blank__span feedback-form_hide'>Поле обязательно к заполнению</span>
            </div>
            
            <button id='feedback-form__send' class='link__button feedback-form__button'>Отправить сообщение</button>
        </div>
    </div>
    <p class='feedback-form__addvice'>* В сообщении обязательно укажите <strong>e-mail</strong> или <strong>телефон</strong> для того, чтобы мы могли ответить на ваш вопрос.</p>
</div>