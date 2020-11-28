<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademyCourseI18nNewForm.class.php";

class customers_academy_teacher_ajaxNewCourseI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
          if (!$this->getUser()->isTeacherUser())             
            $this->forwardTo401Action();    
        $this->user=$this->getuser();
        $this->form= new CustomerAcademyCourseI18nNewForm($this->getUser()->getGuardUser(),$request->getPostParameter('CustomerAcademyCourseI18n'));
          if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerAcademyCourseI18n'))
            return ;
        $this->form->bind($request->getPostParameter('CustomerAcademyCourseI18n'));
        if ($this->form->isValid())
        {
           $this->form->getCourseI18n()->create();           
             
          /* $engine = new EmployeeAdvertEmailEngine($this->form->getAdvert());
           $engine->sendCreated();
           
           $this->getEventDispather()->notify(new mfEvent($this->form->getAdvert(), 'employee.advert.create')); */
                      
           $messages->addInfo(__('Course has been created.'));          
           $this->forward($this->getModuleName(), 'ajaxListPartialCourse');
        }   
        else
        {
          //  echo "KO";
            var_dump($this->form->getErrorSchema()->getErrorsMessage());
           $messages->addError(__('Form has some errors.'));
        }      
    }

}
