<?php

class EmployeeWorkPaymentRequestCollection extends mfObjectCollection3 {
 
    
    function create()
    {
        $this->save();
        foreach ($this as $payment)        
             $payment->setReference();         
        $this->save();
        return $this;
    }
    
    
    function getTotalPriceWithTax()
    {
        if ($this->total_price_with_tax===null)
        {
            $this->total_price_with_tax=0;
            foreach ($this as $item)
               $this->total_price_with_tax+=$item->getTotalPriceWithTax();
        }    
        return $this->total_price_with_tax;
    }
    
    
    function todo()
    {
        foreach ($this as $item)
           $item->set('status',EmployeeWorkPaymentRequestStatus::INPROGRESS);
        $this->save();
        return $this;
    }
    
    function paid()
    {
         foreach ($this as $item)
           $item->set('status',EmployeeWorkPaymentRequestStatus::PAID);
        $this->save();
        return $this;
    }
    
    function inprogress()
    {
        foreach ($this as $item)
           $item->set('status',EmployeeWorkPaymentRequestStatus::INPROGRESS);
        $this->save();
        return $this; 
    }
    
    function setWork(EmployeeWork $work)
    {
        $this->work=$work;
        return $this;
    }
    
    function getWork()
    {
        return $this->work;
    }
    
    function remove()
    {
        if (!$this->getWork())
            return $this;
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array('work_id'=>$this->getWork()->get('id')))
           ->setQuery("DELETE FROM ".EmployeeWorkPaymentRequest::getTable().
                     " WHERE work_id='{work_id}' AND status !='PAID'".                     
                     ";")
           ->makeSqlQuery(); 
         $this->getWork()->process();         
         $this->getWork()->add(array(
             'total_required_without_tax'=>0.0,
             'total_required_with_tax'=>0.0,
             'total_paid_without_tax'=>0.0,
             'total_paid_with_tax'=>0.0,
             'total_unpaid_without_tax'=>$this->getWork()->get('total_price_without_tax'),
             'total_unpaid_with_tax'=>$this->getWork()->get('total_price_with_tax'),
             'number_of_payments'=>0,
             'iteration'=>0,
             'state'=>null))->save();
        return $this;
    }
    
    
}

