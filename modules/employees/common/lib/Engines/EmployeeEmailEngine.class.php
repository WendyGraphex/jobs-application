<?php


class EmployeeEmailEngine extends mfEmailEngineCore {
    
    protected $user=null,$settings=null;
        
    function __construct(Employee $user,$options=array()) {
       $this->user=$user;
       parent::__construct($options);
       $this->settings=new EmployeeSettings();
       $this->debug();              
    }
    
    function getEmployee()
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
            $token=new EmployeeValidationToken($this->getEmployee());
            $token->create();
          
            $model_i18n= $this->getSettings()->getCongratulationEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employees','emailValidation',$this->getCompany()->getEmailWithName(), 
                    $this->getEmployee()->get('email'), 
                    $model_i18n->get('subject',__('Graphex - Please confirm your account')),
                        array('employee'=>$this->getEmployee(),
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
     
    
     function sendForgotPassword(EmployeeForgotPassword $forgot_password)
    {
        try 
        {            
           
           //  if (!$this->getSettings()->hasForgotPasswordEmailModel())
            //   return ;           
            $model_i18n= $this->getSettings()->getForgotPasswordEmailModel()->getI18n();                
            $this->getMailer()->sendMail('employees','emailForgotPassword',
                          $this->getCompany()->getEmailWithName(),
                          $this->getEmployee()->get('email'),($model_i18n->get('subject')?$model_i18n->get('subject'):__('Graphex - Reset your password')),
                          array('forgotpassword'=>$forgot_password,
                                'employee'=>$this->getEmployee(),
                                'model_i18n'=>$model_i18n,
                                'company'=>$this->getCompany(),
                                'employee'=>$this->getEmployee()
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
    
    function sendForgotEmail(CustomerForgotEmail $forgot_email)
    {
        try 
        {            
           
           //  if (!$this->getSettings()->hasForgotPasswordEmailModel())
            //   return ;
            $model_i18n= $this->getSettings()->getForgotEmailEmailModel()->getI18n();                 
            $this->getMailer()->sendMail('supplieers','emailForgotEmail',
                          $this->getCompany()->getEmailWithName(),
                          $this->getEmployee()->get('email'),$model_i18n->get('subject',__('GRaphex - Forgot your email')),
                          array('forgotemail'=>$forgot_email,
                                'model_i18n'=>$model_i18n,
                                'company'=>$this->getCompany(),
                                 'employee'=>$this->getEmployee()
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
            $this->getMailer()->sendMail('employees','emailForgotPasswordChange',
                          $this->getCompany()->getEmailWithName(),
                          $this->getEmployee()->get('email'),$model_i18n->get('subject',__('Graphex - Your password has been changed')),
                          array(
                                'model_i18n'=>$model_i18n,
                                'company'=>$this->getCompany(),
                                'employee'=>$this->getEmployee()
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
    
    
   
    
     function sendCongratulations()
    {                 
         try 
         {                  
                            
            $model_i18n= $this->getSettings()->getCongratulationEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employees','emailCongratulations',
                        $this->getCompany()->getEmailWithName(), 
                        $this->getEmployee()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Your account is active now!')),
                        array('employee'=>$this->getEmployee(), 
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),array(),
                              $this->getSettings()->getAdminRecipients()->toArray());          
            
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

