<?php


class SiteEventEmailEngine extends  mfEmailEngineCore {
    
    protected $event=null,$settings=null;
        
    function __construct(SiteEvent $event,$options=array()) {
       $this->event=$event;  
       $this->settings=new SiteEventSettings();
       parent::__construct($options);       
        $this->debug();   
    }
    
    function getEvent()
    {
        return $this->event;
    }
       
    function getSettings()
    {
        return $this->settings;
    }
    
    
    function sendCreated()
    {                 
         try 
         {                                  
            
            $model_i18n= $this->getSettings()->getEventCreatedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('site_event','emailEventCreated',$this->getCompany()->getEmailWithName(), $this->getEvent()->getEventUser()->get('email'), $model_i18n->get('subject',__('Graphex - Congratulations...')),
                        array('event'=>$this->getEvent(),                             
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
            
            $model_i18n= $this->getSettings()->getEventCommittedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('site_event','emailEventCommitted',$this->getCompany()->getEmailWithName(), $this->getEvent()->getEventUser()->get('email'), $model_i18n->get('subject',__('Graphex - Congratulations...')),
                        array('event'=>$this->getEvent(),                             
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
            
            $model_i18n= $this->getSettings()->getEventRefusedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('site_event','emailEventRefused',$this->getCompany()->getEmailWithName(), $this->getEvent()->getEventUser()->get('email'), $model_i18n->get('subject',__('Graphex - Congratulations...')),
                        array('event'=>$this->getEvent(),                             
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
            
            $model_i18n= $this->getSettings()->getEventPublishedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('site_event','emailEventPublished',$this->getCompany()->getEmailWithName(), 
                       $this->getEvent()->getEventUser()->get('email'), $model_i18n->get('subject',__('Graphex - Published...')),
                        array('event'=>$this->getEvent(),                             
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
    
     function sendClosed()
    {                 
         try 
         {                                  
            
            $model_i18n= $this->getSettings()->getEventClosedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('site_event','emailEventClosed',$this->getCompany()->getEmailWithName(), 
                    $this->getEvent()->getEventUser()->get('email'), 
                    $model_i18n->get('subject',__('Graphex - Congratulations...')),
                        array('event'=>$this->getEvent(),                             
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
            
            $model_i18n= $this->getSettings()->getEventDeletedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('site_event','emailEventDeleted',$this->getCompany()->getEmailWithName(), $this->getEvent()->getEventUser()->get('email'), $model_i18n->get('subject',__('Graphex - Congratulations...')),
                        array('event'=>$this->getEvent(),                             
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

