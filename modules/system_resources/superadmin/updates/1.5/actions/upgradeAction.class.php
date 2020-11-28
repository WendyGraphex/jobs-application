<?php



class system_resources_upgrade_15_Action extends mfModuleUpdate {
 
    function execute()
    {               
       $settings= new SystemResourceSettings($this->getSite());
       $settings->register('catdoc','/system_resources/catdoc');           
       $settings->register('catdoc','/system_resources/catdoc');           
    }
}

