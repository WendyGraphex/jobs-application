<?php


class PaymentEmployeeEmailEngine extends mfEmailEngineCore {
    
    protected $payment_employee_user=null,$settings=null;
        
    function __construct(PaymentEmployee $payment_employee_user,$options=array()) {
       $this->payment_employee_user=$payment_employee_user;
       parent::__construct($options);
       $this->settings=new PaymentSettings();    
       $this->debug();
    }
    
    function getPaymentEmployeeUser()
    {
        return $this->payment_employee_user;
    }
    
     
    function getSettings()
    {
        return $this->settings;
    }
    
    
     function sendCreated()
    {                 
          try 
         {                        
            $model_i18n= $this->getSettings()->getPaymentEmployeeCreatedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('payments_employee','emailCreated',$this->getCompany()->getEmailWithName(), 
                        $this->getPaymentEmployeeUser()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Creadit has been done.')),
                        array('payment'=>$this->getPaymentEmployeeUser(),                           
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

