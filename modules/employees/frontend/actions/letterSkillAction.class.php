<?php

require_once __DIR__."/../locales/Forms/EmployeeSearchFilterParameters.class.php";

class employees_letterSkillAction extends mfAction {
        
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();        
        $skills = EmployeeSearchSkillLetter::getSkillsByLetter($request->getRequestParameter('letter'));
        
        $search = new EmployeeSearchFilterParameters();
        $search->in()->set('skill_id',$skills->getKeys()->toArray());     
        $search->getSearches()->push(__('Skills begins by "%s": %s',[$request->getRequestParameter('letter'), $skills->implode(', ')]));       
        $request->addRequestParameter('search', $search);
        $this->forward($this->getModuleName(), 'employees');
    }
}

