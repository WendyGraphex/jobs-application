<?php


class employees_ajaxDeleteEmployeeAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $employee= new Employee(array('id'=>$validator->isValid($request->getPostParameter('Employee'))));
          if ($employee->isLoaded())
          {    
            $employee->set('status','DELETE');
            $employee->delete();
            $response = array("action"=>"DeleteEmployee","id" =>$employee->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
