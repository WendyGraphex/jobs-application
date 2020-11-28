<?php


require_once __DIR__."/SystemModelTextI18nForm.class.php";


class SystemModelTextViewForm extends mfForm {
      

    function configure()
    {
        $this->embedForm('model', new SystemModelTextBaseForm($this->getDefault('model')));
        $this->embedForm('model_i18n', new SystemModelTextI18nForm($this->getDefault('model_i18n')));
        unset($this->model_i18n['id'],$this->model['id'],$this->model['type']);
    }


}
