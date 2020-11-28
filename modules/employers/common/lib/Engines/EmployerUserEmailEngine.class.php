<?php


class EmployerUserEmailEngine extends mfEmailEngineCore {
    
    protected $user=null,$settings=null;
        
    function __construct(EmployerUser $user,$options=array()) {
       $this->user=$user;
       parent::__construct($options);       
       $this->settings=new EmployerSettings();    
       $this->debug();     
    }
    
    function getEmployerUser()
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
            $token=new EmployerUserValidationToken($this->getEmployerUser());
            $token->create();
          
            $model_i18n= $this->getSettings()->getValidationEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers','emailValidation',$this->getCompany()->getEmailWithName(), 
                    $this->getEmployerUser()->get('email'), 
                    $model_i18n->get('subject',__('Graphex - Please confirm your account')),
                        array('employer_user'=>$this->getEmployerUser(),
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
         catch (Exception $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } 
        return $this;
    }
     
    
     function sendForgotPassword(EmployerForgotPassword $forgot_password)
    {
        try 
        {                     
           //  if (!$this->getSettings()->hasForgotPasswordEmailModel())
            //   return ;           
            $model_i18n= $this->getSettings()->getForgotPasswordEmailModel()->getI18n();                
            $this->getMailer()->sendMail('employers','emailForgotPassword',
                          $this->getCompany()->getEmailWithName(),
                          $this->getEmployerUser()->get('email'),($model_i18n->get('subject')?$model_i18n->get('subject'):__('Graphex - Reset your password ')),
                          array('forgotpassword'=>$forgot_password,
                                'model_i18n'=>$model_i18n,
                                'company'=>$this->getCompany(),
                                'employer_user'=>$this->getEmployerUser()
                                )                                                   
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
    
    function sendForgotEmail(EmployerForgotEmail $forgot_email)
    {
        try 
        {                       
           //  if (!$this->getSettings()->hasForgotPasswordEmailModel())
            //   return ;
            $model_i18n= $this->getSettings()->getForgotEmailEmailModel()->getI18n();                 
            $this->getMailer()->sendMail('employers','emailForgotEmail',
                          $this->getCompany()->getEmailWithName(),
                          $this->getEmployerUser()->get('email'),$model_i18n->get('subject',__('Graphex - Forgot your email')),
                          array('forgotemail'=>$forgot_email,
                                'model_i18n'=>$model_i18n,
                                'company'=>$this->getCompany(),
                                 'employer_user'=>$this->getEmployerUser()
                                )                                                   
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
    
    
    function sendForgotPasswordChange()
    {
    
       try 
        {                     
           //  if (!$this->getSettings()->hasForgotPasswordEmailModel())
            //   return ;
            $model_i18n= $this->getSettings()->getForgotPasswordChangeEmailModel()->getI18n();                 
            $this->getMailer()->sendMail('employers','emailForgotPasswordChange',
                          $this->getCompany()->getEmailWithName(),
                          $this->getEmployerUser()->get('email'),$model_i18n->get('subject',__('Graphex - Your password has been changed')),
                          array(
                                'model_i18n'=>$model_i18n,
                                'company'=>$this->getCompany(),
                                'employer_user'=>$this->getEmployerUser()
                                )                                                   
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
    
    
     function sendCongratulations()
    {
    
       try 
        {                     
           //  if (!$this->getSettings()->hasForgotPasswordEmailModel())
            //   return ;
            $model_i18n= $this->getSettings()->getCongratulationEmailModel()->getI18n();                 
            $this->getMailer()->sendMail('employers','emailCongratulations',
                          $this->getCompany()->getEmailWithName(),
                          $this->getEmployerUser()->get('email'),$model_i18n->get('subject',__('Graphex - Your account has been created')),
                          array(
                                'model_i18n'=>$model_i18n,
                                'company'=>$this->getCompany(),
                                'employer_user'=>$this->getEmployerUser()
                                )                                                   
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
    
    
   /*  function sendForgotEmailRecovered()
    {
        try 
        {            
             $this->getMailer()->debug(); 
           //  if (!$this->getSettings()->hasForgotPasswordEmailModel())
            //   return ;
            $model_i18n= $this->getSettings()->getForgotPasswordChangeEmailModel()->getI18n();                 
            $this->getMailer()->sendMail('suppliers','emailForgotPasswordChange',
                          $this->getCompany()->getEmailWithName(),
                          $this->getCustomer()->get('email'),$model_i18n->get('subject',__('Forgot your email')),
                          array(
                                'model_i18n'=>$model_i18n,
                                'company'=>$this->getCompany(),
                                 'supplier_user'=>$this->getSupplierUser()
                                )                                                   
                     );                                                                             
        } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }                                                                  
        return $this;
    } */
    
    
   
    
   /* function sendFinished()
    {                 
         try 
         {                        
         //   $this->getMailer()->debug();          
            
            $model_i18n= $this->getSettings()->getCongratulationEmailModel()->getI18n();            
            $this->getMailer()->sendMail('customers','emailCongratulations',$this->getCompany()->getEmailWithName(), $this->getCustomer()->get('email'), $model_i18n->get('subject',__('Congratulations...')),array('customer'=>$this->getCustomer(),'token'=>$token,'model_i18n'=>$model_i18n,'company'=>$this->getCompany()),array(),$this->getSettings()->getAdminRecipients()->toArray());          
            
         } catch (Swift_TransportException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
           throw new mfException(__('Error occurs during email sending.'));
        }           
        return $this;
    } */
    
      function sendUserCreation()
    {
        try 
        {                     
                  
            $model_i18n= $this->getSettings()->getForgotPasswordEmailModel()->getI18n();                
            $this->getMailer()->sendMail('employers','emailUserCreation',
                          $this->getCompany()->getEmailWithName(),
                          $this->getEmployerUser()->get('email'),($model_i18n->get('subject')?$model_i18n->get('subject'):__('Graphex - We’ve retrieved your account')),
                          array( 
                                'employer_user'=>$this->getEmployerUser(),
                                'company'=>$this->getCompany(),
                                )                                                   
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

