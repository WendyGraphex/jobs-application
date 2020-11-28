<?php


class CustomerMessageFileManager {
     
    protected $item=null;
     
    function __construct($item) {
        $this->item=$item;
    }
    
    function getItem()
    {
        return $this->item;
    }
    
    
     function escapeFilename(mfString $filename)
    {
        return $filename->replace(array(" "),array("_"));        
    }
    
  /*   function escapePath(mfString $path)
    {
        return $path->noaccent()->replace(array(" "),array("_"));        
    }*/
    
    
    function getImages()
    {
        return $this->images=$this->images===null?new FileManagerPictures($this):$this->images;
    }
    
    
  /*   function hasPicture()
    {
        return $this->getItem()->hasFile();
    }
    
    function getPath()
    {
        return (string)$this->escapePath($this->getItem()->getPath());
    }*/
    
    function getDirectory()
    {
        return $this->getItem()->getDirectory();
    }
    
     function getPathForUrl()
    {
        return $this->getItem()->get('file');
    } 
    
    
     function getFile()
    {
        return new FileObject2(array(
                 "path"=>$this->getDirectory(),
                 "file"=>$this->getItem()->get('file'),
                 "urlPath"=>url_to("customers_messager_download",array('file'=>$this->getPathForUrl(),'id'=>$this->getItem()->get('id')),'admin'),
                 "url"=>url_to("customers_messager_download",array('file'=>$this->getPathForUrl(),'id'=>$this->getItem()->get('id')),'admin')
              ));
    }
            
    function getUrl()
    {
        return $this->getFile()->getUrl();
    }
    
    function getFilename()
    {
        return $this->getFile()->getFile();
    }
    
    function isReadable()
    {      
        return $this->getFile()->isExist();
    }
    
    function delete()
    {
        $this->getFile()->remove();
        return $this;
    }
    
    function isPicture()
    {
        return in_array($this->get('extension'),array('png','jpg','jpeg','gif','svg'));
    }
           
}
