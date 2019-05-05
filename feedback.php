<?php
    session_start();
?>
<DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <title>Ип Герасимчук Ю.Л. Контактная информация. Обратная связь.</title>
        <meta name='description' content=''/>
        <?php include "inc/meta.inc.html";?>
        <link rel="stylesheet" href="styles/feedback.css" type="text/css">
        <link rel="stylesheet" href="styles/feedback_form.css" type="text/css">
        <link rel="stylesheet" href="styles/feedback_form-phone.css" type="text/css">
	    <link rel="stylesheet" href="styles/user_panel.css" type="text/css">
	    <link rel="stylesheet" href="styles/user_panel-phone.css" type="text/css">
    </head>

    <body>
        <div class='user-panel-block'>
		    <?php include "inc/user_panel.inc.php";?>
	    </div>
       
        <div class='wrapper'>	
            <div class='main-header-block'>
                <?php include "inc/main_header.inc.html";?>
            </div>

            <section>
                <article class='feedback-information'>
                    <p class='headline feedback__headline'>Контакная информация:</p>
                    <ul class='feedback__main-ul'>
                        <li>
                           <p>Телефон:</p>
                            <ul class='feedback__phone-ul'>
                                <li>
                                    <p><strong><a href='tel:+79062183025'>+7-906-218-30-25</a></strong></p>
                                </li>
                                
                                <li>
                                    <p><strong><a href='tel:+79622625434'>+7-962-262-54-34</a></strong></p>
                                </li>
                            </ul>
                        </li>
                        
                        <li>
                            <p>E-mail: <strong><a href='mailto:geras_64@mail.ru'>geras_64@mail.ru</a></strong></p>
                        </li>
                        
                        <li>
                            <p>Время работы: <strong>8.00 – 18.00</strong></p>
                        </li>
                    </ul>
                </article>

                <article class='feedback-form-block'>
                    <a name='feedback-form'></a>
                    <?php include "inc/feedback_form.inc.php";?>
                </article>
            </section>

            <div class='main-footer-block'>
                <?php include "inc/main_footer.inc.html";?>	
            </div>
        </div>
        
        <script src="scripts/jquery.maskedinput.js"></script>
        <script src='scripts/feedback_form.js'></script>
        <script src='scripts/user-panel.js'></script>
    </body>

    </html>