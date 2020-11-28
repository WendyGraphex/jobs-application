<?php


class PaymentDebitEventUserEmailEngine extends mfEmailEngineCore {
    
    protected $payment_event_user=null;
        
    function __construct(PaymentDebitEventUser $payment_event_user,$options=array()) {
       $this->payment_event_user=$payment_event_user;
       parent::__construct($options);
       $this->settings=new PaymentSettings();
       $this->debug();
    }
    
    function getPaymentEventUser()
    {
        return $this->payment_event_user;
    }
    
    
    function getSettings()
    {
        return $this->settings;
    }
    
    
     function sendCreated()
    {                 
         try 
         {                        
            $model_i18n= $this->getSettings()->getPaymentEventCreatedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('payments_event_user','emailCreated',$this->getCompany()->getEmailWithName(), 
                        $this->getPaymentEventUser()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Your payment has been posted')),
                        array('payment'=>$this->getPaymentEventUser(),                           
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
    
    
    // www.project55.net/tests/emails?engine=PaymentEventEmail&type=EmployeeQuotationPaid&class=PaymentEventUser&id=42&class1=&id1=

     function sendEmployeeQuotationPaid()
    {                 
         try 
         {                 
        /*    $model_i18n= $this->getSettings()->getPaymentEventEmployeeQuotationPaidEmailModel()->getI18n();
            
            foreach ($this->getPaymentEventUser()
                            ->getQuotations()
                            ->getAll()
                            ->withEmployees()
                            ->withEmployers()
                            ->byEmployees() as $employee)
            {
                 $message =$this->getAction()->getComponent('/payments_event_user/emailEmployeeQuotationPaid', array('COMMENT'=>false,
                                                                                        'company'=>$this->getCompany(),
                                                                                        'employee'=>$employee,                                                                                                  
                                                                                        'model_i18n'=>$model_i18n))->getContent();                   
                 if ($this->getMailer()->isDebug()) echo $message;  
                 $email_spooler=new EmailerSpooler();
                 $email_spooler->add(array(
                            'to'=>$employee->get('email'),                                               
                            'from'=>$this->getCompany()->get('email'),
                            'bcc'=>(string)$this->getSettings()->getAdminRecipients()->implode(),
                            'body'=>$message,
                            'subject'=>$model_i18n->get('subject',__('Graphex - Thank you for your payment')),
                            ));
                self::getSpooler()->push($email_spooler);  
            }        */                
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        self::getSpooler()->save();
        return $this;
    }
}

