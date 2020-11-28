<?php

 
class UserPictures  extends Pictures {
    
    protected $original=null,$thumb=null,$medium=null;
    
    function __construct(User $item) {
        parent::__construct($item);
    }
       
    
    protected function getPicture($type="")
    {
        return new PictureObject3(array(
                 "path"=>$this->getItem()->getDirectory()."/".$type,
                 "picture"=>$this->getItem()->get('file'),
                 "urlPath"=>url("/data/users/avatars/".$this->getItem()->get('id')."/".$type,"web","frontend"),
                 "url"=>url("/data/users/avatars/".$this->getItem()->get('id')."/".$type."/".$this->getItem()->get('file'),"web","frontend")
              ));
    }
    
    function getOriginal()
    {
        return $this->original= $this->original===null?$this->getPicture("original"):$this->original;
    } 
    
    function getMedium()
    {
        return $this->medium=$this->medium===null?$this->getPicture("medium"):$this->medium;
    } 
    
    
    function getThumb()
    {
        return $this->thumb=$this->thumb===null?$this->getPicture("thumb"):$this->thumb;
    } 
    
    
    function remove()
    {
        $this->getThumb()->remove();
        $this->getOriginal()->remove();
        $this->getMedium()->remove();
        return $this;
    }
    
    function generate()
    {
        
        return $this;
    }
    
    function getUrl()
    {
        return $this->getOriginal()->getUrl();
    }
}
