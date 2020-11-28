<?php


require_once __DIR__."/GroupI18nForm.class.php";


class GroupViewForm extends mfForm {
      
   
    function configure()
    {
        $this->embedForm('group', new CompagneBaseForm($this->getDefault('group')));
        $this->embedForm('group_i18n', new GroupI18nForm($this->getDefault('group_i18n')));
        unset($this->group_i18n['id'],$this->group['id']);
    }

 

}
