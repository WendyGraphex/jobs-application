<?php

require_once __DIR__."/../locales/Forms/EmployeePortfolioDocumentUploadForm.class.php";


class employees_portfolio_ajaxUploadDocumentAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();        
      if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action();
      try 
      {       
        $form=new EmployeePortfolioDocumentUploadForm($request->getPostParameter('UploadPortfolioDocument'));
        $form->bind($request->getPostParameter('UploadPortfolioDocument'),$request->getFiles('UploadPortfolioDocument'));
        if ($form->isValid())
        {          
             $this->document=new EmployeePortfolioDocument($this->getUser()->getGuardUser());
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



