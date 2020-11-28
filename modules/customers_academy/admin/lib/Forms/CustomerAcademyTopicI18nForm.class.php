<?php



 class CustomerAcademyTopicI18nForm extends CustomerAcademyTopicI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('topic_id', new mfValidatorInteger());
    }
    
 
}


