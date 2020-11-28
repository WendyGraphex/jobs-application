<?php


class CustomerRegistrationEmailEngine extends  mfEmailEngineCore {
    
    protected $user=null,$settings=null;
        
    function __construct(CustomerRegistration $user,$options=array()) {
       $this->user=$user;     
       $this->settings=new CustomerRegistrationSettings();
        parent::__construct($options);       
        $this->debug();   
    }
    
    function getCustomer()
    {
        return $this->user;
    }
      
    function getSettings()
    {
        return $this->settings;
    }
    
    
     function sendRequestToContact()
    {                 
         try 
         {                        
           
            $model_i18n= $this->getSettings()->getRegistrationEmailModel()->getI18n();            
            $this->getMailer()->sendMail('customers_registration','emailRegistration',$this->getCompany()->getEmailWithName(), 
                                        $this->getCustomer()->get('email'), $model_i18n->get('subject',__('Welcome to Graphex Technology')),
                        array('customer'=>$this->getCustomer(),                           
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array()  //cc
                    //    $this->getSettings()->getRegistrationRecipients()->toArray() // bcc
                    );          
            
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
    
    
     function sendRequestToRecipients()
    {                 
         try 
         {                        
           
            $model_i18n= $this->getSettings()->getRegistrationEmailModel()->getI18n();            
            $this->getMailer()->sendMail('customers_registration','emailRecipientRegistration',$this->getCompany()->getEmailWithName(), 
                                        $this->getSettings()->getRegistrationRecipients()->toArray(), 
                        $model_i18n->get('subject',__('Welcome to Graphex Technology')),
                        array('registration'=>$this->getCustomer(),                           
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array()  //cc
                      //  $this->getSettings()->getRegistrationRecipients()->toArray() // bcc
                    );          
            
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
     
    
      
}

