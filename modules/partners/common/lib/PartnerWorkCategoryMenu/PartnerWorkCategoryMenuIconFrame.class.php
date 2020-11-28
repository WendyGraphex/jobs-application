<?php

 
class PartnerWorkCategoryMenuIconFrame  extends Pictures {
    
    
    
   function __construct(PartnerWorkCategoryMenu $item) {
        parent::__construct($item);
        $this->small_width=128;
        $this->small_height=128;
        $this->thumb_width=64;
        $this->thumb_height=64;
    }
    
     function hasPicture()
    {
        return $this->getItem()->hasPicture();
    }
    
   /* function generate()
    {
        if ($this->getItem()->isNotLoaded())    
            return $this;              
        $this->getOriginal()->resize($this->get('medium_width',250),$this->get('medium_height',250),"","../medium/");                  
        $this->getOriginal()->resize($this->get('thumb_width',60),$this->get('thumb_height',60),"","../thumb/");
        $this->getOriginal()->resize($this->get('small_width',128),$this->get('small_height',128),"","../small/");
        return $this;
    }*/
    
    
    protected function getPicture($type="")
    {
        return new PictureObject3(array(
                 "path"=>$this->getItem()->getIconDirectory()."/".$type,
                 "picture"=>$this->getItem()->get('icon'),
                 "transparent"=>true,
                 "urlPath"=>url("/data/categories/menu/icon/".$this->getItem()->get('id')."/".$type,"web","frontend"),
                 "url"=>url("/data/categories/menu/icon/".$this->getItem()->get('id')."/".$type."/".$this->getItem()->get('icon'),"web","frontend")
              ));
    }
    
       function removeAll()
    {
        mfFileSystem::net_rmdir($this->getItem()->getIconDirectory());
        return $this;
    }
}
