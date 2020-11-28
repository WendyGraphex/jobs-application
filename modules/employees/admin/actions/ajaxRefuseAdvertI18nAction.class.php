<?php


class employees_ajaxRefuseAdvertI18nAction extends mfAction
{

    function execute(mfWebRequest $request)
    {         
        $messages = mfMessages::getInstance();   
        try
        {
            $advert_i18n = new EmployeeAdvertI18n($request->getPostParameter('EmployeeAdvertI18n'));  
            if ($advert_i18n->isNotLoaded())
                 throw new mfException(__('Job is invalid.'));
            $advert_i18n->refuse();
            
             $engine = new EmployeeAdvertI18nEmailEngine($advert_i18n);
            $engine->sendRefused();
          $response=array(
                         'action'=>'RefuseAdvertI18n',
                         'info'=>__('Job is refused.')
                        );
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response; 
    }

}




