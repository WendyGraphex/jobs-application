<?php


class EmployerAdvertI18nAbuseEmailEngine extends mfEmailEngineCore {
    
    protected $abuse=null,$settings=null;
        
    function __construct(EmployerAdvertI18nAbuse $abuse,$options=array()) {
       $this->abuse=$abuse;        
       $this->settings=new EmployerContactSettings();
       parent::__construct($options);
     //  $this->debug();             
    }
    
    function getAbuse()
    {
        return $this->abuse;
    }
    
     
    function getSettings()
    {
        return $this->settings;
    }
    
    
   function sendAbuseToContactAndRecipients()
    {                 
         try 
         {                        
           
            $model_i18n= $this->getSettings()->getRegistrationEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers_contact','emailAbuse',$this->getCompany()->getEmailWithName(), 
                        $this->getAbuse()->get('email'), $model_i18n->get('subject',__('Graphex - Abuse alert!')),
                        array('abuse'=>$this->getAbuse(),                           
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $this->getSettings()->getRegistrationRecipients()->toArray()
                    );          
            
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
    
      
}

