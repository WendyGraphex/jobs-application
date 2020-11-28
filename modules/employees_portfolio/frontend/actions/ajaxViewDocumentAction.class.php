<?php 

require_once __DIR__."/../locales/Forms/EmployeePortfolioDocumentI18nMultipleForm.class.php";

class employees_portfolio_ajaxViewDocumentAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();   
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
              $this->forwardTo401Action();
        $this->document = new EmployeePortfolioDocument($request->getPostParameter('EmployeePortfolioDocument'),$this->getUser()->getGuardUser());
        if ($this->document->isNotLoaded())
              throw new mfException(__('Document is invalid.'));        
        $this->form = new EmployeePortfolioDocumentI18nMultipleForm($this->document);
    }
    
   
}


