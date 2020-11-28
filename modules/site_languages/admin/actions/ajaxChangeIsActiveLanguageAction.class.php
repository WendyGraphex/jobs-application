<?php


class site_languages_ajaxChangeIsActiveLanguageAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {        
          $form=new ChangeForm();
          $form->bind($request->getPostParameter('SiteLanguage'));
          if (!$form->isValid())
             throw new mfException(__("Language is invalid."));
          $item= new Language($form->getValue('id'),'frontend');    
          if ($item->isLoaded())
          {  
               $value=((string)$form['value']=='YES')?"NO":"YES"; 
               $item->set('is_active',$value);
               $item->save();                
               $response = array("action"=>"ChangeIsActiveLanguage","id"=>$item->get('id'),"value" =>$value);
          }                                
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}


