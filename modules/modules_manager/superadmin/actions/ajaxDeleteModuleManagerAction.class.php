<?php

 
class modules_manager_ajaxDeleteModuleManagerAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {                
          $item= new ModuleManager($request->getPostParameter('ModuleManager'));    
          if ($item->isLoaded())
          {  
           $item->delete();   
           $response = array("action"=>"DeleteModuleManager","id"=>$item->get('id'));
          }                    
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

