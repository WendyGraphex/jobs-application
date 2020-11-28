<?php

require_once __DIR__ . "/../locales/Forms/SiteEventSpeakerUserNewForm.class.php";

class site_event_ajaxNewSpeakerUserAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();
        try {
            $this->item = new SiteEventSpeakerUser(); // new object
            $this->form = new SiteEventSpeakerUserNewForm($request->getPostParameter('SiteEventSpeakerUser'));
            if (!$request->isMethod('POST') || !$request->getPostParameter('SiteEventSpeakerUser') != null) 
                return ;
            $this->form->bind($request->getPostParameter('SiteEventSpeakerUser'), $request->getFiles('SiteEventSpeakerUser'));
            if ($this->form->isValid()) {
                $this->item->add($this->form->getValues());
                if ($this->item->isExist())
                    throw new mfException (__("Speaker User already exists"));               
                $this->item->save();      
                $messages->addInfo(__("Speaker User %s has been saved.", $this->item->getFormatter()->getName()));            
                $this->forward($this->getModuleName(), 'ajaxListPartialSpeakerUser');
            } else {
                $this->item->add($request->getPostParameter('SiteEventSpeakerUser'));
                $messages->addError(__("Forms has some errors."));
                var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }
           
        } catch (mfException $e) {
            $messages->addError($e);
        }
    }
}
