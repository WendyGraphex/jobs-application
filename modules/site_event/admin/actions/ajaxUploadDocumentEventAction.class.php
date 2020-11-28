<?php

require_once __DIR__."/../locales/Forms/SiteEventUploadDocumentEventForm.class.php";


class site_event_ajaxUploadDocumentEventAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {         
      $messages = mfMessages::getInstance();   
      try 
      {         
        $form=new SiteEventUploadDocumentEventForm($request->getPostParameter('UploadDocumentEvent'));
        $form->bind($request->getPostParameter('UploadDocumentEvent'),$request->getFiles('UploadDocumentEvent'));
        if ($form->isValid())
        {
          
            $this->document=new SiteEventDocument($form->getEvent()->upload());
            $this->document->create($form->getFile());
            
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



