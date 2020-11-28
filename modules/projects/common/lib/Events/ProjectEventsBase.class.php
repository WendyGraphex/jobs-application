<?php

class ProjectEventsBase {
     
   
    static function setCreateProjects(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('projects'))
             return ;       
        $works = $event->getSubject();    //EmployeeWorkCollection    
        if ($works->isEmpty()) 
            return ;             
        $collection = new ProjectCollection();
        foreach ($works as $work)
        {
           $item= new Project();
           $item->add($work->getQuotation()->toArray(array('employer_user_id','employee_user_id','project_id')));
           $item->add(array(           
               'work_id'=>$work,
               'start_at'=>$work->getQuotation()->get('in_at'),
               'end_at'=>$work->getQuotation()->get('out_at'),
               'quotation_id'=>$work->getQuotation(), 
               'order_id'=>$work->get('order_id'),
           ));
           if ($work->getQuotation()->hasProject())
           {
               $item->set('name',$work->getQuotation()->getProject()->get('name')); // i18n?
           }    
           elseif ($work->getQuotation()->hasEmployerAdvert())
           {
                $item->set('name',$work->getQuotation()->getEmployerAdvert()->getI18n()->get('title'));  
                $item->set('description',$work->getQuotation()->getEmployerAdvert()->getI18n()->get('short_description'));  
           }        
           $collection[]=$item;
        } 
        $collection->save();
        foreach ($collection as $item)
        {           
           $item->setReference();
           $item->getWork()->set('project_id',$item);
        }
        $collection->save();
        // update works with projects
        $works->save();
                
    }
    
    
    static function checkIfProjectHasToBeClosed(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('projects'))
             return ;       
        $payment_request = $event->getSubject();    //EmployeeWorkPaymentRequest
         
        if (!$payment_request->getWork()->getEngine()->hasToClose())  
        {       
           return ;
        }
        $payment_request->getWork()->getProject()->close();
        $engine =  new ProjectEmailEngine($payment_request->getWork()->getProject());
        $engine->sendClosed();
    }
}

