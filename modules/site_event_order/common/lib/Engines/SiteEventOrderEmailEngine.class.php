<?php


class SiteEventOrderEmailEngine extends mfEmailEngineCore { 
    
    protected $order=null,$settings=null;
        
    function __construct(SiteEventOrder $order,$options=array()) {
       $this->order=$order;
       parent::__construct($options);
       $this->settings=new SiteEventOrderSettings();
       $this->debug();          
    }
    
    function getOrder()
    {
        return $this->order;
    }
       
    function getSettings()
    {
        return $this->settings;
    }
    
    
    function sendCancelled()
    {                 
         try 
         {                        
             $model_i18n= $this->getSettings()->getOrderCancelledEmailModel()->getI18n();            
             $this->getMailer()->sendMail('site_event_order','emailUserCancelled',$this->getCompany()->getEmailWithName(), 
                        $this->getOrder()->getEventUser()->get('email'), 
                        $model_i18n->get('subject',__('Graphex - order cancelled')),
                        array('order'=>$this->getOrder(),                           
                              'model_i18n'=>$model_i18n,
                              'company'=>$this->getCompany()),
                        array(), // files
                        array(), //cc
                        $this->getSettings()->getAdminRecipients()->toArray() // bcc
                    );       
            
            
            
            
            
            
            $email_spooler=new EmailerSpooler();
            
         /*   $message =$this->getAction()->getComponent('/sales_order/emailEmployeeCancelled', array('COMMENT'=>false,
                                                                                        'company'=>$this->getCompany(),
                                                                                        'order'=>$this->getOrder(),                
                                                                                        'model_i18n'=>$model_i18n))->getContent();            
            if ($this->getMailer()->isDebug()) echo $message;            
            $email_spooler->add(array(
                            'to'=>$this->getAdvertI18n()->getAdvert()->getEmployerUser()->get('email'),                                               
                            'from'=>$this->getCompany()->get('email'),
                            'bcc'=>(string)$this->getSettings()->getAdminRecipients()->implode(),
                            'body'=>$message,
                            'subject'=>$model_i18n->get('subject',__('Graphex - order cancelled')),
                            ));
            self::getSpooler()->push($email_spooler);       */  
            
         } catch (Swift_TransportException $e) {
               echo $e->getMessage();
           throw new mfException(__('Error occurs during email sending.'));
        } catch (Swift_MimeException $e) {
              echo $e->getMessage();
           throw new mfException(__('Error occurs during email sending.'));
        }       
         catch (Exception $e) {
             echo $e->getMessage();
           throw new mfException(__('Error occurs during email sending.'));
        } 
        return $this;
    }
    
     
}

