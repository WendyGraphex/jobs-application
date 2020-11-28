<?php

class employees_ajaxChangeIsCompletedEmployeeAction extends mfAction
{

    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {        
        $form=new ChangeForm();
        $form->bind($request->getPostParameter('Employee'));
        if (!$form->isValid())
             throw new mfException(__('Form has some errors'));    
        $item= new Employee($form->getValue('id'));    
        if ($item->isNotLoaded())
              throw new mfException(__('Employee is invalid'));       
        $item->set('is_completed',$form->getToggle())->save();                
        $response = array("action"=>"ChangeIsCompletedEmployee","id"=>$item->get('id'),"value" =>$item->get('is_completed'));                                              
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

