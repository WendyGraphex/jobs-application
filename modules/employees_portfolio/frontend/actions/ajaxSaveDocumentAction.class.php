<?php

require_once __DIR__."/../locales/Forms/EmployeePortfolioDocumentI18nMultipleForm.class.php";

class employees_portfolio_ajaxSaveDocumentAction extends mfAction {
        
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();   
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
              $this->forwardTo401Action();                     
        try 
        {           
            $response=array('action'=>'SaveDocument');
             $document = new EmployeePortfolioDocument($request->getPostParameter('EmployeePortfolioDocument'),$this->getUser()->getGuardUser());
            if ($document->isNotLoaded())
               return array('errors'=>__('Document is invalid.'));    
            $form = new EmployeePortfolioDocumentI18nMultipleForm($document);
            $form->bind($request->getPostParameter('EmployeePortfolioDocumentI18n'));
            if (!$form->isValid())                        
                return array('errors'=>$form->getErrorSchema()->getErrorsMessage());    
            $document->updateI18ns($form->getValues());                                                            
            $response['info']=__('Titles have been saved.');
            $response['id']=$form->getDocument()->get('id');                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


