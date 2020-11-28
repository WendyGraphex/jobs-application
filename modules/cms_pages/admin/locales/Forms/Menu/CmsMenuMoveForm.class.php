<?php

class CmsMenuMoveForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
            'node'=>new ObjectExistsValidator('CmsMenu',array('key'=>false)),
            'sibling_id'=>new ObjectExistsValidator('CmsMenu',array('key'=>false,'required'=>false,'empty_value'=>null)),
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

