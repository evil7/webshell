<?php
/**
 * http://202.112.26.124:8080/280a31eec4c62a893ad40a6508d207c8/index.php?code=[seed]
 */

$v = [980,402,692];
$try = 9999; 
for($k=0;$k<$try;$k++){
    $max = $k;
    for($t=0;$t<$max;$t++){
        $seed = $t;
        srand($seed);
        for($i=0;$i<=3;$i++){
            $out[$i] = rand(0,$max);
    
        }
        if($out[0]==$v[0]&&$out[1]==$v[1]&&$out[2]==$v[2]){
            var_dump($out);
            echo "MAX_NUM : $k\n";
            echo "RAN_SEED : $seed\n";
            die("SEESION : ".$out[3]."\n");
        }
    }
}

// Just Rolling GET http://202.112.26.124:8080/280a31eec4c62a893ad40a6508d207c8/index.php?code=233 and if res.match(/EIS.*/)
// vector: EIS{brute_forc3_th3_r4nd0m_s33d}