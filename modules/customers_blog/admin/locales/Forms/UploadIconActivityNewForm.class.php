<?php

require_once __DIR__."/UploadIconActivityForm.class.php";

class UploadIconActivityNewForm extends UploadIconActivityForm {
    
    protected $activity =null;
    
    function configure() {
        parent::configure();
        $this->addValidators(array(
            'node_id'=>new ObjectExistsValidator('CustomerBlogActivity',array('key'=>false)),
            'id'=>new ObjectExistsValidator('CustomerBlogActivity',array('key'=>false,'empty_value'=>null,'required'=>false)),           
        ));                
    }
    
    function getNode()
    {
        return $this['node_id']->getValue();
    }
    
    function hasActivity()
    {
        return (boolean)$this['id']->getValue();
    }
    
    function getActivity()
    {
        if ($this->activity===null)
        {    
            $this->activity = $this->hasActivity()?$this['id']->getValue():$this->getNode()->create();
        }
        return $this->activity;
    }
}
