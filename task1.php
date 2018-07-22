<?php 

    $result = []; 

    for ($num = 2; $num <= 20000; $num++) 
    { 
        $simple = true; 
        for($del = 2; $del < $num; $del++) 
        { 

            if(($num % $del) == 0) 
            { 
                $simple = false; 
                break; 
            } 

        } 

        if($simple) 
        { 
            $result[] = $num; 
        } 

    }; 

    $p = array_sum($result); 

    print_r($p);
