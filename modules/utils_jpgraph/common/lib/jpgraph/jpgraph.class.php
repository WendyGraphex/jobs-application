<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of jpgraph
 *
 * @author FatimaZbouj
 */
require_once __DIR__.'/../../../common/locales/JpGraph/jpgraph.php';
require_once __DIR__.'/../../../common/locales/JpGraph/jpgraph_line.php';
/*require_once '../locales/Jpgraph/jpgraph_bar.php';
require_once '../locales/Jpgraph/jpgraph_line.php';*/

class jpgraphs extends Graph {
    
function strokeBase64(){
    ob_start();
    imagepng($this->Stroke(_IMG_HANDLER));
    $img =  ob_get_contents();
    ob_end_clean();
    return base64_encode($img) ;
    
    
}


    
}
