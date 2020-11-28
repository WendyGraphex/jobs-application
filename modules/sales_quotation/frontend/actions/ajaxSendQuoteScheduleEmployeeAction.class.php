<?php


// www.project55.net/module/quotations/admin/SendQuoteScheduleEmployee

require_once __DIR__."/../locales/Forms/SendQuoteScheduleEmployeeForm.class.php";
  
class sales_quotation_ajaxSendQuoteScheduleEmployeeAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
            $this->forwardTo401Action ();        
        $quotation=new SaleEmployeeQuotation($request->getPostParameter('SaleEmployeeQuotation'),$this->getUser()->getGuardUser());        
        if ($quotation->isNotLoaded())
            $this->forwardTo401Action();
        $response=array('action'=>'SendQuoteScheduleEmployee');
        $form=new SendQuoteScheduleEmployeeForm();       
        $form->bind($request->getPostParameter('SaleEmployeeQuotationSchedule'));
        if ($form->isValid())
        {            
            $quotation->setDates($form->getInAt(),$form->getOutAt());   
            $quotation->save();
            $response['in_at']=$quotation->getInAt()->getText();
           // $response['out_at']=$quotation->getOutAt()->getText();
            $response['number_of_days']=(string)$quotation->getFormatter()->getNumberOfDays();
            
              $engine= new EmployeeSaleQuotationEmailEngine($this->quotation);
             $engine->sendSchedule();
            return $response;
        }           
        $response['errors']=$form->getErrorSchema()->getCodes();                
        return $response;      
       
    }
    
   
}



