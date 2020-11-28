<?php

class social_networks_ajaxSaveSocialAction extends mfAction {
    
    const SITE_NAMESPACE = 'system/site';
    
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();
        $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);    
        $this->forwardIf(!$site,"sites","Admin");        
        try
        {        
                $this->item=new SocialNetwork($request->getPostParameter('socialnetwork'),$site);   
                if ($this->item->isLoaded())
                {    
                    $this->form = new SocialNetworkViewForm();
                    $this->form->bind($request->getPostParameter('socialnetwork'));
                    if ($this->form->isValid()) {
                        $this->item->add($this->form->getValues());    
                        if ($this->item->isExist())
                            throw new mfException (__("social network already exists"));
                        $this->item->save();                        
                        $messages->addInfo(__("social network [%s] has been saved.",$this->item->get('name')));
                        $this->forward('social_networks','ajaxListPartialSocial');
                    }
                    else
                    {
                        $this->item->add($request->getPostParameter('socialnetwork'));    // Repopulate
                        $messages->addErrors($this->form->getErrorSchema()->getErrors()); // For debug only
                       $messages->addError(__("form has errors."));
                    }    
                }
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }      
    }

}

