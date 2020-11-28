<?php


class EmployerSaleQuotationEmailEngine extends mfEmailEngineCore {
    
    protected $quotation=null,$settings=null;
        
    function __construct(EmployeeSaleQuotation $quotation,$options=array()) {
       $this->quotation=$quotation;
       parent::__construct($options);
       $this->settings=new SaleQuotationSettings();
        $this->debug();             
    }
    
    function getQuotation()
    {
        return $this->quotation;
    }        
        
    function getSettings()
    {
        return $this->settings;
    }
    
    
     function sendNegociate()
    {                 
         try 
         {                        
           $model_i18n= $this->getSettings()->getEmployerNegociateEmailModel()->getI18n();            
            $this->getMailer()->sendMail('sales_quotation','emailEmployerNegociate',$this->getCompany()->getEmailWithName(), 
                        $this->getQuotation()->getEmployeeUser()->get('email'), 
                         $model_i18n->get('subject',__('Graphex - Quotation negociate')),
                        array('quotation'=>$this->getQuotation(),                               
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
           $model_i18n= $this->getSettings()->getEmployerNegociateEmailModel()->getI18n();            
            $this->getMailer()->sendMail('sales_quotation','emailEmployerRefused',$this->getCompany()->getEmailWithName(), 
                        $this->getQuotation()->getEmployeeUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Quotation refused')),
                        array('quotation'=>$this->getQuotation(),                               
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
    
     function sendAccepted()
    {                 
         try 
         {                        
           $model_i18n= $this->getSettings()->getEmployerNegociateEmailModel()->getI18n();            
            $this->getMailer()->sendMail('sales_quotation','emailEmployerAccepted',$this->getCompany()->getEmailWithName(), 
                        $this->getQuotation()->getEmployeeUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Your offer has been accepted')),
                        array('quotation'=>$this->getQuotation(),                           
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
    
    
    function sendRevival()
    {                 
         try 
         {                        
           $model_i18n= $this->getSettings()->getEmployerNegociateEmailModel()->getI18n();            
            $this->getMailer()->sendMail('sales_quotation','emailEmployerRevival',$this->getCompany()->getEmailWithName(), 
                        $this->getQuotation()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Quotation revival')),
                        array('quotation'=>$this->getQuotation(),                           
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
     
    function sendSchedule()
    {                 
         try 
         {                        
           $model_i18n= $this->getSettings()->getEmployerScheduleEmailModel()->getI18n();            
            $this->getMailer()->sendMail('sales_quotation','emailEmployerSchedule',$this->getCompany()->getEmailWithName(), 
                        $this->getQuotation()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Your employer wants to schedule with you')),
                        array('quotation'=>$this->getQuotation(),                           
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

