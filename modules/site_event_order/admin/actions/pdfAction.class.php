<?php



class site_event_order_pdfAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {    
       
       try
       {           
           $this->model=$this->getParameter('model');                   
           SaleOrderModelParameters::loadParameters($this->getParameter('order'),$this);  
           if ($request->getGetParameter('debug')=='var')
           {
               echo "<pre>"; var_dump(array(
                   'company'=>$this->company,                   
                   'today'=>$this->today,    
                   'order'=>$this->order,
                
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

