<?php


class EmployeeInvitationEmailEngine extends  mfEmailEngineCore {
    
    protected $invitation=null,$settings=null;
        
    function __construct(EmployeeInvitation $invitation,$options=array()) {
       $this->invitation=$invitation;     
       $this->settings=new EmployeeInvitationSettings();
        parent::__construct($options);       
        $this->debug();   
    }
    
    function getInvitation()
    {
        return $this->invitation;
    }
      
    function getSettings()
    {
        return $this->settings;
    }
    
    
     function sendRequestToContact()
    {                 
         try 
         {                        
           
            $model_i18n= $this->getSettings()->getInvitationEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employees_invitation','emailInvitation',$this->getCompany()->getEmailWithName(), 
                                        $this->getInvitation()->get('email'), $model_i18n->get('subject',__('Welcome to Graphex Technology')),
                        array('invitation'=>$this->getInvitation(),                           
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array()  //cc
                    //    $this->getSettings()->getInvitationRecipients()->toArray() // bcc
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
           
            $model_i18n= $this->getSettings()->getInvitationEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employees_invitation','emailRecipientInvitation',$this->getCompany()->getEmailWithName(), 
                                        $this->getSettings()->getInvitationRecipients()->toArray(), 
                        $model_i18n->get('subject',__('Welcome to Graphex Technology')),
                        array('invitation'=>$this->getInvitation(),                           
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array()  //cc
                      //  $this->getSettings()->getInvitationRecipients()->toArray() // bcc
                    );          
            
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
     
    
      
}

