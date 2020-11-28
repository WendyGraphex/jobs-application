<?php

require_once __DIR__."/../locales/Forms/SitePictureForm.class.php";
 
class site_ajaxSavePictureAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();        
        $response=null;
        $form = new SitePictureForm();
        $form->bind($request->getPostParameter('Site'),$request->getFiles('Site'));
        if ($form->isValid())
        {    
            $item=new Site((string)$form['id']);
            if ($item->isLoaded() && $form->hasValue('picture'))
            {  
                $file=$form->getValue('picture');
                $item->setPictureFile($file);                
                $file->save($item->getPicture()->getPath());               
                $item->save();                
                $response=array("picture"=>$item->get('picture'),"id"=>$item->get('site_id'));
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

