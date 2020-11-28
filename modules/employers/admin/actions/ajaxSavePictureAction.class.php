<?php

require_once __DIR__."/../locales/Forms/EmployerPictureForm.class.php";

class employers_ajaxSavePictureAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {     
        $messages = mfMessages::getInstance();
        try
        {          
           
            $form = new EmployerPictureForm();
            $form->bind($request->getPostParameter('Employer'),$request->getFiles('Employer'));
            $response=null;
            if ($form->isValid())
            {    
                $item=new Employer($form['id']->getValue());
                if ($form->hasValue('picture') && $item->isLoaded())
                {  
                    $file=$form->getValue('picture');
                    $file->setFilename($item->getNameForPicture());
                    $file->save($item->getPicture()->getPath());
                    $item->set('picture',$file->getFilename());
                    $item->save();
                    $response=array("picture"=>$item->get('picture'),"id"=>$item->get('id'));
                }  
            }     
            // else var_dump($form->getErrorSchema());
        }
        catch (mfException $e)
        {
           $messages->addError($e);
        }  
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;        
    }

}
