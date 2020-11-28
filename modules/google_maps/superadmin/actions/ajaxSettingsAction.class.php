<?php

class google_maps_ajaxSettingsAction extends mfAction {

    const SITE_NAMESPACE = 'system/site';
    
    function execute(mfWebRequest $request) {
         $messages = mfMessages::getInstance();                     
        $this->site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);       
        $this->settings= new GoogleMapsSettings(null,$this->site);   
        $this->form=new GoogleMapsSettingsForm($this->site);        
        if ($request->getPostParameter('Settings'))
        {
            try 
            {               
                $this->form->bind($request->getPostParameter('Settings'));
                if ($this->form->isValid())
                {                 
                    $this->settings->add($this->form->getValues());
                    $this->settings->save();
                    $messages->addInfo(__("Settings have been saved."));
                  //  $this->forward('site','ajaxHome');
                }
                else
                {          
                  $messages->addError(__('settings has some errors.'));
                  $this->settings->add($request->getPostParameter('Settings')); // Repopulate
                }  
            }
            catch (mfException $e)
            {
              $messages->addError($e);
            }
       }

    }

}

