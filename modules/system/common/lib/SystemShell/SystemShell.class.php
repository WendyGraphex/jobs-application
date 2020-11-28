<?php


class SystemShell extends  SystemCore
{
    protected static $instance=null;
       
    
    function execute($cmd="",$options="")
    {                      
        $cmd.=" ".$options;   
       // echo $cmd;
        $return=array();            
        $ret=exec($cmd,$return); 
        $this->return=new SystemReturn($return);      
        return $this->return;
    }
    
    function getVersion()
    {
        return "?";
    }
       
    function ls($options="")
    {
        return $this->execute('ls',$options);
    }
    
    function dir($options="")
    {
        return $this->execute('dir',$options);
    }
    
    function du($options="")
    {
       return $this->execute('du',$options); 
    }
}
