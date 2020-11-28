<?php


class EmployeeWorkPaymentRequestEmailEngine extends  mfEmailEngineCore {
    
    protected $payment_request=null ;   
        
    function __construct(EmployeeWorkPaymentRequest $payment_request,$options=array()) {
       $this->payment_request=$payment_request;             
       parent::__construct($options);       
        $this->debug();   
    }
    
    
    function getPaymentRequest()
    {
        return $this->payment_request;
    }
    
    function getSettings()
    {
        return $this->settings=$this->settings===null?new EmployeeWorkSettings():$this->settings;
    }
    

     function sendRequest()
    {                 
         try 
         {     
           $bcc = $this->getSettings()->getAdminRecipients()->unshift(array($this->getPaymentRequest()->getEmployerUser()->get('email')))->toArray();
           $model_i18n= $this->getSettings()->getAcceptedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employees_work','emailAcceptedRequest',
                                        $this->getCompany()->getEmailWithName(), 
                                        $this->getPaymentRequest()->getEmployeeUser()->get('email'), 
                                        $model_i18n->get('subject',__('Graphex - You have a payment request')),
                        array('payment_request'=>$this->getPaymentRequest(),                            
                            'model_i18n'=>$model_i18n,
                            'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $bcc // bcc
                    );       
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
     
     function sendRefused()
    {                 
         try 
         {   
            $bcc = $this->getSettings()->getAdminRecipients()->unshift(array($this->getPaymentRequest()->getEmployerUser()->get('email')))->toArray();
           
           $model_i18n= $this->getSettings()->getRefusedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employees_work','emailRefusedRequest',
                                    $this->getCompany()->getEmailWithName(), 
                                    $this->getPaymentRequest()->getEmployeeUser()->get('email'), 
                                    $model_i18n->get('subject',__('Graphex - Your payment has been refused')),
                        array('payment_request'=>$this->getPaymentRequest(),                            
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $bcc // bcc
                    );       
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
    
     function sendAccepted()
    {                 
        try 
        {   
            $bcc = $this->getSettings()->getAdminRecipients()->unshift(array($this->getPaymentRequest()->getEmployerUser()->get('email')))->toArray();
            $model_i18n= $this->getSettings()->getAcceptedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employees_work','emailAcceptedRequest',
                                    $this->getCompany()->getEmailWithName(), 
                                    $this->getPaymentRequest()->getEmployeeUser()->get('email'), 
                                    $model_i18n->get('subject',__('Graphex - Your payment has been accepted')),
                        array('payment_request'=>$this->getPaymentRequest(),                            
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $bcc // bcc
                    );       
        } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
   
    
    function sendAmountChange()
    {
      try 
         {                        
          //  $this->getMailer()->debug();          
             $bcc = $this->getSettings()->getAdminRecipients()->unshift(array($this->getPaymentRequest()->getEmployerUser()->get('email')))->toArray();
            $model_i18n= $this->getSettings()->getAmountChangeEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employees_work','emailAmountChangeRequest',
                                    $this->getCompany()->getEmailWithName(), 
                                    $this->getPaymentRequest()->getEmployeeUser()->get('email'), $model_i18n->get('subject',__('Graphex - The amount has been changed')),
                        array('payment_request'=>$this->getPaymentRequest(),                            
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $bcc // bcc
                    );          
             
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;  
    }
    
    
    
     function sendConfirmed()
    {                 
         try 
         {               
           $bcc = $this->getSettings()->getAdminRecipients()->unshift(array($this->getPaymentRequest()->getEmployerUser()->get('email')))->toArray();
           $model_i18n= $this->getSettings()->getConfirmedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employees_work','emailConfirmedRequest',
                                    $this->getCompany()->getEmailWithName(), 
                                    $this->getPaymentRequest()->getEmployeeUser()->get('email'), $model_i18n->get('subject',__('Graphex - Your payment has been accepted')),
                        array('payment_request'=>$this->getPaymentRequest(),                            
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $bcc // bcc
                    );       
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
    
     function sendConfirmedEmployer()
    {                 
         try 
         {    
           $bcc = $this->getSettings()->getAdminRecipients()->unshift(array($this->getPaymentRequest()->getEmployerUser()->get('email')))->toArray();
           $model_i18n= $this->getSettings()->getConfirmedEmployerEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employees_work','emailConfirmedEmployerRequest',
                                    $this->getCompany()->getEmailWithName(), 
                                    $this->getPaymentRequest()->getEmployeeUser()->get('email'), $model_i18n->get('subject',__('Graphex - Your payment has been accepted')),
                        array('payment_request'=>$this->getPaymentRequest(),                            
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $bcc // bcc
                    );       
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
    
    function sendActiveRequest()
    {       
        try 
         {                                
            $model_i18n= $this->getSettings()->getActiveEmailModel()->getI18n();                                 
            $email_spooler=new EmailerSpooler();
            
             $message =$this->getAction()->getComponent('/employees_work/emailActiveRequest', array('COMMENT'=>false,
                                                                                                                'company'=>$this->getCompany(),
                                                                                                                'payment_request'=>$this->getPaymentRequest(),
                                                                                                                'model_i18n'=>$model_i18n))->getContent();            
            if ($this->getMailer()->isDebug()) echo $message;            
            $email_spooler->add(array(
                            'to'=>$this->getPaymentRequest()->getEmployerUser()->get('email'),                                               
                            'from'=>$this->getCompany()->get('email'),
                            'bcc'=>(string)$this->getSettings()->getAdminRecipients()->push($this->getPaymentRequest()->getEmployeeUser()->get('email'))->implode(),
                            'body'=>$message,
                            'subject'=>$model_i18n->get('subject',__('Graphex - Your payment is active')),
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
}


