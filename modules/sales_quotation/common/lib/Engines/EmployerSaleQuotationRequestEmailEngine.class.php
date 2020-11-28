<?php


class EmployerSaleQuotationRequestEmailEngine extends mfEmailEngineCore {
    
    protected $quotation=null,$settings=null;
        
    function __construct(EmployerQuotationRequest $quotation_request,$options=array()) {
       $this->quotation_request=$quotation_request;
       parent::__construct($options);
       $this->settings=new SaleQuotationSettings();
        $this->debug();               
    }
    
    function getQuotationRequest()
    {
        return $this->quotation_request;
    }
     
    function getSettings()
    {
        return $this->settings;
    }
    
    
     function sendEmployeeRequest()
    {                 
         try 
         {                        
           $model_i18n= $this->getSettings()->getEmployeeRequestEmailModel()->getI18n();            
            $this->getMailer()->sendMail('sales_quotation','emailEmployeeRequest',$this->getCompany()->getEmailWithName(), 
                        $this->getQuotationRequest()->getEmployeeUser()->get('email'), 
                         $model_i18n->get('subject',__('Graphex - New request')),
                        array('quotation_request'=>$this->getQuotationRequest(),                               
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $this->getSettings()->getAdminRecipients()->toArray() // bcc
                    );    
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this; 
    } 
    
    function sendEmployerRequest()
    {                 
         try 
         {                        
           $model_i18n= $this->getSettings()->getEmployerRequestEmailModel()->getI18n();            
            $this->getMailer()->sendMail('sales_quotation','emailEmployerRequest',$this->getCompany()->getEmailWithName(), 
                        $this->getQuotationRequest()->getEmployerUser()->get('email'), 
                         $model_i18n->get('subject',__('Graphex - You have a new offer')),
                        array('quotation_request'=>$this->getQuotationRequest(),                               
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $this->getSettings()->getAdminRecipients()->toArray() // bcc
                    );    
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this; 
    } 
    
   
      function sendSpoolerEmployeeRevival()
    {                 
        try 
         {                                
            $model_i18n= $this->getSettings()->getEmployeeRequestRevivalEmailModel()->getI18n();                                 
            $email_spooler=new EmailerSpooler();
            
            $message =$this->getAction()->getComponent('/sales_quotation/emailEmployeeRequestRevival', array('COMMENT'=>false,
                                                                                        'company'=>$this->getCompany(),
                                                                                        'quotation_request'=>$this->getQuotationRequest(),                  
                                                                                        'model_i18n'=>$model_i18n))->getContent();            
            if ($this->getMailer()->isDebug()) echo $message;            
            $email_spooler->add(array(
                            'to'=>$this->getQuotationRequest()->getEmployeeUser()->get('email'),                                               
                            'from'=>$this->getCompany()->get('email'),
                            'bcc'=>(string)$this->getSettings()->getAdminRecipients()->implode(),
                            'body'=>$message,
                            'subject'=>$model_i18n->get('subject',__('Graphex - Request revival')),
                            ));
            self::getSpooler()->push($email_spooler);           
        }
        catch (SmartyCompilerException $e)
        {         
            throw new mfException(__("Error Syntax in model."));              
        }  
        catch (mfException $e) {
           throw new mfException(__('Error occurs during email sending. %s',$e->getMessage()));
        }                       
        return $this; 
    }  
    
    
      function sendSpoolerEmployerRevival()
    {                 
        try 
         {                                
            $model_i18n= $this->getSettings()->getEmployerRequestRevivalEmailModel()->getI18n();                                 
            $email_spooler=new EmailerSpooler();
            
            $message =$this->getAction()->getComponent('/sales_quotation/emailEmployerRequestRevival', array('COMMENT'=>false,
                                                                                        'company'=>$this->getCompany(),
                                                                                        'quotation_request'=>$this->getQuotationRequest(),                  
                                                                                        'model_i18n'=>$model_i18n))->getContent();            
            if ($this->getMailer()->isDebug()) echo $message;            
            $email_spooler->add(array(
                            'to'=>$this->getQuotationRequest()->getEmployerUser()->get('email'),                                               
                            'from'=>$this->getCompany()->get('email'),
                            'bcc'=>(string)$this->getSettings()->getAdminRecipients()->implode(),
                            'body'=>$message,
                            'subject'=>$model_i18n->get('subject',__('Graphex - Request revival')),
                            ));
            self::getSpooler()->push($email_spooler);           
        }
        catch (SmartyCompilerException $e)
        {         
            throw new mfException(__("Error Syntax in model."));              
        }  
        catch (mfException $e) {
           throw new mfException(__('Error occurs during email sending. %s',$e->getMessage()));
        }                       
        return $this; 
    }  
    
    
     function sendEmployeeRevival()
    {      
        try 
         {                        
           $model_i18n= $this->getSettings()->getEmployeeRequestRevivalEmailModel()->getI18n();            
            $this->getMailer()->sendMail('sales_quotation','emailEmployeeRequestRevival',$this->getCompany()->getEmailWithName(), 
                        $this->getQuotationRequest()->getEmployeeUser()->get('email'), 
                         $model_i18n->get('subject',__('Graphex - Request revival')),
                        array('quotation_request'=>$this->getQuotationRequest(),                               
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $this->getSettings()->getAdminRecipients()->toArray() // bcc
                    );    
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }                        
        return $this; 
    }  
    
    
      function sendEmployerRevival()
    {                 
        try 
         {                        
           $model_i18n= $this->getSettings()->getEmployerRequestRevivalEmailModel()->getI18n();            
            $this->getMailer()->sendMail('sales_quotation','emailEmployerRequestRevival',$this->getCompany()->getEmailWithName(), 
                        $this->getQuotationRequest()->getEmployerUser()->get('email'), 
                         $model_i18n->get('subject',__('Graphex - Request revival')),
                        array('quotation_request'=>$this->getQuotationRequest(),                               
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $this->getSettings()->getAdminRecipients()->toArray() // bcc
                    );    
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }                        
        return $this;               
    }  
}

