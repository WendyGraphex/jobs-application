<?php


class site_client_ajaxChangeIsActiveAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {        
          $form=new ChangeForm();
          $form->bind($request->getPostParameter('SiteClient'));
          if (!$form->isValid())
             throw new mfException(__("Client is invalid."));
          
          
        $item= new SiteClient($form->getValue('id'),'frontend');    
      if ($item->isNotLoaded())
              throw new mfException(__('SiteClient is invalid'));       
        $item->set('is_active',$form->getToggle())->save();                
        $response = array("action"=>"ChangeIsActive","id"=>$item->get('id'),"value" =>$item->get('is_active'));  
//          $item= new SiteClient($form->getValue('id'),'frontend');    
//          if ($item->isLoaded())
//          {  
//               $value=((string)$form['value']=='YES')?"NO":"YES"; 
//               $item->set('is_active',$value);
//               $item->save();                
//               $response = array("action"=>"ChangeIsActive","id"=>$item->get('id'),"state" =>$value);
//          }                                
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}


