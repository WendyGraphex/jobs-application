<?php

class CmsPageI18nUrl extends mfString {
 
    protected $language=null;
    
    function __construct($str = "",$language="en") {
        $this->language=$language;
        $this->request= mfcontext::getInstance()->getRequest();
        parent::__construct($str);
    }
    
    function getLanguage()
    {
        return $this->language;
    }
    
    
    function __toString() {       
        if ($this->getValue()===null)
           return "#";  
        if ($this->getValue()=='')
           return "";  
        if (strpos($this->getValue(),"http")===0)
           return $this->getValue();
        if ($this->getValue()==="/")
           return (string)"/";
        if (strpos($this->getValue(),"/")===0)
           return url($this->getValue(),"url","frontend","",$this->getLanguage());       
         return url_i18n_to('cms_pages', array('url'=>$this->getValue(),'extension'=>'html'),$this->getLanguage(),'frontend');
    }
    
    function isCurrent()
    {
        return $this->request->getUri()==$this->getValue();
    }
    
    function getText()
    {
        return $this->getValue();
    }
    
    function isLink()
    {
        if (in_array($this->getValue(),array(null,'','#')))
           return false;
       return true;
    }
      
}

