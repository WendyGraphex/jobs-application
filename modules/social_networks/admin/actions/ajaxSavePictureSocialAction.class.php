<?php

 
class social_networks_ajaxSavePictureSocialAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();        
        $response=null;
        $form = new SocialNetworkPictureForm();
        $form->bind($request->getPostParameter('SocialNetwork'),$request->getFiles('SocialNetwork'));
        if ($form->isValid())
        {    
            $item=new SocialNetwork($form['id']);
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

