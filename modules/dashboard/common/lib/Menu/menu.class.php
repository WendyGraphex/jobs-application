<?php

class menuItem implements  ArrayAccess,Iterator {
    
    protected $_children=array(),$_properties=array(),$_position=0,$sublinks=array();
    
    function __construct($properties=null) {
        $this->add($properties);
    }
    
    function addChild($name)
    {
        $this->_children[$name]=new MenuItem();
        return $this->_children[$name];
    }
    
    function hasChildren()
    {
        return count($this->_children);
    }
    
    function getChildren()
    {
        return $this->hasChildren()?$this->_children:null;
    }
    
    function hasChild($name)
    {
        return isset($this->_children[$name]);
    }
    
    function getChild($name)
    {
       return $this->hasChild($name)?$this->_children[$name]:null; 
    }
    
    function add($data)
    {
        $this->_properties=$data; 
    }
   /* 
    function set($data)
    {
        $this->item['properties']=$data;
    }*/
    
    function has($name)
    {
     //   return isset($this->item['properties'][$name])?true:false;
       return isset($this->_properties[$name])?true:false;
    }
    
    function getProperties()
    {
      //  return isset($this->item['properties'])?$this->item['properties']:null;
       return isset($this->_properties)?$this->_properties:null;
    }
    
    function set($name,$value)
    {
       $this->_properties[$name]=$value;
       return $this;
    }   
    
    function get($name,$default=null)
    {
         return $this->has($name)?$this->_properties[$name]:$default;
    }
    
    function call($name,$parameters=array(),$default=true)
    {
       if (!$this->has($name))
          return $default;
       $value=$this->get($name);
       if (is_callable($value))
           return call_user_func_array ($value,$parameters);  
       return $value;
    }
    
    function component($method,$parameters=array(),$default=false)
    {
       if (!$this->get('component'))
           return $default;
       $smarty=mfContext::getInstance()->getController()->getActionStack()->getLastEntry()->getActionInstance()->getViewManager();
       $component=mfContext::getInstance()->getComponentController()->dispatch($this->get('component'),array(),$smarty); 
       if (method_exists($component,$method))
          return $component->$method($parameters);
       return $default;
    }
    
    function rewind() {  
      reset($this->_children);
      $this->_position = key($this->_children);
    }

    function current() {
        return $this->_children[$this->_position];
    }

    function key() {
        
        return $this->_position;
    }

    function next() {
        next($this->_children);
        $this->_position=key($this->_children);
    }

    function valid() {
        return isset($this->_children[$this->_position]);
    }
    
    
    public function offsetSet($offset, $value) {
    }
    
    public function offsetExists($offset) {
        return $this->has($offset);
    }
    
    public function offsetUnset($offset) {
    }
    
    public function offsetGet($offset) {
       return $this->get($offset);
    }
    
    public function find($name_to_find)
    {
       foreach ($this->getChildren() as $name=>$item) 
       {
           if ($name_to_find==$name)
              return $item;    
           if ($item->hasChildren())
              return $item->find($name_to_find);
       }    
       return null;
    }
    
    public function getSublinks($route,$mode_xml=false)
    {       
       if (!$this->sublinks)
       {                  
           $this->_getSublinks($route,$this->sublinks,$mode_xml);            
           rsort($this->sublinks,SORT_NUMERIC);                  
       }         
       return $this->sublinks;
    }  
    
    protected  function _getSublinks(mfRoute $route,&$sublinks,$mode_xml=false)
    {                   
        $route_to_find=$mode_xml?$this->get('route_ajax'):$this->get('route');       
        $this->mode_xml=$mode_xml;
        if ($route->isEqual($route_to_find))
        {                         
            $sublinks[]=$this;            
            return true;
        }                  
        if ($this->hasChildren())
        {            
            foreach ($this->getChildren() as $child)
            {                        
                if ($child->_getSublinks($route,$sublinks,$mode_xml))
                {                          
                     $sublinks[]=$this;                    
                     return true;
                }    
            }
        }        
        return false;
    }   
    
    
    
    function getRouteAjax()
    {        
        $route=$this->get('route_ajax');         
        if (is_array($route))
            return url_to(key($route),current($route));
        return url("");
    }
    
    function getRoute()
    {        
        if ($this->mode_xml)
            return $this->getRouteAjax();
        $route=$this->get('route');       
        if (is_array($route))
            return url_to(key($route),current($route));
        return url("");
    }
    
    
    
    function getSorted()
    {
      ksort($this->_children);
      return $this->_children;
    }
}

