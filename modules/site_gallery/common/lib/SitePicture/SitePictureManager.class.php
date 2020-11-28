<?php


class SitePictureManager extends Pictures {
     
     function __construct(SitePicture $item) {
        parent::__construct($item);
    }
        
     function hasPicture()
    {
        return $this->getItem()->hasPicture();
    }     
    
    function getOriginal()
    {
        return $this->original=$this->original===null?new PictureObject3(array(
                 "path"=>$this->getItem()->getDirectory(),
                 "picture"=>$this->getItem()->get('picture'),
                 "urlPath"=>url($this->getItem()->getPath(),'web',"frontend"),
                 "url"=>url($this->getItem()->getPath()."/".$this->getItem()->get('picture'),'web',"frontend"),
            )):$this->original;
    } 
    
    function generate() {
        $this->generateMedium();
        $this->generateThumb();
        $this->generateSmall();
    }
    
    function generateMedium()
    {        
       $this->getOriginal()->resize($this->get('medium_width',640),$this->get('medium_height',480),"","","/medium/");                  
       return $this;
    }
    
    function generateThumb()
    {             
       $this->getOriginal()->resize($this->get('thumb_width',320),$this->get('thumb_height',220),"","","/thumb/");
       return $this;
    }
    
     function generateSmall()
    {             
       $this->getOriginal()->resize($this->get('small_width',160),$this->get('small_height',110),"","","/small/");
       return $this;
    }
       
    
    protected function getPicture($type="")
    {               
       return new PictureObject3(array(
                 "path"=>$this->getItem()->getDirectory()."/".$type,
                 "picture"=>$this->getItem()->get('picture'),
                 "urlPath"=>url($this->getItem()->getPath()."/".$type,'web'),
                 "url"=>url($this->getItem()->getPath()."/".$type."/".$this->getItem()->get('picture'),'web',"frontend")
        ));
    }

    
    function getUrl()
    {
      return $this->getOriginal()->getUrl();  
    }
    
}
