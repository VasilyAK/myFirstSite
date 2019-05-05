<?php
    session_start();
    if ($_SESSION['send'] == false){   
        $_SESSION['from']='';
        $_SESSION['message']='';
        $_SESSION['nameError'] = '';
        $_SESSION['messageError'] = '';
    } else {
        $_SESSION['send'] = false;
    };
    if (isset($_POST['send'])) { 
		$from = htmlspecialchars($_POST['from']);
		$message = htmlspecialchars($_POST['message']);
		$nameError=false;
		$messageError=false;
		$from = check_input($from,'Введите Ваше имя',$nameError); 
        $message = check_input($message,'Введите Ваш отзыв',$messageError);
        $_SESSION['from']=$from;
        $_SESSION['message']=$message;
        $_SESSION['nameError'] = $nameError;
        $_SESSION['messageError'] = $messageError;
        $_SESSION['send'] = true;
		if (!$nameError && !$messageError){
			$file = file_get_contents('data/messages_data.json');
			$taskList = json_decode($file);
			$array = Array (
				'name' => $from,
				'message' => $message,
				'date' => date("j M Y"),
				'time' => date("h:i"),
			);
			if ($taskList==NULL){
				$taskList[]=$array;
			} else {
				array_push($taskList,$array);
			};
			file_put_contents('data/messages_data.json',json_encode($taskList));
			unset($taskList);
			session_unset();
		};
        header ("location: ".$_SERVER['REQUEST_URI']."#message-form");
        exit();
    };
	
	function check_input($data,$problem='',&$myError){
		$data = trim($data);
		$data = stripslashes($data);
		if ($problem && strlen($data)==0){
			$myError = true;
			return($problem);
		} else {
			return $data;
		};
	};
?>

<DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>ИП Герасимчук Ю.Л. Монтаж систем отопления и водоснабжения в Калининградской области. Установка и замена радиаторов. Ремонт и обслуживание газовых котлов, колонок, твердотопливных котлов. Монтаж теплых полов. Установка и ремонт циркуляционных насосов. </title>
	<meta name='description' content='Более 30 лет предоставляем услуги по установке отопления и водоснабжения в частных домах, квартирах, а так же в промышленных объектах по всей Калининградской области.'/>
	<?php include "inc/meta.inc.html";?>
	<link rel="stylesheet" href="styles/index.css" type="text/css">
	<link rel="stylesheet" href="styles/user_panel.css" type="text/css">
	<link rel="stylesheet" href="styles/user_panel-phone.css" type="text/css">
	<link rel="stylesheet" href="styles/price.css" type="text/css">
	<link rel="stylesheet" href="styles/price-phone.css" type="text/css">
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
            <article class='servise'>	
                <p class='headline'>Мы предоставляем следующие услуги:</p>
                <ul>
                    <li>Отопление частного дома</li>
                    <li>Отопление промышленных объектов</li>
                    <li>Монтаж теплых полов</li>
                    <li>Установка и замена радиаторов</li>
                    <li>Установка и обслуживание водопровода</li>
                    <li>Установка и обслуживание канализации</li>
                    <li>Септик, био, колодцы</li>
                    <li>Проведение сварочных работ</li>
                    <li>Ремонт и обслуживание газовых котлов, колонок</li>
                    <li>Ремонт и обслуживание твердотопливных котлов (Универсал, Энергия и т.д.)</li>
                    <li>Ремонт и установка циркуляционных насосов</li>
                    <li>Ремонт и установка дымососов</li>
                </ul>
            </article>

            <article class='question'>
                <p class='headline question__headline'>Есть вопрос?</p>
                <p class='headline question__headline'>Позвоните нам!</p>
                <p class='question__number'><a href='tel:+79062183025'>+7-906-218-30-25</a><br><a href='tel:+79622625434'>+7-962-262-54-34</a> </p>
                <p class='question__text'>или напишите нам</p>
                <p><a href='feedback.php#question-form' class='question__link link__button'>Написать сообщение</a></p>
            </article>
			
			<article class='price'>
				<?php include "inc/price.inc.php";?>
			</article>

			<article class='img-board'>
				<div class='img-board__data img-board__data1'>
					<a href=''><img src='images/еxample1.jpg' alt='Место проведения работы'></a>
					<p><a href=''>Место проведения работы</a></p>
					<p>Проведенные работы:</p>
				</div>
				  
                    <div class='img-board__data img-board__data2'>
                        <a href=''><img src='images/еxample2.jpg' alt='Место проведения работы'></a>
                        <p><a href=''>Место проведения работы</a></p>
                        <p>Проведенные работы:</p>
                    </div>

                    <div class='img-board__data img-board__data3'>
                        <a href=''><img src='images/еxample3.jpg' alt='Место проведения работы'></a>
                        <p><a href=''>Место проведения работы</a></p>
                        <p>Проведенные работы:</p>
                    </div>
			</article>
			
			
			<article class='message'>
                <a name='message-form'></a>
                <form action="" method="post" class='message__form'>
                    <input name="from" type="text" placeholder="Имя"  value="<?php if ($_SESSION['nameError']==0) echo $_SESSION['from'] ?>" class='message__from'/>

                    <input name='send' type="submit" value="Оставить отзыв" class='message__send link__button'>
                    <span class='message__span-name'><?php if ($_SESSION['nameError']==1) echo $_SESSION['from'] ?></span>

                    <textarea name="message" placeholder="Текст сообщения"  rows="5" cols="20" class='message__text' wrap><?php if ($_SESSION['messageError']==0) echo $_SESSION['message'] ?></textarea>
                    <span class='message__span-text'><?php if ($_SESSION['messageError']==1) echo $_SESSION['message'] ?></span>
                </form>
			</article>
			
			<article class='messages'>
				<p class='headline'>Отзывы наших клиентов</p>
			</article>
		</section>
		
		<div class='main-footer-block'>
		    <?php include "inc/main_footer.inc.html";?>	
		</div>			
	</div>
	
	<script src="scripts/jquery.maskedinput.js"></script>
	<script src='scripts/user-panel.js'></script>
	<script src='scripts/price.js'></script>
	<script src='scripts/messages.js'></script>
</body>
</html>