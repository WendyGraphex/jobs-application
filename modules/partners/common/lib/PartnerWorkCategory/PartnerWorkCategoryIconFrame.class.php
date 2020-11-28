<?php

 
class PartnerWorkCategoryIconFrame  extends Pictures {
    
    
    
    function __construct($item) {
        parent::__construct($item);
    }
    
     function hasPicture()
    {
        return $this->getItem()->hasIcon();
    }
    
    protected function getPicture($type="")
    {   
        return new PictureObject3(array(
                 "path"=>$this->getItem()->getIconDirectory()."/".$type,
                 "picture"=>$this->getItem()->get('icon'),
                 "transparent"=>true,
                 "urlPath"=>url("/data/categories/icon/".$this->getItem()->get('id')."/".$type,"web","frontend"),
                 "url"=>url("/data/categories/icon/".$this->getItem()->get('id')."/".$type."/".$this->getItem()->get('icon'),"web","frontend")
              ));
    }
    
    
    function removeAll()
    {
        mfFileSystem::net_rmdir($this->getItem()->getIconDirectory());
        return $this;
    }
    
    
    function remove()
    {
        $this->removeAll();
        $this->getItem()->set('icon','')->save();       
        return $this;
    }
}
