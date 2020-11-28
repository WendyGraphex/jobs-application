<?php

require_once __DIR__."/../locales/Forms/SitePictureUploadForGalleryI18nForm.class.php";


class site_gallery_ajaxUploadPictureForGalleryI18nAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {       
      $messages = mfMessages::getInstance();   
      try 
      {         
        $this->gallery_i18n=new SiteGalleryI18n($request->getPostParameter('SiteGalleryI18n'));       
        if ($this->gallery_i18n->isNotLoaded())
            throw new mfException(__('Gallery is invalid'));
        $form=new SitePictureUploadForGalleryI18nForm($request->getPostParameter('UploadPicture'));
        $form->bind($request->getPostParameter('UploadPicture'),$request->getFiles('UploadPicture'));
        if ($form->isValid())
        {             
           $item=new SitePicture($form->getPicture());           
           $item->create($this->gallery_i18n->get('lang'));
            
           $this->picture_gallery=new SitePictureGallery();
           $this->picture_gallery->add(array('picture_id'=>$item,'gallery_id'=>$this->gallery_i18n->get('gallery_id')))->save();
           
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



