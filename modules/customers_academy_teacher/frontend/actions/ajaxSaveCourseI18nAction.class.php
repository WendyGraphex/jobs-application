<?php

require_once __DIR__."/../locales/Forms/CustomerAcademyCourseI18nViewForm.class.php";

class customers_academy_teacher_ajaxSaveCourseI18nAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
       if (!$this->getUser()->isTeacherUser())             
            $this->forwardTo401Action();          
        $messages = mfMessages::getInstance();   
        $this->user=$this->getUser();
        $this->course_i18n = new CustomerAcademyCourseI18n($request->getPostParameter('CustomerAcademyCourseI18n'),$this->getUser()->getGuardUser());
        if ($this->course_i18n->isNotLoaded())
            return ;
        $this->form = new CustomerAcademyCourseI18nViewForm($this->course_i18n,$request->getPostParameter('CustomerAcademyCourseI18n'));   
        if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerAcademyCourseI18n'))
            return ;
        $this->form->bind($request->getPostParameter('CustomerAcademyCourseI18n'));
        if ($this->form->isValid())
        {           
         //  echo "<pre>"; var_dump($this->form->getValues());
           $this->course_i18n->add($this->form->getValues())->save();
           $messages->addInfo(__('Course has been updated.'));          
           $this->forward($this->getModuleName(), 'ajaxListPartialCourse');
        }   
        else
        {
          //  echo "KO";
          //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
           $messages->addError(__('Form has some errors.'));
        }         
    }

}




