<?php


class SiteEventUserEmailEngine extends  mfEmailEngineCore {
    
    protected $user=null,$settings=null;
        
    function __construct(SiteEventUser $user,$options=array()) {
       $this->user=$user;  
       $this->settings=new SiteEventSettings();
       parent::__construct($options);       
        $this->debug();   
    }
    
    function getUser()
    {
        return $this->user;
    }
       
    function getSettings()
    {
        return $this->settings;
    }
    
    
   function sendValidation()
    {                 
         try 
         {                                  
            $token=new SiteEventUserValidationToken($this->getUser());
            $token->create();
          
            $model_i18n= $this->getSettings()->getCongratulationEmailModel()->getI18n();            
            $this->getMailer()->sendMail('site_event','emailValidation',$this->getCompany()->getEmailWithName(), 
                            $this->getUser()->get('email'), $model_i18n->get('subject',__('Graphex - Account validation ...')),
                        array('user'=>$this->getUser(),
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
     
    
     function sendForgotPassword(SiteEventUserForgotPassword $forgot_password)
    {
        try 
        {                     
           //  if (!$this->getSettings()->hasForgotPasswordEmailModel())
            //   return ;                             
            $model_i18n= $this->getSettings()->getForgotPasswordEmailModel()->getI18n();                
            $this->getMailer()->sendMail('site_event','emailForgotPassword',
                          $this->getCompany()->getEmailWithName(),
                          $this->getUser()->get('email'),($model_i18n->get('subject')?$model_i18n->get('subject'):__('Graphex - Forgot your password')),
                          array('forgotpassword'=>$forgot_password,
                                'model_i18n'=>$model_i18n,
                                'company'=>$this->getCompany(),
                                'user'=>$this->getUser()
                                )                                                   
                     );                                                                             
        } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }                 
        return $this;
    } 
    
    function sendForgotEmail(SiteEventUserForgotEmail $forgot_email)
    {
        try 
        {                       
           //  if (!$this->getSettings()->hasForgotPasswordEmailModel())
            //   return ;
            $model_i18n= $this->getSettings()->getForgotEmailEmailModel()->getI18n();                 
            $this->getMailer()->sendMail('site_event','emailForgotEmail',
                          $this->getCompany()->getEmailWithName(),
                          $this->getUser()->get('email'),$model_i18n->get('subject',__('Graphex - Forgot your email')),
                          array('forgotemail'=>$forgot_email,
                                'model_i18n'=>$model_i18n,
                                'company'=>$this->getCompany(),
                                 'user'=>$this->getUser()
                                )                                                   
                     );                                                                             
        } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }                 
        return $this;
    } 
    
    
    function sendForgotPasswordChange()
    {
    
       try 
        {                     
           //  if (!$this->getSettings()->hasForgotPasswordEmailModel())
            //   return ;
            $model_i18n= $this->getSettings()->getForgotPasswordChangeEmailModel()->getI18n();                 
            $this->getMailer()->sendMail('site_event','emailForgotPasswordChange',
                          $this->getCompany()->getEmailWithName(),
                          $this->getUser()->get('email'),$model_i18n->get('subject',__('Graphex - Your password has been changed')),
                          array(
                                'model_i18n'=>$model_i18n,
                                'company'=>$this->getCompany(),
                                'user'=>$this->getUser()
                                )                                                   
                     );                                                                             
        } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }                                                                  
        return $this;
    } 
    
    
     function sendCongratulations()
    {
    
       try 
        {                     
          
            $model_i18n= $this->getSettings()->getCongratulationEmailModel()->getI18n();                 
            $this->getMailer()->sendMail('site_event','emailCongratulations',
                          $this->getCompany()->getEmailWithName(),
                          $this->getUser()->get('email'),$model_i18n->get('subject',__('Graphex - Congratulations')),
                          array(
                                'model_i18n'=>$model_i18n,
                                'company'=>$this->getCompany(),
                                'user'=>$this->getUser()
                                )                                                   
                     );                                                                             
        } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }                                                                  
        return $this;
    } 
    
   
  /*    function sendUserCreation()
    {
        try 
        {                     
                  
            $model_i18n= $this->getSettings()->getForgotPasswordEmailModel()->getI18n();                
            $this->getMailer()->sendMail('employers','emailUserCreation',
                          $this->getCompany()->getEmailWithName(),
                          $this->getUser()->get('email'),($model_i18n->get('subject')?$model_i18n->get('subject'):__('Confirm your account creation')),
                          array( 
                                'user'=>$this->getUser(),
                                'company'=>$this->getCompany(),
                                )                                                   
                     );                                                                             
        } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }                 
        return $this;
    } */
     
}

