<?php


class EmployeeAdvertDocumentFileManagerPictures extends Pictures {
     
     function __construct(EmployeeAdvertDocumentFileManager $item) {
        parent::__construct($item);
    }
    
    function getFileManager()
    {
        return $this->getItem();
    }
    
     function hasPicture()
    {
        return $this->getItem()->hasFile();
    }     
    
    function getOriginal()
    {
        if ($this->original===null)
        {
            $this->original=new PictureObject3(array(
                 "path"=>$this->getFileManager()->getDirectory(),
                 "picture"=>$this->getFileManager()->getItem()->get('file'),
                // "urlPath"=>url($this->getFileManager()->getPathForUrl(),'web',"frontend"),
               //  "url"=>url($this->getFileManager()->getPathForUrl()."/".$this->getFileManager()->getItem()->get('file'),'web',"frontend"),
                  "urlPath"=>url_to("employees_document_download",array('file'=>'','id'=>''),mfConfig::get('mf_app')),
                  "url"=>url_to("employees_document_download",array('file'=>$this->getFileManager()->getItem()->get('file'),'id'=>$this->getFileManager()->getItem()->get('id')),mfConfig::get('mf_app'))
            ));
        }   
        return $this->original;
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
    
    function getDirectory()
    {        
       return  $this->getFileManager()->getItem()->getDirectory();
    }
    
    protected function getPicture($type="")
    {               
       return new PictureObject3(array(
                 "path"=>$this->getDirectory()."/".$type,
                 "picture"=>$this->getFileManager()->getItem()->get('file'),
               //  "urlPath"=>url($this->getFileManager()->getPathForUrl()."/".$type,'web'),
                // "url"=>url($this->getFileManager()->getPathForUrl()."/".$type."/".$this->getFileManager()->getItem()->get('file'),'web',"frontend")
             "urlPath"=>url_to("employees_document_download_picture",array('file'=>'','id'=>'','type'=>$type),mfConfig::get('mf_app')),
                  "url"=>url_to("employees_document_download_picture",array('file'=>$this->getFileManager()->getItem()->get('file'),'type'=>$type,'id'=>$this->getFileManager()->getItem()->get('id')),mfConfig::get('mf_app'))
        ));
    }

    
}
