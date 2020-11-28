<?php

require_once __DIR__."/../locales/Forms/SiteEventPlaceNewForm.class.php";
 
class site_event_ajaxNewPlaceAction extends mfAction {

         
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();   
           if (!$this->getUser()->isEventUser()) 
                $this->forwardTo401Action();
        try 
        {        
            $this->form = new SiteEventPlaceNewForm($this->getUser()->getGuardUser());   
            $this->item = new SiteEventPlace();
            if (!$request->isMethod('POST') || !$request->getPostParameter('SiteEventPlace'))
                return ;
            $this->form->bind($request->getPostParameter('SiteEventPlace'));
            if ($this->form->isValid())
            {
                $this->item->add($this->form->getValues());
                if ($this->item->isExist())
                    throw new mfException(__('Event Place already exists'));
                $this->item->save();
                $messages->addInfo(__('Event place has been created.'));
                $this->forward($this->getModuleName(), 'ajaxListPartialPlace');
            }   
            else
            {
                $messages->addError(__('Form has some errors.'));
                $this->item->add($request->getPostParameter('SiteEventPlace'));
            }    
        } 
        catch (mfException $e)
        {
           $messages->addError($e);
        }      
    }

}