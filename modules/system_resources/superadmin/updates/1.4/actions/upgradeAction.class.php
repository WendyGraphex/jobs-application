<?php



class system_resources_upgrade_14_Action extends mfModuleUpdate {
 
    function execute()
    {               
       $settings= new SystemResourceSettings($this->getSite());
       $settings->register('pdftotext','/system_resources/pdftotext');           
       $settings->register('pdfimages','/system_resources/pdfimages');           
    }
}

