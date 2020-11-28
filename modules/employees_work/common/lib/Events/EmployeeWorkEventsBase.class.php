<?php

class EmployeeWorkEventsBase {
     
  
    static function setCreateWorks(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employees_work'))
             return ;       
         $payment = $event->getSubject();    //PaymentEmployerUser    
        if (!$payment->isAccepted()) 
            return ;     
 
         $collection = new EmployeeWorkCollection();
        foreach ($payment->getOrder()->getQuotations()->getAll() as $quotation)
        {
           $item= new EmployeeWork();
           $item->add($quotation->toArray(array('employer_user_id','employee_user_id','project_id')));
           $item->add(array(                                
               'end_at'=>$quotation->get('out_at'),
               'number_of_hours'=>$quotation->get('number_of_hours'),
               'total_unpaid_with_tax'=>$quotation->get('price'),
               'total_price_with_tax'=>$quotation->get('price'),          
               'quotation_id'=>$quotation, 
               'order_id'=>$payment->getOrder()
           ));           
           $item->set('start_at',$quotation->hasInAt()?$quotation->get('in_at'):date("Y-m-d H:i:s"));
           if ($quotation->hasProject())
           {
               $item->set('name',$quotation->getProject()->get('name')); // i18n?
           }    
           elseif ($quotation->hasEmployerAdvert())
           {
                $item->set('name',$quotation->getEmployerAdvert()->getI18n()->get('title'));  
                $item->set('description',$quotation->getEmployerAdvert()->getI18n()->get('short_description'));  
           }        
           $collection[]=$item;
        } 
        $collection->save();
        foreach ($collection as $item)
           $item->setReference();
        $collection->save(); 
        
        mfContext::getInstance()->getEventManager()->notify(new mfEvent($collection,'employee.works.created'));
    }
    
    
    static function setProjectFinished(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employees_work'))
             return ;       
         $project = $event->getSubject();    //Project    
        
         $payment_request = $project->getWork()->getLastPayment();
         if (!$payment_request)
             return ;
         $engine = new EmployeeWorkPaymentRequestEmailEngine($payment_request);
         $engine->sendRequest();
         
    }
}

