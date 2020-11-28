<?php


class customers_academy_ajaxDisplayCourseI18nAction extends mfAction
{

    function execute(mfWebRequest $request)
    {              
        $messages = mfMessages::getInstance();   
        $this->course_i18n = new CustomerAcademyCourseI18n($request->getPostParameter('CustomerAcademyCourseI18n'));                                
    }

}




