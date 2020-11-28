<?php


class employees_ajaxDeleteEmployeeForGalleryI18nAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $employee= new EmployeeGalleryI18n(array('id'=>$validator->isValid($request->getPostParameter('EmployeeForGalleryI18n'))));
          if ($employee->isLoaded())
          {    
            $employee->set('status','DELETE');
            $employee->delete();
            $response = array("action"=>"DeleteEmployeeForGalleryI18n","id" =>$id,"info"=>__("Employee has been deleted."));
           // $response = array("action"=>"DeleteEmployeeForGalleryI18n","id" =>$employee->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
