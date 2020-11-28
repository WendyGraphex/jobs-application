<?php

 class GroupI18nForm extends GroupI18nBaseForm {

    function configure()
    {
        parent::configure();
        $this->setValidator('group_id', new mfValidatorInteger());
    }
    
 
}


