<?php

class site_event_ajaxChangeIsValidatedUserAction extends mfAction
{

    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {        
        $form=new ChangeForm();
        $form->bind($request->getPostParameter('SiteEventUser'));
        if (!$form->isValid())
             throw new mfException(__('Form has some errors'));    
        $item= new SiteEventUser($form->getValue('id'));    
        if ($item->isNotLoaded())
              throw new mfException(__('User is invalid'));       
        $item->set('is_validated',$form->getToggle())->save();                
        $response = array("action"=>"ChangeIsValidatedUser","id"=>$item->get('id'),"value" =>$item->get('is_validated'));                                              
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

