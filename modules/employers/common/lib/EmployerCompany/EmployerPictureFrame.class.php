<?php

 
class EmployerPictureFrame  extends Pictures {
    
    
   function __construct(EmployerLogo $item) {
        parent::__construct($item);
    }
    
     function hasPicture()
    {
        return $this->getItem()->hasPicture();
    }
    
    protected function getPicture($type="")
    {
        return new PictureObject3(array(
                 "path"=>$this->getItem()->getDirectoryPicture()."/".$type,
                 "picture"=>$this->getItem()->get('picture'),
                // "urlPath"=>url("/data/employers/".$this->getItem()->get('id')."/logo/".$type,"web","admin"),
                //"urlPath"=>url("/data/employers/".$this->getItem()->get('id')."/logo".$type,"web","admin"),
                "url"=>url("/data/employers/company/".$this->getItem()->get('id')."/picture/".$type."/".$this->getItem()->get('picture'),"web","frontend")
              ));
    }
    
    
}
