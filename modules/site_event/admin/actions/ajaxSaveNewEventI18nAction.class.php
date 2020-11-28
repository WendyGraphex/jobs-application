<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteEventNewForm.class.php";

class site_event_ajaxSaveNewEventI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new SiteEventNewForm($this->getUser()->getLanguage(),$request->getPostParameter('SiteEventI18n'));             
            $this->event_i18n=new SiteEventI18n();
            $this->form->bind($request->getPostParameter('SiteEventI18n'),$request->getFiles('SiteEventI18n'));
            if ($this->form->isValid())
            {                
                $this->event_i18n->add($this->form->getValuesForEventI18n());
                $this->event_i18n->getEvent()->add($this->form->getValuesForEvent());     
                $this->event_i18n->getEvent()->add($this->form['event']->getValues());                   
                if ($this->event_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
              //  $this->event_i18n->getEvent()->setIcon($this->form->getIcon());                
                $this->event_i18n->getEvent()->setPicture($this->form->getPicture());           
                $this->event_i18n->getEvent()->create();                                                                      
                $this->event_i18n->set('event_id',$this->event_i18n->getEvent());                                                                                                                                                                                  
                $this->event_i18n->save();
                $messages->addInfo(__("Event has been saved."));
                $request->addRequestParameter('lang',$this->event_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialEvent');
            }   
            else
            {               
               //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
               $this->event_i18n->add($this->form->getValuesForEventI18n());
                $this->event_i18n->getEvent()->add($this->form->getValuesForEvent());     
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
