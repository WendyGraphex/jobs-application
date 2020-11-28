<?php


class partners_ajaxDeleteIconCategoryAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $category= new PartnerWorkCategory(array('id'=>$validator->isValid($request->getPostParameter('Category'))));
          if ($category->isNotLoaded())
             throw new mfException(__('Category is invalid.'));
          $category->getPicture()->remove(); 
          $response = array("action"=>"DeleteIconCategory","id" =>$category->get('id'));
           
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
