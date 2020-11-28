<?php



class sales_billing_pdfAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {    
       
       try
       {           
           $this->model=$this->getParameter('model');    
           SaleBillingModelParameters::loadParameters($this->getParameter('billing'),$this);  
           if ($request->getGetParameter('debug')=='var')
           {
               echo $this->getParameter('billing')->get('id');
               echo "<pre>"; var_dump(array(
                   'company'=>$this->company,                   
                   'today'=>$this->today,  
                   'billing'=>$this->billing,
                   
               ));
               die();
           }  
       }
       catch (mfException $e)
       {
           echo __("Error=").$e->getMessage();
           die();
       }
    }
}

