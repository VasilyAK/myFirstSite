<?php
    session_start();
    require_once "../PHPMailer/src/PHPMailer.php";
    require_once "../PHPMailer/src/SMTP.php";
    $mail = new PHPMailer\PHPMailer\PHPMailer();
    
    $mail->isSMTP();
    $mail->Host = 'smtp.mail.ru';
    $mail->SMTPAuth = true;
    $mail->Username = 'site-mail@ipgerasimchuk.ru';
    $mail->Password = 'liam-etis';
    $mail->SMPTSecure = 'tls';
    $mail->Port = '587';

    /* Тема сообщения */
    if (isset($_POST['busket_add_order_id'])) {
        $order_idError = false;
        $order_id = check_input($_POST['busket_add_order_id'], $subjectError);
    } else {
        $order_idError = true;
    };
    $arr_Errors['order_id_error'] = $order_idError;
    
    /* Имя отправителя */
	if (isset($_POST['busket_mail_from'])) { 
		$fromError = false;
        $from = check_input($_POST['busket_mail_from'], $fromError);
        if (!($fromError)) {
            $message .= wordwrap("Здравствуйте, меня зовут ".$from."<br>", 70, "<br>", false);
        };
    } else {
        $fromError = true;
    };
    $arr_Errors['from_error'] = $fromError;

    /* Телефон отправителя */
    if (isset($_POST['busket_mail_fhone'])) {
        $phoneError = false;
        $phone = check_input($_POST['busket_mail_fhone'], $phoneError);
        if (!($phoneError)) {
            $message .= wordwrap("Мой телефон: ".$phone."<br>", 70, "<br>", false);
        };
    } else {
        $phoneError = true;
    };
    $arr_Errors['phone_error'] = $phoneError;

    /* Текст сообщения */
    if (isset($_POST['busket_mail_user_message'])) {
        $user_messageError = false;
		$user_message = check_input($_POST['busket_mail_user_message'], $user_messageError);
        if (!($user_messageError)) {
            $message .= wordwrap("<br>".$user_message."<br>", 70, "<br>", false);
        };
    } else {
        $user_messageError = true;
    };
    $arr_Errors['user_message_error'] = $user_messageError;

    /* email отправителя */
    if (isset($_POST['busket_mail_email'])) {
        $emailError = false;
        $email = check_input($_POST['busket_mail_email'], $emailError);
        if (!(filter_var($email, FILTER_VALIDATE_EMAIL))) {
            $emailError = true;
        }; 
    } else {
        $emailError = true;
    };
    $arr_Errors['email_error'] = $emailError;
    
    /* стоимость заказа */
    if (isset($_POST['busket_mail_total_cost'])) {
        $total_costError = false;
        $total_cost = check_input($_POST['busket_mail_total_cost'], $total_costError);
    } else {
        $total_costError = true;
    };
    $arr_Errors['total_cost_error'] = $total_costError;
    
    /* Таблица с заказом */
    if ((!$phoneError || !$emailError) && !$order_idError && !$total_costError) {
        
        require_once "../ajax/mySQL_busket.php";
        $Connect = mysqli_connect($db_Host, $db_User, $db_Pass, $db_BaseName) or die("Ошибка соединения ".mysqli_error($Connect));
        mysqli_set_charset($Connect, "utf8");
        
        $table_message = "<!DOCTYPE HTML PUBLIC><html>
                            <body>
                                <table style='border-collapse: collapse'>
                                    <tr style='height: 25px;'></tr>
                                    <thead>
                                        <tr>
    <td  style='border: 1px solid black; padding: 0 3px; text-align: center;'><span style='font-weight: bold;'>Номер</span></td>
    <td  style='border: 1px solid black; padding: 0 3px; text-align: center;'><span style='font-weight: bold;'>Наименовение</span></td>
    <td  style='border: 1px solid black; padding: 0 3px; text-align: center;'><span style='font-weight: bold;'>Кол-во</span></td>
    <td  style='border: 1px solid black; padding: 0 3px; text-align: center;'><span style='font-weight: bold;'>Ед.изм.</span></td>
    <td  style='border: 1px solid black; padding: 0 3px; text-align: center;'><span style='font-weight: bold;'>Цена</span></td>
    <td  style='border: 1px solid black; padding: 0 3px; text-align: center;'><span style='font-weight: bold;'>Стоимость</span></td>
                                        </tr>
                                    </thead>";
        foreach ($_SESSION['service'] as $key => $servise_term){
            $row = mysqli_fetch_assoc(mysqli_query($Connect,"SELECT name, metrics, cost FROM ".fn_SetTableName($servise_term['number'], $servise_term['number_sec'])." WHERE number=".$servise_term['item'])) or die("Ошибка: ответ не получен (mail set) ".mysqli_error());
            $table_message .= "<tr>
    <td  style='border: 1px solid black; padding: 0 3px; text-align: center;'>".($key+1)."</td>
    <td  style='border: 1px solid black; padding: 0 3px;'>".$row['name']."</td>
    <td  style='border: 1px solid black; padding: 0 3px; text-align: center;'>".$servise_term['quant']."</td>
    <td  style='border: 1px solid black; padding: 0 3px; text-align: center;'>".$row['metrics']."</td>
    <td  style='border: 1px solid black; padding: 0 3px; text-align: center;'>".$row['cost']." руб.</td>
    <td  style='border: 1px solid black; padding: 0 3px; text-align: center;'>".($row['cost']*$servise_term['quant'])." руб.</td>
                            </tr>";
        };
        $table_message .= "<tr style='height: 10px;'></tr>
                            <tr style='text-align: right';>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><span style='font-size: 18px; font-weight: bold;'>Всего:</span></td>
                                <td><span style='font-size: 18px; font-weight: bold;'>".$total_cost." руб.</span></td>
                            </tr>
                            <tr style='height: 25px;'></tr>
                            </table></body></html>";
        $message .= $table_message;
        
        /* Изменение статуса заказа */
        $send = mysqli_query($Connect,"UPDATE Service_Order SET status='Отправлен' WHERE id=".$order_id) or die("Ошибка: ответ не получен (mail send) ".mysqli_error());
        
        mysqli_close($Connect);
    };

    /* Отправка мейла */
    if ((!$phoneError || !$emailError) && !$order_idError && !$total_costError) {
        $mail->CharSet = 'UTF-8';
        $mail->SetFrom('site-mail@ipgerasimchuk.ru', 'ipgerasimchuk.ru');
        $mail->Subject = 'Заказ на оказание услуг № '.$order_id;
        $mail->addAddress('geras_64@ipgerasimchuk.ru', 'Герасимчук Юрий');

        if (!($emailError)) {            
            $mail->addReplyTo($email, $from);
            $message .= wordwrap("<br> Мой e-mail: ".$email, 70, "<br>", false);
        }; 
        $mail->Body = $message;
        $mail->isHtml(true);

        $sendError = (!$mail->Send());
    } else {
        $sendError = true;
    };

    $arr_Errors['send_error'] = $sendError;
    
    echo json_encode($arr_Errors);
	
	function check_input($data, &$checkError){
		$data = htmlspecialchars($data);
        $data = trim($data);
		$data = stripslashes($data);
		if (strlen($data)==0){
			$checkError = true;
			return $data;
		} else {
			return $data;
		};
	};
?>