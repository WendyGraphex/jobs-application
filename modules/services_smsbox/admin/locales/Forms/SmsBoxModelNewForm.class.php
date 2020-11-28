<?php


class SmsBoxModelNewForm extends SmsBoxModelBaseForm {
    
    function configure() {
        parent::configure();
        unset($this['id']);
    }
}

