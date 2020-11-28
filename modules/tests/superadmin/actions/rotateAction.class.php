<?php

class tests_rotateAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {                                  
    //  echo __METHOD__."<br/>";
      // 607 m / 296.834° 
        
        header('Content-type: image/png');

// Chargement
$source = imagecreatefrompng(__DIR__."/../data/car.png");


// Rotation
//$rotate = imagerotate($source,0, imageColorAllocateAlpha($source, 0, 0, 0, 127));

// Affichage
//imagepng($rotate);

readfile(__DIR__."/../data/car.png");
        return mfView::NONE;
        
    } 
}
