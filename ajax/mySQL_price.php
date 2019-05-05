<?php
    header('Content-Type: text/json; charset=UTF-8');

    $db_Host = 'a251598.mysql.mchost.ru';
    $db_User = 'a251598_1';
    $db_Pass = 'S88NNs12p2b7';
    $db_BaseName = 'a251598_1';
    
    $Connect = mysqli_connect($db_Host, $db_User, $db_Pass, $db_BaseName) or die("Error connect ".mysqli_error($Connect));
    mysqli_set_charset($Connect, "utf8");

    if (isset ($_POST['number'])) {
        switch ($_POST['number']) {
            case '1':
                $TableName = array('Pricelist_Boiler');
                break;
            case '2':
                $TableName = array('Pricelist_Heating_system');
                break;
            case '3':
                $TableName = array('Pricelist_Radiator');
                break;
            case '4':
                $TableName = array('Pricelist_Pipes', 'Pricelist_Pipes_thread', 'Pricelist_Pipes_strobe');
                break;
            case '5':
                $TableName = array('Pricelist_Bath');
                break;
            case '6':
                $TableName = array('Pricelist_Shower_cabin');
                break;
            case '7':
                $TableName = array('Pricelist_Toilet');
                break;
            case '8':
                $TableName = array('Pricelist_Sink');
                break;
            case '9':
                $TableName = array('Pricelist_Mixer');
                break;
            case '10':
                $TableName = array('Pricelist_Filters');
                break;
            case '11':
                $TableName = array('Pricelist_Water_meter');
                break;
            case '12':
                $TableName = array('Pricelist_Polote_dryer');
                break;
            case '13':
                $TableName = array('Pricelist_Connecting_home_appliances');
                break;
            case '14':
                $TableName = array('Pricelist_Plumbing_repair');
                break;
            case '15':
                $TableName = array('Pricelist_Dismantling');
                break;
            case '16':
                $TableName = array('Pricelist_Additional_expenses', 'Pricelist_Expert_departure');
                break;
        };
        $data = array();
        foreach ($TableName as $name) {    
            $RowData = array();
            $answer = mysqli_query($Connect,"SELECT * FROM $name") or die("Error answer ".mysqli_error($Connect));
            while ($row = mysqli_fetch_assoc($answer)){
                $RowData[] = $row;  
            };
            $data[$name] = $RowData;
        };
    echo json_encode($data);
    };    
    mysqli_close($Connect);
?>