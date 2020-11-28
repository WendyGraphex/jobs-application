<?php


class customers_academy_ajaxRefuseCourseI18nAction extends mfAction
{

    function execute(mfWebRequest $request)
    {         
        $messages = mfMessages::getInstance();   
        try
        {
            $course_i18n = new CustomerAcademyCourseI18n($request->getPostParameter('CustomerAcademyCourseI18n'));  
            if ($course_i18n->isNotLoaded())
                 throw new mfException(__('Course is invalid.'));
            $course_i18n->refuse();
            
          //   $engine = new EmployeeAdvertI18nEmailEngine($course_i18n);
          //  $engine->sendRefused();
          $response=array(
                         'action'=>'RefuseCourseI18n',
                         'info'=>__('Course is refused.')
                        );
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response; 
    }

}




