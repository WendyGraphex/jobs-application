<?php

class CustomerBlogActivityMenuMoveForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
            'node'=>new ObjectExistsValidator('CustomerBlogActivityMenu',array('key'=>false)),
            'sibling_id'=>new ObjectExistsValidator('CustomerBlogActivityMenu',array('key'=>false,'required'=>false,'empty_value'=>null)),
        ));
    }
    
    function getNode()
    {
        return $this['node']->getValue();
    }
    
    function hasSibling()
    {
        return (boolean)$this['sibling_id']->getValue(); 
    }
    
    function getSibling()
    {
        return $this['sibling_id']->getValue();
    }
}

