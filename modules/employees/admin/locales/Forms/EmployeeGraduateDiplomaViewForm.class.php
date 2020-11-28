<?php



class EmployeeGraduateDiplomaViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('graduate', new EmployeeGraduateDiplomaForm($this->getDefault('graduate')));
        $this->embedForm('graduate_i18n', new EmployeeGraduateDiplomaI18nForm($this->getDefault('graduate_i18n')));
        unset($this->graduate_i18n['id'],$this->graduate['id']);
    }

   
    
    function getValuesForGraduateDiploma()
    {
        return  $this['graduate']->getValue();             
    }
    
    function getValuesForGraduateDiplomaI18n()
    {
        return $this['graduate_i18n']->getValue();      
    }
}
