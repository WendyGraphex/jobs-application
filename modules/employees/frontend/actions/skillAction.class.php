<?php

require_once __DIR__."/../locales/Forms/EmployeeSearchFilterParameters.class.php";

class employees_skillAction extends mfAction {
        
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();              
        $this->skill_i18n= new EmployeeSkillI18n(array('url'=>new mfString($request->getRequestParameter('skill')),'lang'=>$this->getUser()->getLanguage()));
        if ($this->skill_i18n->isNotLoaded())
            $this->forward ('employees', 'skills');
        $search = new EmployeeSearchFilterParameters();
        $search->in()->set('skill_id',$this->skill_i18n->getSkill()->get('id'));          
        $request->addRequestParameter('search', $search);
    }
}


