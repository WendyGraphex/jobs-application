<?php


require_once dirname(__FILE__)."/ProjectTaskStateI18nForm.class.php";


class ProjectTaskStateViewForm extends mfForm {
      
   
    function configure()
    {
        $this->embedForm('state', new ProjectTaskStateBaseForm($this->getDefault('state')));
        $this->embedForm('state_i18n', new ProjectTaskStateI18nForm($this->getDefault('state_i18n')));
        unset($this->state_i18n['id'],$this->state['id']);
    }


}
