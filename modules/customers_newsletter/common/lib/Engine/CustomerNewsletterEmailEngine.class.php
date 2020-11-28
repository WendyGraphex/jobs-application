<?php


class CustomerNewsletterEmailEngine extends  mfEmailEngineCore {
    
    protected $user=null,$settings=null;
        
    function __construct(CustomerNewsletter $user,$options=array()) {
       $this->user=$user;       
       $this->settings=new CustomerNewsletterSettings();
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
    
    
     function sendRequestToContactAndRecipients()
    {                 
         try 
         {                        
           
            $model_i18n= $this->getSettings()->getRegistrationEmailModel()->getI18n();            
            $this->getMailer()->sendMail('customers_newsletter','emailRegistration',$this->getCompany()->getEmailWithName(), $this->getCustomer()->get('email'), $model_i18n->get('subject',__('Graphex - Congratulations...')),
                        array('customer'=>$this->getCustomer(),                           
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $this->getSettings()->getRegistrationRecipients()->toArray() // bcc
                    );          
            
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
     
    
      
}

