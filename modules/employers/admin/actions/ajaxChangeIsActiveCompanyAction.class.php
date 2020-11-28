<?php

class employers_ajaxChangeIsActiveCompanyAction extends mfAction
{

    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {        
        $form=new ChangeForm();
        $form->bind($request->getPostParameter('EmployerCompany'));
        if (!$form->isValid())
             throw new mfException(__('Form has some errors'));    
        $item= new EmployerCompany($form->getValue('id'));    
        if ($item->isNotLoaded())
              throw new mfException(__('Employer is invalid'));       
        $item->set('is_active',$form->getToggle())->save();                
        $response = array("action"=>"ChangeIsActiveCompany","id"=>$item->get('id'),"value" =>$item->get('is_active'));                                              
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

