<?php

require_once __DIR__."/../locales/Forms/SiteLogoForm.class.php";
 
class site_ajaxSaveLogoAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();        
        $response=null;
        $form = new SiteLogoForm();
        $form->bind($request->getPostParameter('Site'),$request->getFiles('Site'));
        if ($form->isValid())
        {    
            $item=new Site((string)$form['id']);
            if ($item->isLoaded() && $form->hasValue('logo'))
            {  
                $file=$form->getValue('logo');
                $item->setLogoFile($file);                
                $file->save($item->getLogo()->getPath());               
                $item->save();                
                $response=array("logo"=>$item->get('logo'),"id"=>$item->get('site_id'));
            }   
        }
        else
        {
            //var_dump($form->getErrorSchema()->getErrorsMessage());
            $messages->addErrors($form->getErrorSchema()->getErrors());
        }    
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

