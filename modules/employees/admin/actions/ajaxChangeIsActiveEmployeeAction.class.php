<?php

class employees_ajaxChangeIsActiveEmployeeAction extends mfAction
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
        $item->set('is_active',$form->getToggle())->save();                
        $response = array("action"=>"ChangeIsActiveEmployee","id"=>$item->get('id'),"value" =>$item->get('is_active'));                                              
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

