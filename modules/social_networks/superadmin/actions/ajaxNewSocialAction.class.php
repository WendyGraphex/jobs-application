<?php

class social_networks_ajaxNewSocialAction extends mfAction {
    
    const SITE_NAMESPACE = 'system/site';
    
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();
        $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);         
        $this->forwardIf(!$site,"sites","Admin");       
        try
        {                                         
                $this->form = new SocialNetworkNewForm($request->getPostParameter('socialnetwork'),$site);                   
                $this->item=new SocialNetwork(null,$site); // Load Company if exists
                if ($request->getPostParameter('socialnetwork'))
                {    
                    $this->form->bind($request->getPostParameter('socialnetwork'),$request->getFiles('socialnetwork'));
                    if ($this->form->isValid()) 
                    {
                        $this->item->add($this->form->getValues());
                        if ($this->form->hasValue('picture'))
                        {  
                            $picture=$this->form->getValue('picture');
                            $picture->setFilename(preg_replace('/[^a-z0-9]/iu','', $this->item->get('name')));                                                       
                            $this->item->set('picture',$picture->getFilename().".".$picture->getExtension());                       
                        }
                        $this->item->save(); 
                        if ($picture)
                        {
                           $picture->save($this->item->getPicture()->getPath()); 
                        }    
                        $messages->addInfo(__("social network [%s] has been saved",$this->item->get('name')));
                        $this->forward('social_networks','ajaxListPartialSocial');
                    }
                    else
                    {                      
                        $messages->addError(__("form has some errors."));
                        $this->item->add($request->getPostParameter('socialnetwork'));                        
                    }    
                }                                 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }

}

