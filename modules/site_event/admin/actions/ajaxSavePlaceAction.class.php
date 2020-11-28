<?php

require_once __DIR__."/../locales/Forms/SiteEventPlaceViewForm.class.php";
 

class site_event_ajaxSavePlaceAction extends mfAction {
    
   
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();       
        try
        {        
                $this->item=new SiteEventPlace($request->getPostParameter('SiteEventPlace'));   
                if ($this->item->isNotLoaded() || !$request->isMethod('post') || !$request->getPostParameter('SiteEventPlace'))
                   return ;
                $this->form = new SiteEventPlaceViewForm();
                $this->form->bind($request->getPostParameter('SiteEventPlace'));
                if ($this->form->isValid()) {
                    $this->item->add($this->form->getValues());    
                    if ($this->item->isExist())
                        throw new mfException (__("Event place already exists"));
                    $this->item->save();                        
                    $messages->addInfo(__("Event place [%s] has been saved.",$this->item->get('name')));
                    $this->forward($this->getModuleName(),'ajaxListPartialPlace');
                }
                else
                {
                   $this->item->add($request->getPostParameter('SiteEventPlace'));    // Repopulate                     
                   $messages->addError(__("Form has some errors."));
                }    
             
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }      
    }

}

