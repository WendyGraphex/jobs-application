<?php

 
class social_networks_ajaxSavePictureSocialAction extends mfAction {
    
    const SITE_NAMESPACE = 'system/site';
    
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();
        $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);
        if (!$site)
            return "";
        $response=null;
        $form = new SocialNetworkPictureForm();
        $form->bind($request->getPostParameter('socialnetwork'),$request->getFiles('socialnetwork'));
        if ($form->isValid())
        {    
            $item=new SocialNetwork($form['id'],$site);
            if ($item->isLoaded() && $form->hasValue('picture'))
            {  
                $file=$form->getValue('picture');
                $file->setFilename(preg_replace('/[^a-z0-9]/iu','', $item->get('name')));
                $file->save($item->getPicture()->getPath());
                $item->set('picture',$file->getFilename());
                $item->save();
                // $this->getEventDispather()->notify(new mfEvent($item, 'product.change','picture')); 
                $response=array("picture"=>$item->get('picture'),"id"=>$item->get('id'));
            }   
        }
        else
        {
            $messages->addErrors($form->getErrorSchema()->getErrors());
        }    
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

