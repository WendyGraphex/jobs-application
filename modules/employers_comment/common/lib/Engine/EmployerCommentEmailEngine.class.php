<?php


class EmployerCommentEmailEngine extends  mfEmailEngineCore {
    
    protected $user=null,$mailer=null,$settings=null,$options=array(),$comments_i18n=null;
        
    function __construct(EmployerAdvertCommentI18nCollection $comments_i18n,Employee $user,$options=array()) {
       $this->comments_i18n=$comments_i18n;      
       $this->user=$user;     
       $this->settings=new EmployerCommentSettings();
       parent::__construct($options);       
        $this->debug();  
    }
    
    function getEmployeeUser()
    {
        return $this->user;
    }
    
    function getComments()
    {
        return $this->comments_i18n;
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
            $this->getMailer()->sendMail('employers_comment','emailComment',$this->getCompany()->getEmailWithName(), $this->getEmployeeUser()->get('email'), $model_i18n->get('subject',__('Congratulations...')),
                        array('employee_user'=>$this->getEmployeeUser(),                           
                              'model_i18n'=>$model_i18n,
                              'comments_i18n'=>$this->getComments(),
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

