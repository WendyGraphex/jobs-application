<?php


class CsvImport extends CsvImportBase {
               
    function __construct($file, $options=array(), $site = null) {
        if (!is_readable($file))
             throw new mfException(__("csv file [%s] is not found.",basename($file))); 
        parent::__construct($file, $options, $site);
    }                                                                 
     
    function getHeader()
    {
        if (!$this->hasHeader())
            $this->readHeader();
        return parent::getHeader();                
    }
    
     function readHeader()
     {
           $this->open();    
           parent::readHeader();                                  
     }
                    
}

