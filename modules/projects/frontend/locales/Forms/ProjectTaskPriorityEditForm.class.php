<?php


class ProjectTaskPriorityEditForm extends mfForm {
    
    
     function configure()
    {
       $this->setValidators(array(
             'priority'=> new mfValidatorInteger(array('required'=>false,'min'=>0,'empty_value'=>null)),
             'id'=>new mfValidatorInteger(),
       ));             
    }
    
   
}

