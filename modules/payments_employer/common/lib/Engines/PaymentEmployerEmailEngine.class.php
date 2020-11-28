<?php


class PaymentEmployerEmailEngine extends mfEmailEngineCore {
    
    protected $payment_employer_user=null;
        
    function __construct(PaymentEmployerUser $payment_employer_user,$options=array()) {
       $this->payment_employer_user=$payment_employer_user;
       parent::__construct($options);
       $this->settings=new PaymentSettings();
       $this->debug();
    }
    
    function getPaymentEmployerUser()
    {
        return $this->payment_employer_user;
    }
    
    
    function getSettings()
    {
        return $this->settings;
    }
    
    
     function sendCreated()
    {                 
         try 
         {                        
            $model_i18n= $this->getSettings()->getPaymentEmployerCreatedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('payments_employer','emailCreated',$this->getCompany()->getEmailWithName(), 
                        $this->getPaymentEmployerUser()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Your payment has been posted')),
                        array('payment'=>$this->getPaymentEmployerUser(),                           
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
    
    
    // www.project55.net/tests/emails?engine=PaymentEmployerEmail&type=EmployeeQuotationPaid&class=PaymentEmployerUser&id=42&class1=&id1=

     function sendEmployeeQuotationPaid()
    {                 
         try 
         {                 
            $model_i18n= $this->getSettings()->getPaymentEmployerEmployeeQuotationPaidEmailModel()->getI18n();
            
            foreach ($this->getPaymentEmployerUser()
                            ->getQuotations()
                            ->getAll()
                            ->withEmployees()
                            ->withEmployers()
                            ->byEmployees() as $employee)
            {
                 $message =$this->getAction()->getComponent('/payments_employer/emailEmployeeQuotationPaid', array('COMMENT'=>false,
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
            }                        
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        self::getSpooler()->save();
        return $this;
    }
}

