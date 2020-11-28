<?php


class modules_manager_ajaxUninstallModuleManagerAction extends mfAction {
    
    
    function execute(mfWebRequest $request) { 
    
      $messages = mfMessages::getInstance();
      try 
      {
        
         $module=new ModuleManager($request->getPostParameter('id'));                           
         if ($module->get('is_available')!='YES')
                throw new mfException(__("module [{module}] installation is not authorized.",array("module"=>$module->get('name'))));
         $response=array(
                    "action"=>"UninstallModuleManager",
                    "id"=>$module->get('id')
         );
         $module->set('status','loaded');
         $module->set('is_active','NO');      
         if ($module->getModule()->isInstalled())
         {
            $module->getModule()->getInstaller()->uninstall();                                
            $module->getModule()->removeConfigCache();
            $this->getContext()->getEventManager()->notify(new mfEvent($module, 'module.manager.uninstalled'));                       
            $response["info"]=__('module [{module}] is uninstalled.',array("module"=>$module->get('name')));             
         }
         else
         {
           $response['error']=__("the module [{module}] is not installed.",array("module"=>$module->get('name'))); 
           $response['status']='loaded';
         }                                      
         $module->save(); 
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

