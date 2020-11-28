<?php


class EmployeeAdvertEmailEngine extends mfEmailEngineCore  {
    
    protected $advert=null,$settings=null;
        
    function __construct(EmployeeAdvert $advert,$options=array()) {
       $this->advert=$advert;
       parent::__construct($options);
       $this->settings=new EmployeeSettings();
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
            $this->getMailer()->sendMail('employees','emailAdvertCreated',$this->getCompany()->getEmailWithName(), 
                        $this->getAdvert()->getEmployeeUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Your job has been published.')),
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
            $this->getMailer()->sendMail('employees','emailAdvertPublished',$this->getCompany()->getEmailWithName(), 
                        $this->getAdvert()->getEmployeeUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Your job has been published')),
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
            $this->getMailer()->sendMail('employees','emailAdvertRefused',$this->getCompany()->getEmailWithName(), 
                        $this->getAdvert()->getEmployeeUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Your job has been refused')),
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
    
    /*
     *  function sendActiveRequest()
    {
       // echo "<pre>"; var_dump($this->getSettings()->getAdminRecipients()->unshift($this->getPaymentRequest()->getEmployeeUser()->get('email'))->toArray());
        try 
         {                    
            $model_i18n= $this->getSettings()->getActiveEmailModel()->getI18n();                                 
            $email_spooler=new EmailerSpooler();
            $email_spooler->add(array(
                            'to'=>$this->getPaymentRequest()->getEmployerUser()->get('email'),                                               
                            'from'=>$this->getCompany()->get('email'),
                            'bcc'=>(string)$this->getSettings()->getAdminRecipients()->push($this->getPaymentRequest()->getEmployeeUser()->get('email'))->implode(),
                            'body'=>mfContext::getInstance()->getActionStack()->getLastEntry()->getActionInstance()->getComponent('/employees_work/emailActiveRequest', array('COMMENT'=>false,
                                                                                                                                                                              'company'=>$this->getCompany(),
                                                                                                                                                                              'payment_request'=>$this->getPaymentRequest(),
                                                                                                                                                                              'model_i18n'=>$model_i18n))->getContent(),
                            'subject'=>$model_i18n->get('subject',__('Payment request has been activated for payment')),
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
        return $this;
    }
     */
    
    function sendRevival()
    {                 
         try 
         {                        
          //  $this->getMailer()->debug();          
            
            $model_i18n= $this->getSettings()->getAdvertRevivalEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employees','emailAdvertRevival',$this->getCompany()->getEmailWithName(), 
                        $this->getAdvert()->getEmployeeUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Please finish your job posting before it’s expired')),
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

