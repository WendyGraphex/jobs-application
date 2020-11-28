<?php

require __DIR__."/../locales/Forms/SystemEmailerEmailForm.class.php";

class system_emailer_ajaxSendEmailAction extends mfAction {
    
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();        
        try
        {                 
            $domain=new mfUrl(mfConfig::getSuperAdmin('host'));
            $this->form=new SystemEmailerEmailForm();
            $this->form->setDefault('from','contact@'.$domain->getDomainTLS());           
            $this->form->bind($request->getPostParameter('SystemEmailer'));
            if (!$this->form->isValid())                                     
                    throw new mfException(__("Form has some erros."));                    
            // $this->getMailer()->debug();                     
             $from = $this->form->getValue('from')?$this->form->getValue('from'):$this->form->getDefault('from');       
             $this->getMailer()->sendMail('system_emailer','emailTest',$from,$this->form->getValue('email'),__('Test email'),$this);
             $response=array('info'=>__('Email has been sent to %s',$this->form->getValue('email')));                       
        } 
        catch (Exception $e) {
           $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;      
    }

}

