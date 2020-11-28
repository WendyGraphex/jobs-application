<?php


class PaymentEmployerUserEmailEngine {
    
    protected $payment_employer=null,$mailer=null,$settings=null,$options=array();
        
    function __construct(PaymentEmployerUser $payment_employer,$options=array()) {
       $this->payment_employer=$payment_employer;
       $this->mailer=mfContext::getInstance()->getMailer();
       $this->company=SiteCompany::getSiteCompany();
       $this->settings=new PaymentSettings();
       $this->options=$options;
    }
    
    function getPaymentEmployerUser()
    {
        return $this->payment_employer;
    }
    
    function getCompany()
    {
        return $this->company;
    }
    
    function getMailer()
    {
        return $this->mailer;
    }
    
    function getSettings()
    {
        return $this->settings;
    }
    
    
   /* function sendCreated()
    {                 
         try 
         {                        
         $model_i18n= $this->getSettings()->getAdvertCreatedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('employers','emailAdvertCreated',$this->getCompany()->getEmailWithName(), 
                        $this->getAdvert()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Advert created')),
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
        return $this;
    }*/
    
    
}

