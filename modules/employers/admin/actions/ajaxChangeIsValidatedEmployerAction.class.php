<?php

class employers_ajaxChangeIsValidatedEmployerAction extends mfAction
{

    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {        
        $form=new ChangeForm();
        $form->bind($request->getPostParameter('Employer'));
        if (!$form->isValid())
             throw new mfException(__('Form has some errors'));    
        $item= new EmployerUser($form->getValue('id'));    
        if ($item->isNotLoaded())
              throw new mfException(__('Employer is invalid'));       
        $item->set('is_validated',$form->getToggle())->save();                
        $response = array("action"=>"ChangeIsValidatedEmployer","id"=>$item->get('id'),"value" =>$item->get('is_validated'));                                              
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

