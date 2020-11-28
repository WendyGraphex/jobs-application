<?php


class customers_academy_emailCourseCreatedAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->course_i18n=$this->getParameter('course_i18n')->getFormatter()->toArrayForEmail();
          // var_dump($this->advert['employee']);
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');         
           EmailVariablesModel::getVariables($this);
           //echo "<pre>"; var_dump($this->socials);
    }
    
 
   
}


