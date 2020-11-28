<?php


class ProjectDocumentFileFlavicons extends mfArray {
    
    protected $extension=null;
    
    function __construct($extension = null) {
        $this->extension=$extension;
    }
    
    function getExtension()
    {
        return $this->extension;
    }
    
    function getFile($design="text",$suffix="",$ext="svg")
    {
         return new FileObject2(array(
               //  "path"=>$this->getItem()->getDirectory(),
               //  "picture"=>$this->getItem()->get('name'),
                 "urlPath"=>url("/files/flavicons/".$design."/".$ext."/","picture","frontend"),
                 "url"=>url("/files/flavicons/".$design."/".$ext."/".$this->getExtension().$suffix.".".$ext,"picture","frontend")
              )); 
    }
            
    function getDesign1()
    {
        return $this->getFile("design1");
    }
    
     function getDesign2()
    {
        return $this->getFile("design2");
    }
    
     function getDesign3()
    {
        return $this->getFile("design3");
    }
    
    function getDesign4()
    {
        return $this->getFile("design3");
    }
    
    
    function getText()
    {
        return $this->getFile("text","-file-symbol","png");
    }
}
