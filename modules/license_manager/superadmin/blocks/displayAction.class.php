<?php

class license_manager_displayActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
       $this->license_date=mf_system_license_date_expiration();
       $this->license_version=mf_system_license_version();              
       $this->license_version_date=mf_system_license_date_version();  
       $this->project=mfConfig::getSuperAdmin('project');
    } 
    
    
}