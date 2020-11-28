<?php

class mfFilename extends mfType {

    function __construct($value) {
        $this->value=(string)$value;
    }
    
    function getFile()
    {
        return new mfString(pathinfo($this->value, PATHINFO_BASENAME));
    }
    
    function getExtension()
    {
        return new mfString(pathinfo($this->value, PATHINFO_EXTENSION));
        
    }
    
    function getDirectory()
    {
      /*  if (strpos($this->value,"/")===false)
                return new mfString("");
        return new mfString(pathinfo($this->value, PATHINFO_DIRNAME));*/
        if (strpos($this->value,"/")===false)
                return new mfDirname("/");
        return new mfDirname(pathinfo($this->value, PATHINFO_DIRNAME));
    }
    
     function getFilename()
    {
        return new mfString(pathinfo($this->value, PATHINFO_FILENAME));
    }
    
    function __toString() {
        return (string)$this->value;
    }
}
