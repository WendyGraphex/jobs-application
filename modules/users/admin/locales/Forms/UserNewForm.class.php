<?php

class UserNewForm extends UserBaseForm {
    
     protected $user=null;
            
     function __construct($user, $defaults = array(), $site = null) {
         $this->user=$user;
         parent::__construct($user->getCountry(), $defaults, $site);
     }
     
     function getUser()
     {
         return $this->user;
     }
     
     function configure() {     
        parent::configure();            
        $this->setValidator('password',new mfValidatorString(array('required'=>false)));
        $this->setValidator('repassword',new mfValidatorString(array('required'=>false)));
       /* if (!$this->getUser()->hasGroups(array('telepro_manager','sales_manager')))
        {              
            $this->setValidator('groups',new mfValidatorChoice(array('key'=>true,'required'=>false,'multiple'=>true,'choices'=>GroupUtils::getGroups('admin'))));
        }
        else
        {
            unset($this['team_id']);
        }  */  
        unset($this['id'],$this['picture']);
        $this->validatorSchema->setPostValidator(new mfValidatorSchemaCompare('password', mfValidatorSchemaCompare::EQUAL, 'repassword',array(),array("invalid"=>__("password and repassword must be equal."))));
        if ($this->getDefault('password'))
            $this->repassword->setOption('required',true);
        
    }
    
  /*  function getValues()
    {
        $this->values['is_active']='YES';
        if ($this->getUser()->hasGroups(array('telepro_manager')))
        {
            // Function
            $telepro_function=new UserFunction('TELEPRO');
            $this->values['functions']=array($telepro_function->get('id'));
            // Group
            $telepro_group=new Group('telepro','admin');
            $this->values['groups']=array($telepro_group->get('id'));
            // Team
            $team=$this->getUser()->getGuardUser()->getManagerTeam();
            if ($team)
                $this->values['team_id']=$team->get('id'); 
        }  
        if ($this->getUser()->hasGroups(array('sales_manager')))
        {
            // Function
            $sale_function=new UserFunction('SALES');
            $this->values['functions']=array($sale_function->get('id'));
            // Group
            $sale_group=new Group('commercial ','admin');
            $this->values['groups']=array($sale_group->get('id'));
            // Team
            $team=$this->getUser()->getGuardUser()->getManagerTeam();
            if ($team)
                $this->values['team_id']=$team->get('id'); 
        }          
        return parent::getValues();
    }*/
}