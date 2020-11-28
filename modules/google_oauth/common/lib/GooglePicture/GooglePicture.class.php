<?php

class GooglePicture extends mfPictureUrl {
    
    protected $url="";
    
    function __construct($picture) {   
        //foreach (array('url') as $field)
            //$this->$field=$picture[$field]; 
        $this->url=$picture;
        parent::__construct();
    }
    
       
   
    
}
