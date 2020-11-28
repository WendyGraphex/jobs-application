<?php

require_once __DIR__."/../locales/Forms/SiteEventSpeakerUserForm.class.php";

class site_event_ajaxSaveSpeakerUserAction extends mfAction {

    function execute(mfWebRequest $request) {                  
        $messages = mfMessages::getInstance();
        try {
            $this->form = new SiteEventSpeakerUserForm($this->getUser()->getLanguage());
            $this->user=new SiteEventSpeakerUser($request->getPostParameter('SiteEventSpeakerUser'));           
            $this->form->bind($request->getPostParameter('User'));
            if ($this->form->isValid()) {
                $this->user->add($this->form->getValues());
                if ($this->user->isExist())
                   throw new mfException(__("Speaker User already exists."));               
                $this->user->save();
                $messages->addInfo(__("Speaker User [%s] has been updated.",(string)$this->user));
                $this->forward($this->getModuleName(),'ajaxListPartialSpeakerUser');
            }
            else
            {
                 $messages->addError(__("Form has some errors."));
                 $this->user->add($request->getPostParameter('SiteEventSpeakerUser')); // Repopulate                 
            }    
        } 
        catch (mfException $e)
        {
           $messages->addError($e);
        }             
    }
}
