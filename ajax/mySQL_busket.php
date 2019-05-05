<?php
    session_start();
    header('Content-Type: text/json; charset=UTF-8');

    $db_Host = 'a251598.mysql.mchost.ru';
    $db_User = 'a251598_1';
    $db_Pass = 'S88NNs12p2b7';
    $db_BaseName = 'a251598_1';
    
    $Connect = mysqli_connect($db_Host, $db_User, $db_Pass, $db_BaseName) or die("Ошибка соединения ".mysqli_error($Connect));
    mysqli_set_charset($Connect, "utf8");
    
    if (isset($_POST['on_load'])) {
        if ($_POST['on_load'] == true) {
            $boo_ReloadAll = true;
        }; 
    } else {
        $boo_ReloadAll = false;
    };
    
    if (isset($_POST['busket_number']) && isset($_POST['busket_number_sec']) && isset($_POST['busket_item']) && isset($_POST['busket_quant'])) {
        $array = Array (
            'number' => $_POST['busket_number'],
            'number_sec' => $_POST['busket_number_sec'],
            'item' => $_POST['busket_item'],
            'quant' => $_POST['busket_quant']
        );
        if ($_SESSION['service'] == null) {
            $_SESSION['service'][] = $array;
        } else {
            array_push($_SESSION['service'], $array);
        };
        $boo_ReloadAll = true;
    };    
    
    if (isset($_POST['busket_change_plus'])) {
        foreach ($_SESSION['service'] as $key => $servise_term){
            if ($key == $_POST['busket_change_plus']-1) {
                $_SESSION['service'][$key]['quant'] = $servise_term['quant']+1;
            };
        };
        $boo_ReloadAll = false;
    };

   if (isset($_POST['busket_change_input']) && isset($_POST['busket_change_quant'])) {
        foreach ($_SESSION['service'] as $key => $servise_term){
            if ($key == $_POST['busket_change_input']-1) {
                $_SESSION['service'][$key]['quant'] = $_POST['busket_change_quant'];
                break;
            };
        };
        $boo_ReloadAll = false;
    };

    if (isset($_POST['busket_change_minus'])) {
        foreach ($_SESSION['service'] as $key => $servise_term){
            if ($key == $_POST['busket_change_minus']-1) {
                $_SESSION['service'][$key]['quant'] = $servise_term['quant']-1;
                break;
            };
        };
        $boo_ReloadAll = false;
    };
    
    if (isset($_POST['busket_del_item'])) {
        foreach ($_SESSION['service'] as $key => $servise_term){
            foreach ($_POST['busket_del_item'] as $id_del_item){
                if ($key == $id_del_item-1) {
                    unset($_SESSION['service'][$key]);
                };
            };
        };
        $_SESSION['service'] = array_values($_SESSION['service']);
        $boo_ReloadAll = true;
    };    

    
    /* Формирование заказа */
    if (isset($_POST['busket_add_order_user'])) {
        foreach ($_SESSION['service'] as $servise_term){
            $row = mysqli_fetch_assoc(mysqli_query($Connect,"SELECT name, metrics, cost, number FROM ".fn_SetTableName($servise_term['number'], $servise_term['number_sec'])." WHERE number=".$servise_term['item'])) or die("Ошибка: ответ не получен (order set) ".mysqli_error($Connect));
            $data[] = array_merge($row, array('quant' => $servise_term['quant'], 'table_name' => fn_SetTableName($servise_term['number'], $servise_term['number_sec'])));
        };
        $answer = mysqli_fetch_assoc(mysqli_query($Connect,"SELECT id FROM Service_Order WHERE id=(SELECT MAX(id) FROM Service_Order)")) or die("Ошибка: ответ не получен (order id) ".mysqli_error($Connect));
        $send = mysqli_query($Connect,"INSERT INTO Service_Order (id, user, item, date, status) VALUES
        (".($answer['id']+1).", ".$_POST['busket_add_order_user'].", '".json_encode($data)."', ".date(U).", 'Сформирован')") or die("Ошибка: ответ не получен (order send) ".mysqli_error($Connect));
        echo $answer[id]+1;
        $boo_ReloadAll = false;
    };
    
    /* Формирование корзины */
    if ($boo_ReloadAll == true){ 
        foreach ($_SESSION['service'] as $servise_term){
            $row = mysqli_fetch_assoc(mysqli_query($Connect,"SELECT name, metrics, cost FROM ".fn_SetTableName($servise_term['number'], $servise_term['number_sec'])." WHERE number=".$servise_term['item'])) or die("Error answer ".mysqli_error($Connect)) or die("Ошибка: ответ не получен (busket set) ".mysqli_error($Connect));
            $data[] = array_merge($row, array('quant' => $servise_term['quant']));
        };
        echo json_encode($data);
    };

    if (isset($_POST['busket_remove_order'])) {
        unset($_SESSION['service']);
    }

    function fn_SetTableName($arr_TableNameNumber, $arr_TableNameNumberSec) { 
        switch ($arr_TableNameNumber) {
            case '1':
                $TableName = 'Pricelist_Boiler';
                break;
            case '2':
                $TableName = 'Pricelist_Heating_system';
                break;
            case '3':
                $TableName = 'Pricelist_Radiator';
                break;
            case '4':
                switch ($arr_TableNameNumberSec) {
                    case '1':
                        $TableName = 'Pricelist_Pipes';
                        break;
                    case '2':
                        $TableName = 'Pricelist_Pipes_thread';
                        break;
                    case '3':
                        $TableName = 'Pricelist_Pipes_strobe';
                        break;
                };
                break;
            case '5':
                $TableName = 'Pricelist_Bath';
                break;
            case '6':
                $TableName = 'Pricelist_Shower_cabin';
                break;
            case '7':
                $TableName = 'Pricelist_Toilet';
                break;
            case '8':
                $TableName = 'Pricelist_Sink';
                break;
            case '9':
                $TableName = 'Pricelist_Mixer';
                break;
            case '10':
                $TableName = 'Pricelist_Filters';
                break;
            case '11':
                $TableName = 'Pricelist_Water_meter';
                break;
            case '12':
                $TableName = 'Pricelist_Polote_dryer';
                break;
            case '13':
                $TableName = 'Pricelist_Connecting_home_appliances';
                break;
            case '14':
                $TableName = 'Pricelist_Plumbing_repair';
                break;
            case '15':
                $TableName = 'Pricelist_Dismantling';
                break;
            case '16':
                switch ($arr_TableNameNumberSec) {
                    case '1':
                        $TableName = 'Pricelist_Additional_expenses';
                        break;
                    case '2':
                        $TableName = 'Pricelist_Expert_departure';
                        break;
                };
                break;
        };
        return $TableName;
    };

    mysqli_close($Connect);
?>