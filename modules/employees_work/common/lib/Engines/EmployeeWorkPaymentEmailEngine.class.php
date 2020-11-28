<?php


class EmployeeWorkPaymentEmailEngine extends mfEmailEngineCore {
    
    protected $payment=null,$settings=null;
        
    function __construct(EmployeeWorkPayment $payment,$options=array()) {
       $this->payment=$payment;
       parent::__construct($options);
       $this->settings=new EmployeeWorkSettings();
       $this->debug();             
    }
    
    function getPayment()
    {
        return $this->payment;
    }
        
    function getSettings()
    {
        return $this->settings;
    }
    
    
     function sendValidation()
    {                 
         try 
         {                        
          //  $this->getMailer()->debug();          
         /*   $token=new EmployeeValidationToken($this->getEmployee());
            $token->create();
          
            $model_i18n= $this->getSettings()->getCongratulationEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employees','emailCongratulations',$this->getCompany()->getEmailWithName(), $this->getEmployee()->get('email'), $model_i18n->get('subject',__('Congratulations...')),
                        array('employee'=>$this->getEmployee(),
                              'token'=>$token,
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $this->getSettings()->getAdminRecipients()->toArray() // bcc
                    );          
            */
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
     
    
   
}

