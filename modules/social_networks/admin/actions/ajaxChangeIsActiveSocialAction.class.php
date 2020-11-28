<?php

class social_networks_ajaxChangeIsActiveSocialAction extends mfAction {
    
   
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {         
          $form=new  ChangeForm();
          $form->bind($request->getPostParameter('SocialNetwork'));
          if (!$form->isValid())
             throw new mfException(__('Form is invalid.'));
        $item= new SocialNetwork($form->getValue('id'));    
        if ($item->isNotLoaded())
            throw new mfException(__('Social network is invalid'));
        $item->set('is_active',$form->getToggle());
        $item->save();              
        $response = array("action"=>"ChangeIsActiveSocial","id"=>$item->get('id'),"value" =>$item->get('is_active'));                               
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

