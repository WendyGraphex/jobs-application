<?php

require_once __DIR__."/../locales/Forms/EmployeeSendQuoteForm.class.php";
    
   
class sales_quotation_ajaxSendQuoteAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
            $this->forwardTo401Action ();
        $item=new EmployerQuotationProjectRequest($request->getPostParameter('EmployeeProjectRequest'),$this->getUser()->getGuardUser());     
        if ($item->isNotLoaded())
           $this->forwardTo401Action();        
        $response=array('action'=>'SendQuote');       
        $form=new EmployeeSendQuoteForm($item);
        $form->bind($request->getPostParameter('EmployeeQuote'));
        if (!$form->isValid())
        {        
           $response['errors']=$form->getErrorSchema()->getCodes();
           return $response;    
        }      
         $quotation = new SaleEmployeeQuotation(null,$this->getUser()->getGuardUser());                         
         $quotation->add($form->getValues());
         $quotation->create();
         
         $item->set('quotation_id',$quotation)->setQuotedAt()->save();
         
         $this->getEventDispather()->notify(new mfEvent($quotation, 'quotation.created'));   
         
         $engine= new EmployeeSaleQuotationEmailEngine($quotation);
         $engine->sendProposed();
         
         $response['id']=$item->get('id');
         $response['quoted_at']=(string)$item->getFormatter()->getQuotedAt()->getText();
         $response['price']=(string)$quotation->getFormatter()->getPrice()->getAmount();                   
         return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


