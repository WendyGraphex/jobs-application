<?php


class employees_portfolio_ajaxPrivateDocumentAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {       
              if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();
            $item = new EmployeePortfolioDocument($request->getPostParameter('EmployeePortfolioDocument'),$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Document is invalid.'));
            $item->privated();
            
            $response=array('action'=>'PrivateDocument',                             
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


