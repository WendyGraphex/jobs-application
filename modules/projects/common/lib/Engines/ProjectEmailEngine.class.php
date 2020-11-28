<?php


class ProjectEmailEngine extends mfEmailEngineCore {
    
    protected $project=null;
        
    function __construct(Project $project,$options=array()) {
       $this->project=$project;                   
       parent::__construct($options);
       $this->debug();          
    }
    
    function getProject()
    {
        return $this->project;
    }
    
     
    function getSettings()
    {
        return $this->settings=$this->settings===null?new ProjectSettings():$this->settings;
    }
    
    
     function sendEndAtChange()
    {                 
        try 
        {                        
          
            $model_i18n= $this->getSettings()->getDateChangeEmailModel()->getI18n();            
            $this->getMailer()->sendMail('projects','emailEndAtChange',$this->getCompany()->getEmailWithName(),
                    $this->getProject()->getEmployerUser()->get('email'), 
                    $model_i18n->get('subject',__('Graphex - Can we change the end date of your project?')),
                        array('project'=>$this->getProject(),                             
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
    
     function sendStartAtChange()
    {                 
         try 
         {                        
          
            $model_i18n= $this->getSettings()->getDateChangeEmailModel()->getI18n();           
            $this->getMailer()->sendMail('projects','emailStartAtChange',$this->getCompany()->getEmailWithName(), 
                    $this->getProject()->getEmployerUser()->get('email'), 
                    $model_i18n->get('subject',__('Graphex - Your freelancer wants to change the starting date')),
                        array('project'=>$this->getProject(),                                      
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
          
            $model_i18n= $this->getSettings()->getDateChangeEmailModel()->getI18n();           
            $this->getMailer()->sendMail('projects','emailClosed',$this->getCompany()->getEmailWithName(), 
                        $this->getProject()->getEmployeeUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Your Project is closed')),
                        array('project'=>$this->getProject(),                                      
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $this->getSettings()->getAdminRecipients()->push($this->getProject()->getEmployerUser()->get('email'))->toArray() // bcc
                    );          
            
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
     
     function sendFinished()
    {                 
         try 
         {                        
          
            $model_i18n= $this->getSettings()->getDateChangeEmailModel()->getI18n();           
            $this->getMailer()->sendMail('projects','emailFinished',$this->getCompany()->getEmailWithName(), 
                        $this->getProject()->getEmployeeUser()->get('email'), $model_i18n->get('subject',__('Graphex - Project is finished...')),
                        array('project'=>$this->getProject(),                                      
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $this->getSettings()->getAdminRecipients()->push($this->getProject()->getEmployeeUser()->get('email'))->toArray() // bcc
                    );          
            
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    }
     
}

