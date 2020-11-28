<?php


class InstagramPicture extends mfPictureUrl 
{
    protected $url="";
    
    function __construct($picture) {          
        $this->url=$picture;
        parent::__construct();
    }
}

