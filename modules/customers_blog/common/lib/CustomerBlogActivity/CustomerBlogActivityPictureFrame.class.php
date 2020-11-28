<?php

 
class CustomerBlogActivityPictureFrame  extends Pictures {
    
    
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
                 "urlPath"=>url("/data/activities/picture/".$this->getItem()->get('id')."/".$type,"web","frontend"),
                 "url"=>url("/data/activities/picture/".$this->getItem()->get('id')."/".$type."/".$this->getItem()->get('picture'),"web","frontend")
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
     
}
