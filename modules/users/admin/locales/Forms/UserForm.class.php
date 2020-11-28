<?php

class UserForm extends UserBaseForm {

    function configure()
    {
        parent::configure();
        unset($this['team_id']);
    }
    
}