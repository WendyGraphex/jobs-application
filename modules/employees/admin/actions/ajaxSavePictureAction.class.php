<?php

require_once __DIR__."/../locales/Forms/EmployeePictureForm.class.php";

class employees_ajaxSavePictureAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {     
        $messages = mfMessages::getInstance();
        try
        {          
           
            $form = new EmployeePictureForm();
            $form->bind($request->getPostParameter('Employee'),$request->getFiles('Employee'));
            $response=null;
            if ($form->isValid())
            {    
                $item=new Employee($form['id']->getValue());
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
