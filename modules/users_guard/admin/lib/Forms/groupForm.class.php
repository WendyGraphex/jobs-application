<?php

class groupForm extends CompagneBaseForm {

    function configure() {       
        parent::configure();
        $this->setValidator('id',new mfValidatorInteger());
    }
}
