<?php

 
class EmployeeAvatarFrame  extends Pictures {
    
    
   function __construct(Employee $item) {
        parent::__construct($item);
    }
    
     function hasPicture()
    {
        return $this->getItem()->hasAvatar();
    }
    
    protected function getPicture($type="")
    {       
        return new PictureObject3(array(
                 "path"=>$this->getItem()->getDirectory()."/".$type,
                 "picture"=>$this->getItem()->get('avatar'),
                 "url"=>url("/data/employees/".$this->getItem()->get('id')."/avatar/".$type."/".$this->getItem()->get('avatar'),"web","frontend")
              ));
    }
            
    function delete()
    {
        parent::delete();
        $this->getItem()->set('avatar','')->save();        
        return $this;
    }
    
    
   
}