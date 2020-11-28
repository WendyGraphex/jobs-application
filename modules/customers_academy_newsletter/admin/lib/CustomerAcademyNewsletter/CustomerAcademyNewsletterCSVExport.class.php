<?php


class CustomerAcademyNewsletterCSVExport extends csvExport {
    
    
    protected function getFilename()
    {
       return mfConfig::get('mf_site_app_dir').sprintf("/data/csv/%s/newsletter.csv",$this->getOption('lang'));
    }   
    
    function __construct($options=array(),$site=null)
    {
        parent::__construct($options,'newsletter', null, $site);
    }    
    

}

