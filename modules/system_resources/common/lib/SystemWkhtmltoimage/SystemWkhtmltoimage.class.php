<?php


class SystemWkhtmltoimage extends SystemCore
{
 
            
    function getCommand()
    {
        $path=mfTools::isWindowsServer()?realpath($_SERVER['DOCUMENT_ROOT'].'/../../../../../../../').'"Program Files"\wkhtmltopdf':"";        
        $dir=mfTools::isWindowsServer()?"\bin\\":"/usr/bin/";           
        $app=mfTools::isWindowsServer()?'wkhtmltoimage.exe':'wkhtmltoimage';   
        return $path.$dir.$app;
    }
    
    function execute()
    {            
      /*  $options="";
        foreach ($this->getOptions() as $name=>$option)
        {
            $options.=" -".$name.($option?"=".$option:" ")." ";
        }    
        $cmd=$this->getCommand()." -v"; 
        $return=array();       
        $ret=exec($cmd,$return);     
        */
    }
        
    
    function getVersion()
    {
        if ($this->version===null)
        {    
            $return=array();       
            $ret=exec($this->getCommand()." -V",$return);             
            if (strpos($return[0],'wkhtmltoimage')===false)
            {               
                $this->errors[]='version not found';
                $this->version=false;
                return $this->version;
            }
            $this->version=$return[0];           
        }
        return $this->version;
    }
}
