<?php

 
class site_gallery_ajaxChangeIsActivePictureGalleryAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {        
          $form=new ChangeForm();
          $form->bind($request->getPostParameter('SitePictureGallery'));
          if (!$form->isValid())                                
             throw new mfException(__('Form is invalid.'));                  
            $item= new SitePictureGallery($form->getValue('id'));    
              if ($item->isNotLoaded())
              throw new mfException(__('Picture is invalid'));       
            $item->set('is_active',$form->getToggle())->save();                
            $response = array("action"=>"ChangeIsActivePictureGallery","id"=>$item->get('id'),"value" =>$item->get('is_active'));                                     
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

