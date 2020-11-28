<?php


class customers_academy_ajaxPublishCourseI18nAction extends mfAction
{

    function execute(mfWebRequest $request)
    {         
        $messages = mfMessages::getInstance();   
        try
        {
            $course_i18n = new CustomerAcademyCourseI18n($request->getPostParameter('CustomerAcademyCourseI18n'));  
            if ($course_i18n->isNotLoaded())
                 throw new mfException(__('Job is invalid.'));
            $course_i18n->publish();    
          //  $engine = new EmployeeAdvertI18nEmailEngine($course_i18n);
          //  $engine->sendPublished();
            
            $response=array(
                         'action'=>'PublishCourseI18n',
                         'info'=>__('Course is published.')
                        );
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}




