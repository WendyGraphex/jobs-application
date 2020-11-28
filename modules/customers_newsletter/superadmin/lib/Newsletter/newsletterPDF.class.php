<?php


class newsletterPDF extends htmltopdf {
    
    function getFilename()
    {
       return mfConfig::get('mf_site_app_dir').sprintf("/data/pdf/%s/newsletter.pdf",$this->getOption('lang','en'));
    }
    
    
    function configure()
    {
        $this->setOption('filename',$this->getFilename());
        $this->setOption('orientation','L');    
        parent::configure();
    }
    
    
    function output()
    {
        if (!$this->exist())
        {    
          $this->setOptions(array(
                             "author"=>"administrator",
                             "title"=>__("newsletter"),
                             "subject"=>__("newsletter"),
                             "keywords"=>__("newsletter"))
                        )
          ->createPDF('customer_newsletter','pdfExport',$this->parameters);
        } 
        parent::output();
    }
    
}

