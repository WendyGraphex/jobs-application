<?php
 
class mfPictureUrl {
   
    function __construct()
    {
        $this->configure();
    }
   
    function configure()
    {
        $this->setHeaders();
    }
   
    function getContent()
    {
       return file_get_contents($this->getUrl());
    }
   
    protected function setHeaders()
    {
        $headers = get_headers($this->getUrl(), true);
        $this->content_length=$headers['Content-Length'];       
        $this->extension=mfValidatedFile::getExtensionFromType($headers['Content-Type']);
        return $this;
    }
   
     function isValid()
    {
        return true;
    }
   
    function __call($name, $arguments) {
       
    }   
   
    function getUrl()
    {       
        return $this->url;
    }
   
    function getSize()
    {
        return $this->content_length;    
    }
   
    function getExtension()
    {
        return $this->extension;
    }
   
}