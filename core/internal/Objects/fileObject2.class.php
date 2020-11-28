<?php


class fileObject2 {
    
    protected   $options =array(),                  
                $information=null,
                $_file=null;
    
    function __construct($options) { 
        $this->options=$options;      
    }
    
    function getOptions()
    {
        return $this->options;
    }
    
    function getOption($name,$default=null)
    {
        return isset($this->options[$name])?$this->options[$name]:$default;
    }
    
    function setOption($name,$value)
    {
        $this->options[$name]=$value;
        return $this;
    }
    
    function getPath()
    {
      return $this->getOption('path');
    }
    
    
    function getFile()
    {
       return $this->getPath()."/".$this->getOption('file');
    }
    
    function getURL($application=null)
    {
       if ($application=='superadmin' && $this->getOption('urlAdmin')) 
           return $this->getOption('urlAdmin');
       return $this->getOption('url');
    }
    
     function getName()
    {
       return basename($this->getFile(),".".$this->getExtension());
    }
    
       function getUrlAdmin()
    {
        return $this->getOption('urlAdmin'); 
    }
    
    function getURLPath($mode="") 
    {              
       if ($mode=='superadmin' && $this->getOption('urlPathAdmin')) 
           return $this->getOption('urlPathAdmin'); 
       return $this->getOption('urlPath');
    }
    
    function getExtension()
    {
        if ($this->getOption('file'))
           return pathinfo($this->getOption('file'), PATHINFO_EXTENSION); 
        return "";
    }
    
    function remove()
    {
        if ($this->getOption('file'))
        {    
            $file=$this->getFile();           
            if ($file && is_readable($file))
                unlink($file);
        }    
    }
    
    function rename($new_name)
    {
        if ($this->getOption('file'))
        {
            $old_file=$this->getPath()."/".$this->getOption('file');
            $new_file=$this->getPath()."/".$new_name;
            mfFileSystem::rename($old_file,$new_file);
            $this->setOption('file',$new_name);
        }    
    }
    
    function __toString()
    {
       return $this->getOption('file'); 
    }
    
    function isExist()
    {
        return (is_readable($this->getFile()));
    }
    
    function File()
    {
        return $this->getOption('file');
    }
    
    function getInformation()
    {
       if (!$this->information)
           $this->information=new File($this->getFile());
       return $this->information;
    }
    
    function load()
    {
        if ($this->_file===null)
        {
            $this->_file=new File($this->getFile());
        }    
        return $this->_file;
    }
}

