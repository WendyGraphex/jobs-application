<?php

require_once dirname(__FILE__)."/../locales/Import/Status/SmsboxCallbackImport.class.php";



class services_smsbox_callback_ajaxImportCallbackAction  extends mfAction
{

   function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();
        $this->user = $this->getUser();          
        if (!$request->isXmlHttpRequest() && $request->getPostParameter('iFrame')=='true')
             $request->forceXMLRequest();                                       
        try
        {              
            $this->form=new SmsboxCallbackImportFileForm($request->getPostParameter('ImportSmsboxCallback'));                                                  
            if (!$request->isMethod('POST') || !$request->getPostParameter('ImportSmsboxCallback'))          
               return ;            
            $this->form->bind($request->getPostParameter('ImportSmsboxCallback'),$request->getFiles('ImportSmsboxCallback'));
            if (!$this->form->isValid())                       
                throw new mfException(__('Form has some errors.'));                        
            $import=new SmsboxCallbackImport($this->form->getFile(),$this->form->getStatus());     
            $import->execute();       
            $messages->addInfo(__('Le statut de %s retours ont été modifiés.',$import->getNumberOfSms()));   
            $messages->addInfo(__('File has been imported.'));
            $this->forward($this->getModuleName(),'ajaxListPartialCallback');                           
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }

}

