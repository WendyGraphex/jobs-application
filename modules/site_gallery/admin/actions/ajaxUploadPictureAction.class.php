<?php

require_once __DIR__."/../locales/Forms/SitePictureUploadForm.class.php";


class site_gallery_ajaxUploadPictureAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {       
      $messages = mfMessages::getInstance();   
      try 
      {         
        $form=new SitePictureUploadForm($request->getPostParameter('UploadPicture'));
        $form->bind($request->getPostParameter('UploadPicture'),$request->getFiles('UploadPicture'));
        if ($form->isValid())
        {
             
            $this->item=new SitePicture($form->getPicture());           
            $this->item->create($form->getLanguage());
            
            return ;
        } 
        $response['errors']=$form->getErrorSchema()->getErrorsMessage(); 
      } 
      catch (mfException $ex) 
      {
         $response=$ex->getMessage();
      }      
      $this->getController()->setRenderMode(mfView::RENDER_JSON);             
      return $response; 
    }

}



