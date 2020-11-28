<?php

 
class EmployeeContentPictureFrame  extends Pictures {
    
    
    function __construct($item) {
        parent::__construct($item);
    }
    
     function hasPicture()
    {
        return $this->getItem()->hasPicture();
    }
    
    protected function getPicture($type="")
    {   
        return new PictureObject3(array(
                 "path"=>$this->getItem()->getPictureDirectory()."/".$type,
                 "picture"=>$this->getItem()->get('picture'),
                 "transparent"=>true,
                 "urlPath"=>url("/data/employees/".$this->getItem()->get('employee_user_id')."/contents/picture/".$type,"web","frontend"),
                 "url"=>url("/data/employees/".$this->getItem()->get('employee_user_id')."/contents/picture/".$type."/".$this->getItem()->get('picture'),"web","frontend")
              ));
    }
    
    
    function removeAll()
    {
        mfFileSystem::net_rmdir($this->getItem()->getPictureDirectory());
        return $this;
    }
    
    
    function remove()
    {
        $this->removeAll();
        $this->getItem()->set('picture','')->save();       
        return $this;
    }
    
    function delete()
    {
        $this->getItem()->set('picture','');
        $this->removeAll();
        return $this;
    }
     
}
