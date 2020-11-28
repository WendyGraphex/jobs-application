<?php


// www.project55.net/admin/tests/picture

class tests_pictureAction extends mfAction {
    
   
 
    function execute(mfWebRequest $request) {                                  
        echo __METHOD__;
        $picture= new PictureObject3(array(
                 "path"=>__DIR__."/../data",
                 "picture"=>'image.png',
                 "transparent"=>true,
                // "urlPath"=>url("/data/categories/picture/".$this->getItem()->get('id')."/".$type,"web","frontend"),
                // "url"=>url("/data/categories/picture/".$this->getItem()->get('id')."/".$type."/".$this->getItem()->get('picture'),"web","frontend")
              ));
        
        
        $picture->resize(250,250,"_medium"); //,"../data/medium/");       
       return mfView::NONE;
        
    } 
}

