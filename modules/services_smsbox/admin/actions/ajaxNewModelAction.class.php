<?php

require_once __DIR__ . "/../locales/Forms/SmsBoxModelNewForm.class.php";


class services_smsbox_ajaxNewModelAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();
        try 
        {
            $this->item = new SmsBoxModel();
            $this->form = new SmsBoxModelNewForm($this->getUser(), $request->getPostParameter('SmsBoxModel'));
            if (!$request->isMethod('POST') ||  !$request->getPostParameter('SmsBoxModel'))
                return ;
            $this->form->bind($request->getPostParameter('SmsBoxModel'));

            if ($this->form->isValid()) {
                $this->item->add($this->form->getValues());
                if ($this->item->isExist())
                    throw new mfException ("Le modèle existe déjà");                
                $this->item->save();                
                $messages->addInfo("Le modèle a été créé.");                
                $this->forward('services_smsbox', 'ajaxListPartialModel');
            } 
            else 
            {
                $this->item->add($request->getPostParameter('SmsBoxModel'));
                $messages->addError("Le formulaire comporte des erreurs.");
              //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }         
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
    }

}
