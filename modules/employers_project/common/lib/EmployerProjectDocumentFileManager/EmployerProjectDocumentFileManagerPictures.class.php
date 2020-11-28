<?php


class EmployerProjectDocumentFileManagerPictures extends Pictures {
     
     function __construct(EmployerProjectDocumentFileManager $item) {
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
               //  "urlPath"=>url($this->getFileManager()->getPathForUrl(),'web',"frontend"),
              //   "url"=>url($this->getFileManager()->getPathForUrl(),'web',"frontend"),
                 "urlPath"=>url_to('employers_project_document_download',array('id'=>'','file'=>''),"frontend"),
                 "url"=>url_to('employers_project_document_download',array('id'=>$this->getFileManager()->getItem()->get('id'),'file'=>$this->getFileManager()->getItem()->get('file')),"frontend")
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
              //   "urlPath"=>url($this->getFileManager()->getPathForUrl()."/".$type,'web'),
             //    "url"=>url($this->getFileManager()->getPathForUrl()."/".$type."/".$this->getFileManager()->getItem()->get('file'),'web',"frontend")
                 "urlPath"=>url_to('employers_project_document_download_picture',array('id'=>'','file'=>'','type'=>$type),"frontend"),
                 "url"=>url_to('employers_project_document_download_picture',array('id'=>$this->getFileManager()->getItem()->get('id'),'file'=>$this->getFileManager()->getItem()->get('file'),'type'=>$type),"frontend")
           
        ));
    }

    
}
