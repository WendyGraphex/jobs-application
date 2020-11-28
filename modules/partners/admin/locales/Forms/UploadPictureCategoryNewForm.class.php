<?php

require_once __DIR__."/UploadPictureCategoryForm.class.php";

class UploadPictureCategoryNewForm extends UploadPictureCategoryForm {
    
    protected $category =null;
    
    function configure() {
        parent::configure();
        $this->addValidators(array(
            'node_id'=>new ObjectExistsValidator('PartnerWorkCategory',array('key'=>false)),
            'id'=>new ObjectExistsValidator('PartnerWorkCategory',array('key'=>false,'empty_value'=>null,'required'=>false)),           
        ));                
    }
    
    function getNode()
    {
        return $this['node_id']->getValue();
    }
    
    function hasCategory()
    {
        return (boolean)$this['id']->getValue();
    }
    
    function getCategory()
    {
        if ($this->category===null)
        {    
            $this->category = $this->hasCategory()?$this['id']->getValue():$this->getNode()->create();
        }
        return $this->category;
    }
}
 