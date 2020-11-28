<?php

class social_networks_ajaxNewSocialAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();          
        try
        {                                         
            $this->form = new SocialNetworkNewForm($request->getPostParameter('SocialNetwork'));                   
            $this->item=new SocialNetwork(); // Load Company if exists
            if (!$request->getPostParameter('SocialNetwork') || !$request->isMethod('POST'))
                return ;               
            $this->form->bind($request->getPostParameter('SocialNetwork'),$request->getFiles('SocialNetwork'));
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
                $this->item->add($request->getPostParameter('SocialNetwork'));                        
            }                                            
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }

}

