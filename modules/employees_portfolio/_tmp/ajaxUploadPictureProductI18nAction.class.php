<?php

require_once __DIR__."/../locales/Forms/UploadPictureProductForm.class.php";


class products_ajaxUploadPictureProductI18nAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {
        $this->product_i18n=new ProductI18n($request->getPostParameter('ProductI18n'));
        if ($this->product_i18n->getProduct()->isNotLoaded())
            throw new mfException(__('Product is invalid.'));
        $form=new UploadPictureProductForm($request->getPostParameter('UploadPictureProduct'));
        $form->bind($request->getPostParameter('UploadPictureProduct'),$request->getFiles('UploadPictureProduct'));
        if ($form->isValid())
        {
          
            $this->picture=new ProductPicture();
            $this->picture->create($this->product_i18n,$form->getFile());
             
           
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



