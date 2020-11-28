<?php


class employees_ajaxDeleteSkillAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployeeSkill'));          
          $item= new EmployeeSkill($id);           
          $item->delete();              
          $response = array("action"=>"DeleteSkill","id" =>$id,"info"=>__("Employee Skill has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

