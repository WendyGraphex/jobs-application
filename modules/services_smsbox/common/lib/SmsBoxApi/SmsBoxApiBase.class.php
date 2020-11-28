<?php

/*
 *  0631996438
 * login , password , dest, msg, udh , mode , origin , type, strategy, date, 
 * heure,id,callback,cvar, allow_vocal,personnalise
 */
class SmsBoxApiBase {
    
    protected $options=array(),$errors=array(),$mobile="",$message="",$parameters=array();
    
    function __construct($options=array()) {  
        $this->options=array_merge($options,array('CharsetIn'=>'UTF-8', 'CharsetOut'=>'ISO-8859-1') );
        $this->options['password']=md5(strtolower($this->options['password']));
        if (isset($this->options['debug']) && $this->options['debug']=='0')
            unset($this->options['debug']);
    }
    
    function _call()
    {          
        $this->parameters=array();
        foreach (array('login','id','pass' , 'dest', 'msg', 'udh' , 'mode' , 'origin' , 'type', 'strategy', 'date','callback') as $field)
        {
            if (!isset($this->options[$field]))
              continue;
            $this->parameters[$field]=$this->options[$field];
        }        
        $version=$this->getOption('version')=='1.0'?"":"1.1/";        
        if ($this->getOption('version')=="1.1")
        {
            $this->setOption('CharsetOut','UTF-8');
            $this->parameters['charset']=strtolower($this->getOption('CharsetOut'));
        }      
        $this->parameters['dest']=$this->mobile;     
        $this->parameters['msg']=iconv($this->getOption('CharsetIn','UTF-8'),$this->getOption('CharsetOut','ISO-8859-1'),$this->message);
       // var_dump($this->parameters); die(__METHOD__);
        $url="http://api.smsbox.fr/".$version."api.php";         
        $ch = curl_init();                         
        curl_setopt($ch, CURLOPT_URL, $url."?".http_build_query($this->parameters));         
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 
        curl_setopt($ch, CURLOPT_HEADER, false);        
        curl_setopt($ch,CURLOPT_TIMEOUT,5);        
        $this->response = curl_exec($ch);         
       // var_dump( $this->response);
        curl_close($ch);         
        if ($this->response===false)
        {    
            trigger_error(curl_error($ch));
            $this->errors=strpos($this->response, "ERROR");
            return false;
        }             
        return true;
    }

    function getError()
    {
        return $this->errors;
    }

    function setOption($name,$value)
    {
        $this->options[$name]=$value;
        return $this;
    }  
    
    function getOption($name,$default=null)
    {
      return isset($this->options[$name])?$this->options[$name]:$default;
    }
    
    function send($mobile,$message)
    {
       $this->mobile=$mobile;
       $this->message=$message;
       return $this->_call(); 
    }
    
    function isDebugMode()
    {
        return ($this->getOption('debug',false)==1);
    }
    
   
    function getResponse()
    {
        return $this->response;
    }
    
    function getParameters()
    {
        return $this->parameters;
    }
    
    function getReference()
    {
        $reference = explode(" ", $this->response);
        return $reference[1];
    }
    
    function hasError()
    {
        if(strpos($this->response, "ERROR") !== false)
            return true;
        return false;
    }
   
}