<?php


class employees_work_ajaxDeleteRequestsAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                    
        try 
        {                       
         $item= new EmployeeWork($request->getPostParameter('EmployeeWork'));
            if ($item->isNotLoaded()) 
                throw new mfException(__('Work is invalid.'));
          
            $item->getRequests()->remove();
          
            $response=array('action'=>'DeleteRequests',           
                            'info'=>__("Requests have been deleted"),
                            'data'=>array( 
                                    'total_unpaid_with_tax'=>(string)$item->getFormatter()->getTotalUnPaidWithTax()->getAmount(),
                                    'total_required_with_tax'=>(string)$item->getFormatter()->getTotalRequiredWithTax()->getAmount(),
                                    'number_of_payments'=>"",//(string)$item->getFormatter()->getNumberOfPayments()->getText(),    
                                    'number_of_days'=>(string)$item->getFormatter()->getNumberOfDays()->getText()
                            ),
                            'id'=>$item->get('id'));               
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;        
    }

}
