<?php

class SinglePdf extends htmltopdf {
    
    

    
    function getFilename()
    {                 
        $value=mfConfig::get('mf_site_frontend_dir')."/data/htmltopdf/pdfFile.pdf";       
        return $value;
    }
    
    
    function configure()
    {      
        $this->setOption('filename',$this->getFilename());       
        $this->setOption('orientation','P');          
        parent::configure();
    }
    
 
    
   function output()
    {       
       $this->debug();        
       $this->create();            
       parent::output();
    }
        
    
    function save()
    {               
        $this->create();         
        parent::save();
    }
    
    function forceOutput()
    {
        $this->create();       
        parent::save();
        parent::_output(); 
    }
    
    function create()
    {      
        $this->setOptions(array(
                         //  "author"=>"administrator",
                         //  "title"=>__("invoice n°%s",$this->orderInvoice->getReference()),
                          // "subject"=>__("invoice"),
                          // "keywords"=>__("products, best")
                          )
                      )
               ->createPDF('utils_jpgraph','SinglePdf');  
    }
}

