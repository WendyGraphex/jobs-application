<?php

class cms_pages_ajaxDeletePageAction extends mfAction {
    
 
    
    function execute(mfWebRequest $request) {           
      $messages = mfMessages::getInstance();
      try 
      {         
         $page=new CmsPage($request->getPostParameter('Page'));    
         $page->delete(); 
         $response = array("action"=>"DeletePage",
                           "id" =>$page->get('id')
                          );
      } 
      catch (mfException $e) {
           $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

