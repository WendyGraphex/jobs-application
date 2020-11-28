<?php


class employees_portfolio_ajaxDeleteDocumentAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action();
      try 
      {                
           $item = new EmployeePortfolioDocument($request->getPostParameter('EmployeePortfolioDocument'),$this->getUser()->getGuardUser());
           if ($item->isNotLoaded())
                throw new mfException(__('Document is invalid.'));
            $item->delete(); 
            $response = array("action"=>"DeleteDocument",    
          //                    "number"=>$picture->getProduct()->getNumberOfPictures(),
                               "id" =>$item->get('id')
                    );
        //  }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
