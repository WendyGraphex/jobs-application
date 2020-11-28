<?php


class EmployeeAlertEmailEngine extends mfEmailEngineCore {
    
    protected $alert=null,$settings=null;
        
    function __construct(EmployeeAlert $alert,$options=array()) {
       $this->alert=$alert;
       parent::__construct($options);       
       $this->settings=new EmployerSettings();    
       $this->debug();     
    }
    
    function getAlert()
    {
        return $this->alert;
    }
    
   
    function getSettings()
    {
        return $this->settings;
    }
    
    
    function sendCreated()
    {                 
         try 
         {                                  
             
            $model_i18n= $this->getSettings()->getAlertCreatedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employees_alert','emailCreated',$this->getCompany()->getEmailWithName(), 
                        $this->getAlert()->getUser()->get('email'), $model_i18n->get('subject',__('Alert created')),
                        array('alert'=>$this->getAlert(),                          
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $this->getSettings()->getAlertRecipients()->toArray() // bcc
                    );          
            
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
    
    function sendPosted()
    {                 
        try 
        {
            $model_i18n= $this->getSettings()->getAlertPostedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers_alert','emailPosted',$this->getCompany()->getEmailWithName(), 
                        $this->getAlert()->getUser()->get('email'), $model_i18n->get('subject',__('Alert new post')),
                        array('alert'=>$this->getAlert(),                          
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $this->getSettings()->getAlertRecipients()->toArray() // bcc
                    );          
            
        } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
     
    function sendDeleted()
    {                 
         try 
         {                                  
            $model_i18n= $this->getSettings()->getAlertDeletedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers_alert','emailDeleted',$this->getCompany()->getEmailWithName(), 
                        $this->getAlert()->getUser()->get('email'), $model_i18n->get('subject',__('Alert deleted')),
                        array('alert'=>$this->getAlert(),                          
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $this->getSettings()->getAlertRecipients()->toArray() // bcc
                    );          
            
        } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
      
     
}

