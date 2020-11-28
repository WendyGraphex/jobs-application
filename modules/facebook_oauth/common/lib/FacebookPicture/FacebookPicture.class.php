<?php

class FacebookPicture extends mfPictureUrl {
    
    protected $height=0,$url="",$width=0;
    
    function __construct($picture) {   
        foreach (array('url','height','width') as $field)
            $this->$field=$picture[$field];   
        parent::__construct();
    }              
    
}
