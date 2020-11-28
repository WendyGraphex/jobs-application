<?php

class site_gallery_ajaxChangeIsActiveGalleryAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {         
          $form=new ChangeForm();
          $form->bind($request->getPostParameter('SiteGallery'));
          if (!$form->isValid())
            throw new mfException(__('Form is invalid'));              
            $item= new SiteGallery($form->getValue('id'));              
            if ($item->isNotLoaded())
              throw new mfException(__('Gallery is invalid'));              
           $item->set('is_active',$form->getToggle())->save();               
           $response = array("action"=>"ChangeIsActiveGallery","id"=>$item->get('id'),"is_active" =>$item->get('is_active'));                       
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

