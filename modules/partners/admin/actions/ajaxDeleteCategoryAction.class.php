<?php


class partners_ajaxDeleteCategoryAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $category= new PartnerWorkCategory(array('id'=>$validator->isValid($request->getPostParameter('Category'))));
          if ($category->isLoaded())
          {    
            $category->delete();
            $response = array("action"=>"DeleteCategory","id" =>$category->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
