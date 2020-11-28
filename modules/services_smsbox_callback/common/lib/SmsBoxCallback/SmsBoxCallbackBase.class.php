<?php
 
class SmsBoxCallbackBase extends mfObject3 {
     
    protected static $fields=array('modem','ts','reference','mobile','accuse','error_callback','created_at');
    const table="t_services_smsbox_callback"; 
   
    protected static $errors=array("-3"=>"Message recrédité",
                            "-2"=>"En attente d'envoi",
                            "-1"=>"Statut inconnu",
                            "0"=>"Message reçu",
                            "1"=>"Echec de la transmission",
                            "2"=>"Message rejeté",
                            "3"=>"Mobile de destination inactif",
                            "4"=>"Mobile de destination ne répond pas",
                            "5"=>"Erreur lors de la réception",
                            "6"=>"Mobile de destination saturé",
                            "7"=>"Numéro de destination inconnu",
                            "8"=>"Message non-routable",
                            "9"=>"Message transmis",
                            "10"=>"Message envoyé",
                            "11"=>"Envoi en cours",                          
                           );
    
    function __construct($parameters=null,$site=null) {
        parent::__construct(null,$site);   
        $this->getDefaults(); 
        if ($parameters === null)  return $this;      
        if (is_array($parameters)||$parameters instanceof ArrayAccess)
        {
            if (isset($parameters['id']))
               return $this->loadbyId((string)$parameters['id']); 
            if (isset($parameters['reference']))
                return $this->loadByReference((string)$parameters['reference']);
            return $this->add($parameters); 
        }   
        else
        {
            if (is_numeric((string)$parameters)) 
               return $this->loadbyId((string)$parameters);   
        }   
    }
    
    protected function loadByReference($reference)
    {        
        $this->set('reference',$reference);
        $db=mfSiteDatabase::getInstance()->setParameters(array($reference));
        $db->setQuery("SELECT * FROM ".self::getTable()." WHERE reference='%s';")
           ->makeSqlQuery();                           
        return $this->rowtoObject($db);    
    }   
    

    
    
    protected function getDefaults()
    {
        $this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");             
    }
     

                
    /*
    protected function executeIsExistQuery($db)    
    {      
        $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
        $db->setParameters(array('reference'=>$this->get('reference'),$this->getKey()))
           ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE reference='{reference}' ".$key_condition)
           ->makeSiteSqlQuery($this->site);      
    }*/
    
   function create($values)
   {       
       foreach (array('ts','reference','numero'=>'mobile','accuse') as $name=>$field)    
           $this->set($field,$values[is_numeric($name)?$field:$name]);
       $this->save();
       return $this;
   }
   
   
   function getAccuse()
   {
       return isset(self::$errors[$this->get('accuse')])?self::$errors[$this->get('accuse')]:"Inconnu";       
   }
   
   function getTs()
   {       
       return $this->_ts=$this->_ts===null?new DateTimeFormatter((string)Timestamp::getInstance($this->get('ts'))):$this->_ts;
   }
   
   function getMobile()
   {
       return "+".$this->get('mobile');
   }
   
   function getCallbackErrorForSelect()
   {
       return  new mfArray(self::$errors);
   }
}
