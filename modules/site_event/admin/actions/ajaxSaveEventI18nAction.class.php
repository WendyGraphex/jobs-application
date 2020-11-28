<?php


 require_once dirname(__FILE__)."/../locales/Forms/SiteEventViewForm.class.php";
 
class  site_event_ajaxSaveEventI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new SiteEventViewForm($request->getPostParameter('SiteEventI18n'));                 
        try
        {   
                     
            $this->event_i18n=new SiteEventI18n($this->form->getDefault('event_i18n'));               
            $this->form->bind($request->getPostParameter('SiteEventI18n'),$request->getFiles('SiteEventI18n'));                            
            if ($this->form->isValid())
            {              
                $this->event_i18n->add($this->form->getValuesForEventI18n());
                $this->event_i18n->getEvent()->add($this->form->getValuesForEvent());  
                 if ($this->event_i18n->getEvent()->isExist() || $this->event_i18n->isExist())
                    throw new mfException (__("Event already exists"));                 
             //   $this->event_i18n->getEvent()->setIcon($this->form->getIcon());             
                $this->event_i18n->getEvent()->setPicture($this->form->getPicture());        
                $this->event_i18n->getEvent()->save();
                $this->event_i18n->save(); 
                $messages->addInfo(__('Event has been saved.'));
                $request->addRequestParameter('lang',$this->event_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialEvent');
            }   
            else
            {                    
              //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__('Form has some errors.'));              
                $this->event_i18n->add($this->form->getValuesForEventI18n());
                $this->event_i18n->getEvent()->add($this->form->getValuesForEvent());     
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

