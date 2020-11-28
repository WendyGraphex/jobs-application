<?php


class EmailLogger {
   
    protected $file=null;
    
    function __construct()
    {
      $this->file=new File(mfConfig::get('mf_root_dir')."/log/emails.log","a+");
      $this->file->open();      
    }
    
    function trace($from,$to)
    {
        $this->file->write("> ".date("Y-m-d H:i:s")." From:".$from." To:".$to."\n");
    }        
    
    function __destruct() {
         if ($this->file)
          $this->file->close();  
    }
}


