<?php


class EmployeeSaleQuotationEmailEngine extends mfEmailEngineCore {
    
    protected $quotation=null,$settings=null;
        
    function __construct(SaleEmployeeQuotation $quotation,$options=array()) {
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
    
    
     function sendProposed()
    {                 
         try 
         {                        
           $model_i18n= $this->getSettings()->getEmployeeProposedEmailModel()->getI18n();            
            $this->getMailer()->sendMail('sales_quotation','emailEmployeeProposed',$this->getCompany()->getEmailWithName(), 
                        $this->getQuotation()->getEmployerUser()->get('email'), 
                         $model_i18n->get('subject',__('Graphex - You’ve just received an offer')),
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
    
    
     function sendNegociate()
    {                 
         try 
         {                        
           $model_i18n= $this->getSettings()->getEmployeeNegociateEmailModel()->getI18n();            
            $this->getMailer()->sendMail('sales_quotation','emailEmployeeNegociate',$this->getCompany()->getEmailWithName(), 
                        $this->getQuotation()->getEmployerUser()->get('email'), 
                         $model_i18n->get('subject',__('Graphex - Your employer wants to negotiate with you')),
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
           $model_i18n= $this->getSettings()->getEmployeeNegociateEmailModel()->getI18n();            
            $this->getMailer()->sendMail('sales_quotation','emailEmployeeRefused',$this->getCompany()->getEmailWithName(), 
                        $this->getQuotation()->getEmployerUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Offer has been declined')),
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
           $model_i18n= $this->getSettings()->getEmployeeNegociateEmailModel()->getI18n();            
            $this->getMailer()->sendMail('sales_quotation','emailEmployeeAccepted',$this->getCompany()->getEmailWithName(), 
                        $this->getQuotation()->getEmployerUser()->get('email'), 
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
           $model_i18n= $this->getSettings()->getEmployeeNegociateEmailModel()->getI18n();            
            $this->getMailer()->sendMail('sales_quotation','emailEmployeeRevival',$this->getCompany()->getEmailWithName(), 
                        $this->getQuotation()->getEmployeeUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - Offer did not respond')),
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

