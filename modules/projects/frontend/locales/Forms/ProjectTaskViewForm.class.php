<?php

class ProjectTaskViewForm extends ProjectTaskBaseForm {
    
     
      function configure()
      {
          parent::configure();
          $this->setValidator('state_id',new mfValidatorChoice(array('required'=>false,'key'=>true,'choices'=>ProjectTaskState::getStatesForI18nSelect()->unshift(array(''=>'')))));
      }
    
}
