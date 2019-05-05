<?php
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
    if (isset($_POST['mail_subject'])) {
        $subjectError = false;
        $subject = check_input($_POST['mail_subject'], $subjectError);
        $arr_Errors['subject_error'] = $subjectError;
    } else {
        $subjectError = true;
    };

    /* Имя отправителя */
	if (isset($_POST['mail_from'])) { 
		$fromError = false;
        $from = check_input($_POST['mail_from'], $fromError);
        if (!($fromError)) {
            $message .= wordwrap("Здравствуйте, меня зовут ".$from.".\n", 70, "\n", false);
        };
        $arr_Errors['from_error'] = $fromError;
    } else {
        $fromError = true;
    };

    /* Телефон отправителя */
    if (isset($_POST['mail_phone'])) {
        $phoneError = false;
        $phone = check_input($_POST['mail_phone'], $phoneError);
        if (!($phoneError)) {
            $message .= wordwrap("Мой телефон: ".$phone.".\n", 70, "\n", false);
        };
        $arr_Errors['phone_error'] = $phoneError;
    } else {
        $phoneError = true;
    };

    /* Текст сообщения */
    if (isset($_POST['mail_user_message'])) {
        $user_messageError = false;
		$user_message = check_input($_POST['mail_user_message'], $user_messageError);
        if (!($user_messageError)) {
            $message .= wordwrap("\n".$user_message."\n", 70, "\n", false);
        };
        $arr_Errors['user_message_error'] = $user_messageError;
    } else {
        $user_messageError = true;
    };

    /* email отправителя */
    if (isset($_POST['mail_email'])) {
        $emailError = false;
        $email = check_input($_POST['mail_email'], $emailError);
        if (!(filter_var($email, FILTER_VALIDATE_EMAIL))) {
            $emailError = true;
        };        
        $arr_Errors['email_error'] = $emailError;
    } else {
        $emailError = true;
    };
        
    /* Отправка мейла */
    if (!($fromError) && !($subjectError) && (!$phoneError || !$user_messageError || !$emailError)) {
        $mail->CharSet = 'UTF-8';
        $mail->SetFrom('site-mail@ipgerasimchuk.ru', 'ipgerasimchuk.ru');
        $mail->Subject = $subject;

        if ($subject != 'Администратору сайта') {
            $mail->addAddress('geras_64@ipgerasimchuk.ru', 'Герасимчук Юрий');
        } else {
            $mail->addAddress('admin90@ipgerasimchuk.ru', 'Администратор');
        };

        if (!($emailError)) {            
            $mail->addReplyTo($email, $from);
            if ($phoneError) {
                $message .= wordwrap("\r\n Прошу ответ дать на мой e-mail: ".$email, 70, "\n", false);
            };
        }; 
        $mail->isHtml(false);
        $mail->Body = $message;

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