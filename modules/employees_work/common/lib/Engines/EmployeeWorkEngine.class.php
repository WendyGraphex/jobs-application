<?php


class EmployeeWorkEngine {
    
    protected $work=null,$settings=null,$today=null;
        
    function __construct(EmployeeWork  $work) {
       $this->work=$work; 
       $this->today=new Day();
    }
    
    function getWork()
    {
        return $this->work;
    }
       
    function getSettings()
    {
        return $this->settings=$this->settings===null?new EmployeeWorkSettings():$this->settings;
    }
    
    function getToday()
    {
       return $this->today; 
    }    

    function setToday(Day $today)    
    {
        $this->today=$today;
        return $this;
    }
            
    function getNumberOfPayments()
    {
        if ($this->number_payments===null)
        {          
            if ($this->getWork()->getNumberOfHours())
                $this->number_payments=intval(ceil($this->getWork()->getNumberOfHours() / (24 * 7)));
            else
              $this->number_payments=1 ; 
        }
        return $this->number_payments; 
    }
    
    function getAmount()
    {
       if ($this->amount===null)
       {                    
           if ($this->getNumberOfPayments()==1)
           {
               $this->amount=$this->getWork()->getTotalPriceWithTax(); 
           }    
           else
           {
           /*  echo "Total=".$this->getWork()->getTotalPriceWithTax()."<br/>";
               echo "Total required=".$this->getWork()->getTotalRequiredWithTax()."<br/>";
               echo "Total amount=".($this->getWork()->getTotalPriceWithTax() - $this->getWork()->getTotalRequiredWithTax())."<br/>";
               echo "Total necessary payment=".$this->getNumberOfPayments()."<br/>";
               echo "Total payment=".$this->getWork()->getNumberOfPayments()."<br/>";*/           
               $this->amount=($this->getWork()->getTotalPriceWithTax() - $this->getWork()->getTotalRequiredWithTax()) / ($this->getNumberOfPayments() - $this->getWork()->getNumberOfPayments() ) ;        
           }    
          // $this->amount=($this->getWork()->getTotalPriceWithTax() - $this->getWork()->getTotalRequiredWithTax()) / ($this->getNumberOfPayments() == 1?1:$this->getNumberOfPayments() -1);           
       }
       return $this->amount; 
    }
    
    /*
     * employer_user_id =9
     * employee_user_id = 17
     * start_at = 2020-07-02
     * end_at = 2020-07-31
     * number_of_works = 696
     * quotation_id=22
     */
    
     function process()
    {           
        if ($this->getWork()->getState()->isClose()) 
            return $this;
        if ($this->getWork()->isCompleted())
            return $this;        
        $this->generate();                                           
        $this->getWork()->save();
        return $this;
    }
    
    
    function isDebug()
    {
        return false; //true; //
    }
    
    
   function generate()
   {
      //    echo "Number_of_payments_to_create=".$this->getNumberOfPayments()."<br/>";     
      //  echo "Amount=".$this->getAmount()."<br/>";     
      //  echo "Create=".($this->getNumberOfPayments() - $this->getWork()->getNumberOfPayments())."<br/>";
     /*  return $this;  */
       
      // echo "Number_of_payments_to_create=".($this->getNumberOfPayments() - $this->getWork()->getNumberOfPayments() - 1)."<br/>";
      // return $this;
        // get number of payments to create - number of week = 7 days               
        $payments=new EmployeeWorkPaymentRequestCollection();    
        
        if ($this->isDebug()) echo "Number of payments =".$this->getNumberOfPayments()."<br/>";
        // First
        if ($this->getWork()->getNumberOfPayments() ==0)
        {    
            if (!$this->getWork()->hasStartAt())            
               $this->getWork()->set('start_at',date("Y-m-d H:i:s"));             
            $start_at=$this->getWork()->getStartAt();
            if ($start_at->getDayInWeek() > 0 && $start_at->getDayInWeek() <= $this->getSettings()->getPaymentShift())                    
                $day=$start_at->getFirstDayOfWeek();       
            else                    
               $day=$start_at->getFirstDayOfWeek()->getNextWeekDay();  
            
            $day = $day->getDayAdd($this->getSettings()->getPaymentDay()-1);            
            // first payment
             $item=new EmployeeWorkPaymentRequest();
             $item->add($this->getWork()->toArrayForPayment());
             $item->set('iteration',1);          
             $item->set('total_price_with_tax',round($this->getAmount(),2));
             $item->set('date',$day->getDate());
             $item->set('requested_at',$day->getDaySub(1)->getDate()." ".$this->getSettings()->getPaymentRequestHour().":00:00");
             $payments[]=$item;
             if ($this->isDebug()) echo "First payment =".$this->getAmount()."<br/>";
        }          
        $total_price_with_tax=$this->getAmount();                  
        if ($this->getWork()->hasEndAt())
        {
            if ($this->getWork()->getStartAt()->getDate() != $this->getWork()->getEndAt()->getDate())
            {              
               //  echo "0";
                 if ($this->getWork()->getNumberOfPayments() ==0 )
                   $number_of_payments_to_create= $this->getNumberOfPayments() - $this->getWork()->getNumberOfPayments() -1 ;
                 else
                    $number_of_payments_to_create= $this->getNumberOfPayments() - $this->getWork()->getNumberOfPayments();
               
                //if ($this->isDebug()) echo "Number of payments to create=".$number_of_payments_to_create."<br/>";
                // end date modified - recupere le dernier paiement           
                if ($number_of_payments_to_create > 2)
                {    
                 //  echo "1";
                   if (!$this->getWork()->getNumberOfPayments() == 0)
                   {
                        $day=$this->getWork()->getLastPayment()->getDate();

                   } 
                   for ($i=1; $i < $number_of_payments_to_create;$i++)
                   {               
                      $item=new EmployeeWorkPaymentRequest();
                      $item->add($this->getWork()->toArrayForPayment());
                      $item->set('date',$day->getDayAdd($i * 7)->getDate());
                      $item->set('requested_at',$day->getDayAdd($i * 7)->getDaySub(1)->getDate()." ".$this->getSettings()->getPaymentRequestHour().":00:00");
                      $item->set('iteration',$i+1);                   
                      $item->set('total_price_with_tax',round($this->getAmount(),2));
                      $payments[]=$item;                       
                      $total_price_with_tax+=$this->getAmount();                      
                   }
                   $this->getWork()->set('number_of_payments',$number_of_payments_to_create);
                }  
                 //if ($this->isDebug()) echo "Total payment =".$total_price_with_tax."<br/>";
                // Last
                 if ($number_of_payments_to_create > 0)
                {                                  
                      $last_amount = round($total_price_with_tax - round($this->getAmount(),2) * ($number_of_payments_to_create -1),2);                     
                      $item=new EmployeeWorkPaymentRequest();
                      $item->add($this->getWork()->toArrayForPayment());
                      $item->set('date',$this->getWork()->getEndAt()->getDate());
                      $item->set('requested_at',$this->getWork()->getEndAt()->getDaySub(1)->getDate()." ".$this->getSettings()->getPaymentRequestHour().":00:00");
                      $item->set('iteration',$number_of_payments_to_create);
                      $item->set('total_price_with_tax',round($last_amount,2));                     
                      $payments[]=$item; 
                      $this->getWork()->set('number_of_payments',$number_of_payments_to_create);                  
                }  
                if ($number_of_payments_to_create == 0)
                {
                  
                    $day=$this->getWork()->getLastPayment()->getDate();   
                    $item=new EmployeeWorkPaymentRequest();
                    $item->add($this->getWork()->toArrayForPayment());
                    $item->set('date',$day->getDayAdd(7)->getDate());
                    $item->set('requested_at',$day->getDayAdd(7)->getDaySub(1)->getDate()." ".$this->getSettings()->getPaymentRequestHour().":00:00");
                    $item->set('iteration',$this->getWork()->getNumberOfPayments()+1);
                    $item->set('total_price_with_tax',round($this->getWork()->getTotalPriceWithTax() - $this->getWork()->getTotalRequiredWithTax(),2));                  
                    $payments[]=$item; 
                    $this->getWork()->set('number_of_payments',$this->getWork()->getNumberOfPayments() + 1);                          
                }   
                
                 
                //if ($this->isDebug()) echo "Total payment =".$total_price_with_tax."<br/>";
            }
            else
            {
               // echo "4";
                $this->getWork()->set('number_of_payments',1);
            }    
        }
        elseif ($this->getWork()->hasLastPayment())
        {
            //var_dump($this->getWork()->get('id'),(string)$this->getWork()->getLastPayment()->getDate(),(string)$this->getToday()->getDate());
             if ((string)$this->getWork()->getLastPayment()->getDate() < (string)$this->getToday()->getDate())
             {
                 //echo "NO";
                 // nothing to do
                 return $this;
             }    
                $day=$this->getWork()->getLastPayment()->getDate();            
                $item=new EmployeeWorkPaymentRequest();
                $item->add($this->getWork()->toArrayForPayment());
                $item->set('date',$day->getDayAdd(7)->getDate());
                $item->set('requested_at',$day->getDayAdd(7)->getDaySub(1)->getDate()." ".$this->getSettings()->getPaymentRequestHour().":00:00");
                $item->set('iteration',$this->getWork()->getNumberOfPayments()+1);             
                $item->set('total_price_with_tax',round($this->getAmount(),2));
                $payments[]=$item;             
                $this->getWork()->set('number_of_payments',$this->getWork()->getNumberOfPayments() + 1);   
              //  $this->getWork()->set('number_of_hours',24 * $this->getWork()->getFormatter()->getStartAt()->diffInDay(new Day())); 
        }
        else
        {
           // $this->getWork()->set('number_of_hours',24 * $this->getWork()->getFormatter()->getStartAt()->diffInDay(new Day())); 
            $this->getWork()->set('number_of_payments',1);        
        }   
        
     
         $payments->create();  
         // remove unused payment        
         $this->getWork()->updateTotalRequired();      
         $this->getWork()->set('state','INPROGRESS'); 
         return $this;
   }
   
   
   
   function close()
   {
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('work_id'=>$this->getWork()->get('id')))
           ->setQuery("DELETE FROM ".EmployeeWorkPaymentRequest::getTable().
                     " WHERE work_id='{work_id}' AND status IN('ACTIVE','PLANNED')".                    
                     ";")
           ->makeSqlQuery(); 
        
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('work_id'=>$this->getWork()->get('id')))
           ->setQuery("SELECT count(id) FROM ".EmployeeWorkPaymentRequest::getTable().
                     " WHERE work_id='{work_id}' AND status !='DELETED'".                 
                     ";")
           ->makeSqlQuery(); 
        $row=$db->fetchRow();
        $this->getWork()->updateTotalRequired();
        $this->getWork()->set('number_of_payments',intval($row[0]));
               
        $item=new EmployeeWorkPaymentRequest();        
        $item->add($this->getWork()->toArrayForPayment());
        $item->set('date',date('Y-m-d'));
        $item->set('requested_at',date('Y-m-d'));
        $item->set('iteration',$this->getWork()->getNumberOfPayments()+1);             
        $item->set('total_price_with_tax',$this->getWork()->getTotalPriceWithTax() - $this->getWork()->getTotalRequiredWithTax());
        $item->set('accepted_at',date('Y-m-d'));
        $item->set('status', EmployeeWorkPaymentRequestStatus::ACCEPTED);
        $item->save();
        $item->setReference();        
        $item->save();
        
        $this->getWork()->add(array(
            'total_required_with_tax'=> $this->getWork()->getTotalPriceWithTax(),
            'is_completed'=>'YES',
            'is_accepted'=>'YES',
            'state'=>'CLOSE',
            'number_of_payments'=>$this->getWork()->getNumberOfPayments()+1))->save();                
       return $this;
   }
     
   
   function hasToClose()
   {
       // all accepted
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('work_id'=>$this->getWork()->get('id')))
           ->setQuery("SELECT SUM(total_price_with_tax) as total_price_with_tax FROM ".EmployeeWorkPaymentRequest::getTable().
                     " WHERE work_id='{work_id}' AND status IN('ACCEPTED')".                    
                     ";")
           ->makeSqlQuery(); 
        $row=$db->fetchArray();       
        return floatval($row['total_price_with_tax']) >= $this->getWork()->getTotalPriceWithTax() ;       
   }
   
   
   function finish()
   {
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('work_id'=>$this->getWork()->get('id')))
           ->setQuery("DELETE FROM ".EmployeeWorkPaymentRequest::getTable().
                     " WHERE work_id='{work_id}' AND status IN('ACTIVE','PLANNED')".                    
                     ";")
           ->makeSqlQuery(); 
        
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('work_id'=>$this->getWork()->get('id')))
           ->setQuery("SELECT count(id) FROM ".EmployeeWorkPaymentRequest::getTable().
                     " WHERE work_id='{work_id}' AND status !='DELETED'".                 
                     ";")
           ->makeSqlQuery(); 
        $row=$db->fetchRow();
        $this->getWork()->updateTotalRequired();
        $this->getWork()->set('number_of_payments',intval($row[0]));
               
        $item=new EmployeeWorkPaymentRequest();        
        $item->add($this->getWork()->toArrayForPayment());
        $item->set('date',date('Y-m-d'));
        $item->set('requested_at',date('Y-m-d'));
        $item->set('iteration',$this->getWork()->getNumberOfPayments()+1);             
        $item->set('total_price_with_tax',$this->getWork()->getTotalPriceWithTax() - $this->getWork()->getTotalRequiredWithTax());       
        $item->set('status', EmployeeWorkPaymentRequestStatus::ACTIVE);
        $item->save();
        $item->setReference();        
        $item->save();
        
        $this->getWork()->add(array(
            'total_required_with_tax'=> $this->getWork()->getTotalPriceWithTax(),
            'is_completed'=>'YES',
            'is_accepted'=>'YES',
            'state'=>'CLOSE',
            'number_of_payments'=>$this->getWork()->getNumberOfPayments()+1))->save();                                              
       return $this;
   }
}

