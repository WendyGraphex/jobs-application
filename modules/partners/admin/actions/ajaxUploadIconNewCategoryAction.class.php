<?php

require_once __DIR__."/../locales/Forms/UploadIconCategoryNewForm.class.php";
 
class partners_ajaxUploadIconNewCategoryAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {          
          $form = new UploadIconCategoryNewForm();
          $form->bind($request->getPostParameter('UploadIconCategory'),$request->getFiles('UploadIconCategory'));
          if (!$form->isValid()) 
          {
           //  var_dump($form->getErrorSchema()->getErrorsMessage())    ;
             throw new mfException(__('Category is invalid.'));
          } 
          
        $form->getCategory()->setIcon($form->getFile());
        $form->getCategory()->upload();      
        $response = array("action"=>"UploadIconNewCategory",   
                          "url"=>$form->getCategory()->getIcon()->getMedium()->getUrl(),
                          "id" =>$form->getCategory()->get('id')
                     );            
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}


