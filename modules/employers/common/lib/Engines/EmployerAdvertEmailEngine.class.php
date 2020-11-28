<?php


class EmployerAdvertEmailEngine extends mfEmailEngineCore { 
    
    protected $advert=null,$settings=null;
        
    function __construct(EmployerAdvert $advert,$options=array()) {
       $this->advert=$advert;
       parent::__construct($options);
       $this->settings=new EmployerSettings();
       $this->debug();          
    }
    
    function getAdvert()
    {
        return $this->advert;
    }
       
    function getSettings()
    {
        return $this->settings;
    }
    
    
    function sendCreated()
    {                 
         try 
         {                        
            $model_i18n= $this->getSettings()->getAdvertCreatedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers','emailAdvertCreated',$this->getCompany()->getEmailWithName(), 
                        $this->getAdvert()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Advert created')),
                        array('advert'=>$this->getAdvert(),                           
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
         catch (Exception $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } 
        return $this;
    }
    
    function sendPublished()
    {                 
         try 
         {                        
            $model_i18n= $this->getSettings()->getAdvertPublishedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers','emailAdvertPublished',$this->getCompany()->getEmailWithName(), 
                        $this->getAdvert()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Advert published')),
                        array('advert'=>$this->getAdvert(),                           
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
         catch (Exception $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } 
        return $this;
    }
     
    function sendRefused()
    {                 
         try 
         {                        
          //  $this->getMailer()->debug();          
            
            $model_i18n= $this->getSettings()->getAdvertRefusedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers','emailAdvertRefused',$this->getCompany()->getEmailWithName(), 
                        $this->getAdvert()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Please complete your application.')),
                        array('advert'=>$this->getAdvert(),                           
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
         catch (Exception $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } 
        return $this;
    }
    
    
    function sendRevival()
    {                 
         try 
         {                        
          //  $this->getMailer()->debug();          
            
            $model_i18n= $this->getSettings()->getAdvertRevivalEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers','emailAdvertRevival',$this->getCompany()->getEmailWithName(), 
                        $this->getAdvert()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Congratulations...')),
                        array('advert'=>$this->getAdvert(),                           
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
        catch (Exception $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }         
        return $this;
    }
    
    
     function sendClosed()
    {                 
         try 
         {                        
          //  $this->getMailer()->debug();          
            
            $model_i18n= $this->getSettings()->getAdvertRevivalEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers','emailAdvertClosed',$this->getCompany()->getEmailWithName(), 
                        $this->getAdvert()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Your job has been closed...')),
                        array('advert'=>$this->getAdvert(),                           
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
         catch (Exception $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } 
        return $this;
    }
     
}

