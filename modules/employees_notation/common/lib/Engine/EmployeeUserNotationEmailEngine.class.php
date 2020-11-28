<?php


class EmployeeUserNotationEmailEngine extends  mfEmailEngineCore {
    
    protected $user=null,$mailer=null,$settings=null,$options=array();
        
    function __construct(EmployeeAdvertI18nEmployeeCriteriaNotationCollection $notations,Employee $user,$options=array()) {
       $this->notations=$notations;
       $this->user=$user;     
       $this->settings=new EmployeeUserNotationSettings();
       parent::__construct($options);       
        $this->debug();   
    }
    
    function getEmployeeUser()
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
            $this->getMailer()->sendMail('employees_notation','emailNotations',$this->getCompany()->getEmailWithName(), $this->getEmployeeUser()->get('email'), $model_i18n->get('subject',__('Congratulations...')),
                        array('employee'=>$this->getEmployeeUser(),
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

