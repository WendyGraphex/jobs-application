<?php

require_once __DIR__."/../locales/Forms/UploadIconCategoryForm.class.php";


class partners_ajaxUploadIconCategoryAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {
        $category=new PartnerWorkCategory($request->getPostParameter('PartnerWorkCategory'));
        if ($category->isNotLoaded())
            throw new mfException(__('Category is invalid.'));
        $form=new UploadIconCategoryForm($request->getPostParameter('UploadIconCategory'));
        $form->bind($request->getPostParameter('UploadIconCategory'),$request->getFiles('UploadIconCategory'));
        if (!$form->isValid())
            throw new mfException(__("Form is invalid."));
        $category->setIcon($form->getFile());
        $category->save();    
        $response = array("action"=>"UploadIconCategory",   
                          "url"=>$category->getIcon()->getMedium()->getUrl(),
                          "id" =>$category->get('id'));            
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}



