<?php


class SocialNetworkViewForm extends SocialNetworkBaseForm {


    function configure()
    {
        parent::configure();               
        unset($this['is_active'],$this['picture']);
    }
 
}
