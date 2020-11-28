<?php



class MultipleSelectionTaskProcessForProjectForm extends mfForm {

    protected $user=null,$selection=null,$_actions=null,$project=null;
    
    function __construct(Project $project,$user,$defaults = array(), $options = array()) {
        $this->user=$user;
        $this->project=$project;
        parent::__construct($defaults, $options);
    }
    
    function getUser()
    {
        return $this->user;
    }
    
    function getProject()
    {
        return $this->project;
    }
    
    function configure() {           
        $this->_actions=new mfArray();       
        if (!$this->hasDefaults())
        {    
            $this->setDefaults(array(
              
            ));
        }
        $this->setValidators(array(
            'count'=>new mfValidatorInteger(),   
            'selection'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('selection'))),            
        ));                  
        $this->setValidator('actions', new mfValidatorChoice(array('required'=>false,'multiple'=>true,'choices'=>new mfArray(array('state','requested_at','before_at','start_at','end_at','priority_delete'
                                )))));
        $this->setValidator('state_id',new mfValidatorChoice(array('required'=>false,'key'=>true,'empty_value'=>null,'choices'=>ProjectTaskState::getStatesForI18nSelect()->unshift(array(""=>null))->toArray())));      
        $this->setValidator('requested_at',new mfValidatorI18nDate(array('required'=>false,'empty_value'=>null,'date_format'=>'a')));
        $this->setValidator('before_at',new mfValidatorI18nDate(array('required'=>false,'empty_value'=>null,'date_format'=>'a')));
        $this->setValidator('start_at',new mfValidatorI18nDate(array('required'=>false,'empty_value'=>null,'date_format'=>'a')));
        $this->setValidator('end_at',new mfValidatorI18nDate(array('required'=>false,'empty_value'=>null,'date_format'=>'a')));
    }
    
    
    
    function getActions()
    {
       return $this['actions']->getArray(); 
    }
    
    
    function setSelection(mfArray $selection)
    {
        $this->setDefault('selection',$selection->toArray());
        return $this;
    }
    
    function getSelection()
    {
        return ProjectTask::getCollectionFromSelection($this['selection']->getArray(),$this->getUser()->getGuardUser());
    }         
    
    
       
}