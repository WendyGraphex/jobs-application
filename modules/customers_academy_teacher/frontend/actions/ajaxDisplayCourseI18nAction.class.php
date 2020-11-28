<?php

require_once __DIR__."/../locales/Forms/CustomerAcademyCourseI18nViewForm.class.php";

class customers_academy_teacher_ajaxDisplayCourseI18nAction extends mfAction
{

    function execute(mfWebRequest $request)
    {         
          if (!$this->getUser()->isTeacherUser())             
            $this->forwardTo401Action();         
        $messages = mfMessages::getInstance();   
        $this->course_i18n = new CustomerAcademyCourseI18n($request->getPostParameter('CustomerAcademyCourseI18n'),$this->getUser()->getGuardUser()); 
        $this->form = new CustomerAcademyCourseI18nViewForm($this->course_i18n,array()); 
    }

}




