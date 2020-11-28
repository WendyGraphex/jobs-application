<?php

class UserSuperAdminNewForm extends UserSuperAdminBaseForm {

     function configure()
     {
        parent::configure();
        unset($this['id']);
     }
}