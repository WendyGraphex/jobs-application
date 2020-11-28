<?php


class EmployerAdvertI18nEmailEngine extends mfEmailEngineCore {
    
    protected $advert_i18n=null,$settings=null;
        
    function __construct(EmployerAdvertI18n $advert_i18n,$options=array()) {
       $this->advert_i18n=$advert_i18n;
       parent::__construct($options);
       $this->settings=new EmployerSettings();       
       $this->debug();          
    }
    
    function getAdvertI18n()
    {
        return $this->advert_i18n;
    }
    
    
    function getSettings()
    {
        return $this->settings;
    }
    
    
    function sendCreated()
    {                 
         try 
         {                        
            $model_i18n= $this->getSettings()->getAdvertI18nCreatedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers','emailAdvertI18nCreated',$this->getCompany()->getEmailWithName(), 
                        $this->getAdvertI18n()->getAdvert()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Advert created')),
                        array('advert_i18n'=>$this->getAdvertI18n(),                           
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
            $model_i18n= $this->getSettings()->getAdvertI18nPublishedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers','emailAdvertI18nPublished',$this->getCompany()->getEmailWithName(), 
                        $this->getAdvertI18n()->getAdvert()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Advert published')),
                        array('advert_i18n'=>$this->getAdvertI18n(),                           
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
            
            $model_i18n= $this->getSettings()->getAdvertI18nRefusedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers','emailAdvertI18nRefused',$this->getCompany()->getEmailWithName(), 
                        $this->getAdvertI18n()->getAdvert()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Advert refused')),
                        array('advert_i18n'=>$this->getAdvertI18n(),                           
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
    
    
  /*  function sendRevival()
    {                 
         try 
         {                        
          //  $this->getMailer()->debug();          
            
            $model_i18n= $this->getSettings()->getAdvertI18nRevivalEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers','emailAdvertI18nRevival',$this->getCompany()->getEmailWithName(), 
                        $this->getAdvertI18n()->getAdvert()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Revival...')),
                        array('advert_i18n'=>$this->getAdvertI18n(),                           
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
    }*/
     
    function sendRevival()
    {                          
         try 
         {                                
            $model_i18n= $this->getSettings()->getAdvertI18nRevivalEmailModel()->getI18n();                                 
            $email_spooler=new EmailerSpooler();
            
            $message =$this->getAction()->getComponent('/employees/emailRevival', array('COMMENT'=>false,
                                                                                        'company'=>$this->getCompany(),
                                                                                        'advert_i18n'=>$this->getAdvertI18n(),                
                                                                                        'model_i18n'=>$model_i18n))->getContent();            
            if ($this->getMailer()->isDebug()) echo $message;            
            $email_spooler->add(array(
                            'to'=>$this->getAdvertI18n()->getAdvert()->getEmployerUser()->get('email'),                                               
                            'from'=>$this->getCompany()->get('email'),
                            'bcc'=>(string)$this->getSettings()->getAdminRecipients()->implode(),
                            'body'=>$message,
                            'subject'=>$model_i18n->get('subject',__('Graphex - Advert revival')),
                            ));
            self::getSpooler()->push($email_spooler);           
        }
        catch (SmartyCompilerException $e)
        {         
            throw new mfException(__("Error Syntax in model."));              
        }  
        catch (mfException $e) {
           throw new mfException(__('Error occurs during email sending. %s',$e->getMessage()));
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
            
            $model_i18n= $this->getSettings()->getAdvertI18nRevivalEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers','emailAdvertI18nClosed',$this->getCompany()->getEmailWithName(), 
                        $this->getAdvertI18n()->getAdvert()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Job is closed')),
                        array('advert_i18n'=>$this->getAdvertI18n(),                           
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

