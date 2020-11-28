<?php


class site_restrictive_accessActions extends mfActions { 
       
    function executeSiteNotAvailable() {                 
        $identification = false;     
        $moduleName=mfConfig::get('mf_default_site_not_available_module');
        $actionName=mfConfig::get('mf_default_site_not_available_action');        
        // Restrictive access enabled ?
        if ($this->getContext()->getSite()->hasRestrictedAccess())
             $this->forward( $moduleName, $actionName); // Go to module/action for display site not available
        if (isset($_SERVER['PHP_AUTH_USER'])) {
            $login = $_SERVER['PHP_AUTH_USER'];
            $password = $_SERVER['PHP_AUTH_PW'];        
            //@TODO ICI mettre le user que l'on desire
          //  $user=$this->getUser();               
            if (UserUtils::findAdminOrSuperAdminUserByNameOrEmailAndPassword($login,md5($password)))
               $identification=true; 
            else
               $identification=( $login== mfConfig::getSuperAdmin('login') && mfConfig::getSuperAdmin('password')==md5($password));            
                
           
            if ($identification) {
                if (!mfConfig::get('mf_site_available_forced')) {
                    mfConfig::set('mf_site_available_forced', true);
                    // Get the previous module/action to forward
                    $previousEntry = $this->getController()->getActionStack()->getPrevious();
                    $moduleName = $previousEntry->getModuleName();
                    $actionName = $previousEntry->getActionName();
                }
            }
        }
        if (!$identification) 
            $this->getResponse()->setHttpHeader('WWW-Authenticate','Basic');    
               
        $this->forward( $moduleName, $actionName);
    }
    
}

