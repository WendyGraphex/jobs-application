<?php


require_once __DIR__."/SystemModelEmailI18nForm.class.php";


class SystemModelEmailViewForm extends mfForm {
      

    function configure()
    {
        $this->embedForm('model', new SystemModelEmailBaseForm($this->getDefault('model')));
        $this->embedForm('model_i18n', new SystemModelEmailI18nForm($this->getDefault('model_i18n')));
        unset($this->model_i18n['id'],$this->model['id'],$this->model['type']);
    }


}
