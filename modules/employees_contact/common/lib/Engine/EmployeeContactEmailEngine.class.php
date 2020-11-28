<?php


class EmployeeContactEmailEngine extends mfEmailEngineCore {
    
    protected $abuse=null,$settings=null;
        
    function __construct(EmployeeContact $user,$options=array()) {
       $this->user=$user;       
       $this->settings=new EmployeeContactSettings();
       parent::__construct($options);
       $this->debug();              
    }
    
    
    function getEmployeeContact()
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
            $this->getMailer()->sendMail('employees_contact','emailRegistration',$this->getCompany()->getEmailWithName(), 
                    $this->getEmployeeContact()->get('email'), 
                    $model_i18n->get('subject',__('Graphex - Graphex contact center')),
                        array('employee_contact'=>$this->getEmployeeContact(),                           
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

