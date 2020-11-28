<?php


class EmployerUserNotationEmailEngine extends  mfEmailEngineCore {
    
    protected $user=null,$settings=null;
        
    function __construct(EmployerAdvertI18nEmployerCriteriaNotationCollection $notations,EmployerUser $user,$options=array()) {
       $this->notations=$notations;
       $this->user=$user;     
       $this->settings=new EmployerUserNotationSettings();
     parent::__construct($options);       
        $this->debug();   
    }
    
    function getEmployerUser()
    {
        return $this->user;
    }
    
    function getNotations()
    {
        return $this->notations;
    }        
    
    function getSettings()
    {
        return $this->settings;
    }
    
    
     function sendNotation()
    {                 
         try 
         {                        
           
            $model_i18n= $this->getSettings()->getNotationEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers_notation','emailNotations',$this->getCompany()->getEmailWithName(), $this->getEmployerUser()->get('email'), $model_i18n->get('subject',__('Congratulations...')),
                        array('employer'=>$this->getEmployerUser(),
                              'notations'=>$this->getNotations(),
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

