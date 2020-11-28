<?php 

class LinkedinPicture extends mfPictureUrl{
    protected $url = "";
    
    function __construct($picture) {
        $this->url = $picture;
        parent::__construct();
    }
}
