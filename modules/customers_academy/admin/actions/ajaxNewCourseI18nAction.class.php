<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademyCourseI18nNewForm.class.php";

class customers_academy_ajaxNewCourseI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        
        $this->form= new CustomerAcademyCourseI18nNewForm();
        $this->course_i18n=new CustomerAcademyCourseI18n();        
    }

}
