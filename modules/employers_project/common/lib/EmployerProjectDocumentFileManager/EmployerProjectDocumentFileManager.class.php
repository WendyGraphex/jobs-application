<?php


class EmployerProjectDocumentFileManager {
     
    protected $item=null;
     
    function __construct(FileManagerFile $item) {
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
        return $this->images=$this->images===null?new EmployerProjectDocumentFileManagerPictures($this):$this->images;
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
                 "urlPath"=>url_to('employers_project_document_download',array('id'=>'','file'=>''),"frontend"),
                 "url"=>url_to('employers_project_document_download',array('id'=>$this->getItem()->get('id'),'file'=>$this->getItem()->get('file')),"frontend")
              ));
    }
    
    function getFlavicons()
    {     
        return $this->flavicons=$this->flavicons===null?new EmployerProjectDocumentFileFlavicons($this->getItem()->get('extension')):$this->flavicons;
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
