<?php

require_once __DIR__."/../locales/Forms/EmployeeSearchFilterParameters.class.php";

class employees_skillAdvertsAction extends mfAction {
        
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();              
        $skill_i18n= new EmployeeSkillI18n(array('url'=>new mfString($request->getRequestParameter('skill')),'lang'=>$this->getUser()->getLanguage()));
        if ($skill_i18n->isNotLoaded())
            $this->forward ('employees', 'advert404');
        $search = new EmployeeSearchFilterParameters();
        $search->in()->set('skill_id',$skill_i18n->getSkill()->get('id'));     
        $search->getSearches()->push(__('"%s" Skill',$skill_i18n->getTitle()->ucfirst()));
       
        $request->addRequestParameter('search', $search);
        $this->forward($this->getModuleName(), 'adverts');
    }
}


