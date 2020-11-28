<?php

class UserSuperAdminForm extends UserSuperAdminBaseForm {

   
    
     function configure() {     
        parent::configure();           
        unset($this['id'],$this['picture']);
    }
    
}