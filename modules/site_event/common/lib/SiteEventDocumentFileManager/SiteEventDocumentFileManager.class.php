<?php


class SiteEventDocumentFileManager {
     
    protected $item=null;
     
    function __construct(SiteEventDocument $item) {
        $this->item=$item;
    }
    
    function getItem()
    {
        return $this->item;
    }
    
    function delete()
    {
        $this->getFile()->remove();
        return $this;
    }
    
   /* function escapeFilename(mfString $filename)
    {
        return $filename->replace(array(" "),array("_"));        
    }
    
     function escapePath(mfString $path)
    {
        return $path->noaccent()->replace(array(" "),array("_"));        
    }*/
    
    
    function getImages()
    {
        return $this->images=$this->images===null?new SiteEventDocumentFileManagerPictures($this):$this->images;
    }
    
    
     function hasFile()
    {
        return $this->getItem()->hasFile();
    }
    
    function getPath()
    {
        return $this->getDirectory();
    } 
    
    function getDirectory()
    {
        return $this->getItem()->getDirectory();
    }
    
    function getPathForUrl()
    {
        return  $this->getItem()->getPath();
    }
    
   /*  function getRoot()
    {
        return $this->getItem()->getDirectoryRoot().($this->getItem()->getPathRoot()->isEmpty()?"":"/").$this->getPathRoot();
    }*/
  
    
     function getFile()
    {
        return new FileObject2(array(
                 "path"=>$this->getDirectory(),
                 "file"=>$this->getItem()->get('file'),
                // "urlPath"=>url($this->getPathForUrl(),"web","frontend"),
               //  "url"=>url($this->getPathForUrl()."/".$this->getItem()->get('file'),"web")
              "urlPath"=>url_to("site_event_download",array('file'=>'','id'=>''),mfConfig::get('mf_app')),
                  "url"=>url_to("site_event_document_download",array('file'=>$this->getItem()->get('file'),'id'=>$this->getItem()->get('id')),mfConfig::get('mf_app'))
              ));
    }
    
    function getFlavicons()
    {     
        return $this->flavicons=$this->flavicons===null?new SiteEventDocumentFileFlavicons($this->getItem()->get('extension')):$this->flavicons;
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
    
    function removeAll()
    {        
         mfFileSystem::net_rmdir($this->getItem()->getDirectory());
        return $this;
    }
    
    function generate()
    {
        if ($this->isPicture())
            $this->getImages()->generate();
        return $this;
    }
    
    
    function isPicture()
    {
        return in_array($this->getItem()->get('extension'),array('png','jpg','jpeg','gif','svg'));
    }
    
    function isMovie()
    {
       return in_array($this->getItem()->get('extension'),array('mov','mp4','avi')); 
    }
    
     function isMusic()
    {
       return in_array($this->getItem()->get('extension'),array('mp3','wav')); 
    }
    
    
    function __toString() {
        return (string)$this->getItem()->get('file');
    }
    
}
