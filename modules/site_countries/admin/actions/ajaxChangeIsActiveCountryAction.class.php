<?php


class site_countries_ajaxChangeIsActiveCountryAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {        
          $form=new ChangeForm();
          $form->bind($request->getPostParameter('SiteCountry'));
          if (!$form->isValid())
             throw new mfException(__("Country is invalid."));
          $item= new SiteCountry($form->getValue('id'));    
          if ($item->isLoaded())
          {  
               $value=((string)$form['value']=='YES')?"NO":"YES"; 
               $item->set('is_active',$value);
               $item->save();                
               $response = array("action"=>"ChangeIsActiveCountry","id"=>$item->get('id'),"state" =>$value);
          }                                
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}


