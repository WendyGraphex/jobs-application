<?php


class site_ajaxDeleteLogoAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();
      try 
      {
         
         $item=new Site($request->getPostParameter('Site'));
         if ($item->isLoaded())
         {    
            $item->deleteLogo();            
            $response = array("action"=>"DeleteLogo",
                              "id" =>$item->get('site_id')
                          );
         }    
      } 
      catch (mfException $e) {
           $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

