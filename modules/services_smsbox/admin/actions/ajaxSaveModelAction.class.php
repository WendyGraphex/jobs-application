<?php

require_once __DIR__ . "/../locales/Forms/SmsBoxModelViewForm.class.php";


class services_smsbox_ajaxSaveModelAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();
        try 
        {
            $this->item = new SmsBoxModel($request->getPostParameter('SmsBoxModel'));
            $this->form = new SmsBoxModelViewForm($request->getPostParameter('SmsBoxModel'));
            if (!$request->isMethod('POST') ||  !$request->getPostParameter('SmsBoxModel') || $this->item->isNotLoaded())
                return ;
            $this->form->bind($request->getPostParameter('SmsBoxModel'));
            if ($this->form->isValid()) {
                $this->item->add($this->form->getValues());
                if ($this->item->isExist())
                    throw new mfException ("Le modèle existe déjà");                
                $this->item->save();                
                $messages->addInfo("Le modèle a été mis à jour.");                
                $this->forward('services_smsbox', 'ajaxListPartialModel');
            } 
            else 
            {
                $this->item->add($request->getPostParameter('SmsBoxModel'));
                $messages->addError("Le formulaire comporte des erreurs.");               
            }         
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
    }

}
