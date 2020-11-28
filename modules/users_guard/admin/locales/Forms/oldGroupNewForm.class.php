<?php

class GroupNewForm extends CompagneBaseForm {

   function configure() { 
        parent::configure();    
     //   $this->setDefault('application','admin');
     //   $this->setValidator('application', new mfValidatorChoice(array("choices" => array("admin", "frontend"))));
        unset($this['id']);
    }

}
