<?php

class social_networks_ajaxSaveSocialAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();            
        try
        {        
                $this->item=new SocialNetwork($request->getPostParameter('SocialNetwork'));   
                if ($this->item->isLoaded())
                {    
                    $this->form = new SocialNetworkViewForm();
                    $this->form->bind($request->getPostParameter('SocialNetwork'));
                    if ($this->form->isValid()) {
                        $this->item->add($this->form->getValues());    
                        if ($this->item->isExist())
                            throw new mfException (__("Social network already exists"));
                        $this->item->save();                        
                        $messages->addInfo(__("social network [%s] has been saved.",$this->item->get('name')));
                        $this->forward('social_networks','ajaxListPartialSocial');
                    }
                    else
                    {
                        $this->item->add($request->getPostParameter('SocialNetwork'));    // Repopulate
                     //   $messages->addErrors($this->form->getErrorSchema()->getErrors()); // For debug only
                       $messages->addError(__("Form has errors."));
                    }    
                }
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }      
    }

}

