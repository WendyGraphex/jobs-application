<?php

 
class EmployerLogoFrame  extends Pictures {
    
    
   function __construct(EmployerUser $item) {
        parent::__construct($item);
    }
    
     function hasPicture()
    {
        return $this->getItem()->hasLogo();
    }
    
    protected function getPicture($type="")
    {
        return new PictureObject3(array(
                 "path"=>$this->getItem()->getDirectory()."/".$type,
                 "picture"=>$this->getItem()->get('logo'),
                // "urlPath"=>url("/data/employers/".$this->getItem()->get('id')."/logo/".$type,"web","admin"),
                //"urlPath"=>url("/data/employers/".$this->getItem()->get('id')."/logo".$type,"web","admin"),
                "url"=>url("/data/employers/company/".$this->getItem()->get('id')."/logo/".$type."/".$this->getItem()->get('logo'),"web","frontend")
              ));
    }
    
    
}
