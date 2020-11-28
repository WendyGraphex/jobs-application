<?php


class CustomerAcademyCourseI18nEmailEngine extends  mfEmailEngineCore {
    
    protected $course_i18n=null,$mailer=null,$settings=null,$options=array();
        
    function __construct(CustomerAcademyCourseI18n $course_i18n,$options=array()) {
       $this->course_i18n=$course_i18n;
       $this->settings=new CustomerAcademyTeacherUserSettings();
       parent::__construct($options);       
        $this->debug();   
    }
    
    function getCourseI18n()
    {
        return $this->course_i18n;
    }
        
    function getSettings()
    {
        return $this->settings;
    }
    
    
    function sendCreated()
    {                 
        try 
        {                                  
            
            $model_i18n= $this->getSettings()->getCourseCreatedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('customers_academy','emailCourseCreated',$this->getCompany()->getEmailWithName(), 
                                        $this->getCourseI18n()->getTeacherUser()->get('email'), 
                                        $model_i18n->get('subject',__('Graphex - Congratulations course created ...')),
                        array('course_i18n'=>$this->getCourseI18n(),                           
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
     
    function sendCommitted()
    {                 
        try 
        {                                  
            
            $model_i18n= $this->getSettings()->getCourseCommittedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('site_event','emailCourseCommitted',$this->getCompany()->getEmailWithName(), $this->getUser()->get('email'), $model_i18n->get('subject',__('Graphex - Congratulations course committed ...')),
                        array('course_i18n'=>$this->getUser(),
                              'token'=>$token,
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
    
    function sendPublished()
    {                 
        try 
        {                                  
            
            $model_i18n= $this->getSettings()->getCoursePublishedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('site_event','emailCoursePublished',$this->getCompany()->getEmailWithName(), $this->getUser()->get('email'), $model_i18n->get('subject',__('Graphex - Congratulations course published ...')),
                        array('course_i18n'=>$this->getUser(),
                              'token'=>$token,
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
     
    function sendRefused()
    {                 
        try 
        {                                  
            
            $model_i18n= $this->getSettings()->getCourseRefusedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('site_event','emailCourseRefused',$this->getCompany()->getEmailWithName(), $this->getUser()->get('email'), $model_i18n->get('subject',__('Graphex - Congratulations course refused ...')),
                        array('course_i18n'=>$this->getUser(),
                              'token'=>$token,
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
    
    function sendDeleted()
    {                 
        try 
        {                                  
            
            $model_i18n= $this->getSettings()->getCourseDeletedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('site_event','emailCourseDeleted',$this->getCompany()->getEmailWithName(), $this->getUser()->get('email'), $model_i18n->get('subject',__('Graphex - Congratulations course deleted ...')),
                        array('course_i18n'=>$this->getUser(),
                              'token'=>$token,
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

