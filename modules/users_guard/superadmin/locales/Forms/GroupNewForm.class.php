<?php

class GroupNewForm extends CompagneBaseForm {

   function configure() { 
        parent::configure();    
        unset($this['id']);
    }

}
