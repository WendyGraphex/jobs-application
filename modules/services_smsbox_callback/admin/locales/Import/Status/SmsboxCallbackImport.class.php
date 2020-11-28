<?php

require_once dirname(__FILE__)."/Forms/SmsboxCallbackImportForm.class.php";
require_once dirname(__FILE__)."/Forms/SmsboxCallbackImportFileForm.class.php";

class SmsboxCallbackImport extends ImportCore {
              
    protected $number_of_sms=0,$status=null;
    
    function __construct($file,  $status) {              
        parent::__construct($file);            
        $this->import=new CsvImport($file);        
        $this->number_of_customers=0;
        $this->status=$status;
    }    
       
    
    function getStatus()
    {
        return $this->status;
    }
    
    function getNumberOfSms()
    {
        return $this->number_of_sms;
    }
            
    function execute() 
    {             
        try
        {                           
           $this->setForm(new SmsboxCallbackImportForm());  
           $this->verifyHeader();                    
           $this->initialize();          
           while ($line=$this->getImport()->fetchArray())
           {                                                                     
                $this->getForm()->setDefaults($line);                
                $this->getForm()->bind($line);                  
                if ($this->getForm()->isValid())
                {                            
                  //  $customer=$this->getForm()->getCustomer();
                   /* if ($customer->isLoaded())
                    {    
                       $customer->set('state_id',$this->getStatus())->save();
                       $this->number_of_customers++;
                    }*/
                }   
                else 
                {             
                    // var_dump($this->getForm()->getErrors());
                     throw new ImportException(ImportException::ERROR_IMPORT_FIELDS_ERROR,array('errors'=>$this->getForm()->getErrors()->implode(','),'line'=>$this->current_line));                    
                } 
                $this->current_line++;   
           }             
        }
        catch (ImportException $e)
        {           
            throw new mfException($e->getI18nMessage());
        }        
        $this->close();
    }
       
    
    
}



