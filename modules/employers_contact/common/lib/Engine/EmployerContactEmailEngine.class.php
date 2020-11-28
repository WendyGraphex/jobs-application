<?php


class EmployerContactEmailEngine {
    
    protected $user=null,$mailer=null,$settings=null,$options=array();
        
    function __construct(EmployerContact $user,$options=array()) {
       $this->user=$user;
       $this->mailer=mfContext::getInstance()->getMailer();
       $this->company=SiteCompany::getSiteCompany();
       $this->settings=new EmployerContactSettings();
       $this->getMailer()->debug();         
       $this->options=$options;
    }
    
    function getEmployerContact()
    {
        return $this->user;
    }
    
    function getCompany()
    {
        return $this->company;
    }
    
    function getMailer()
    {
        return $this->mailer;
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
            $this->getMailer()->sendMail('employers_contact','emailRegistration',$this->getCompany()->getEmailWithName(), 
                    $this->getEmployerContact()->get('email'), 
                    $model_i18n->get('subject',__('Graphex - Graphex contact center')),
                        array('employer_contact'=>$this->getEmployerContact(),                           
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

