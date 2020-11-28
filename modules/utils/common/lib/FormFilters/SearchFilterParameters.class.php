<?php

class SearchFilterParameters {
    
    protected $filter=null,$searches=null,$options=array();
    
    function __construct($options=array()) {
        $this->filter=new mfArray();
        $this->options=$options;
    }
    
    function getOptions()
    {
        return $this->options;
    }
    
    function setOption($name,$value)
    {
        $this->options[$name]=$value;
        return $this;
    }
    
    function in()
    {
        return $this->filter['in']=!isset($this->filter['in'])?new mfArray():$this->filter['in'];
    }
    
    function begin()
    {
        return $this->filter['begin']=!isset($this->filter['begin'])?new mfArray():$this->filter['begin'];
    }
    
    function order()
    {
        return $this->filter['order']=!isset($this->filter['order'])?new mfArray():$this->filter['order'];
    }
    
    function search()
    {
        return $this->filter['search']=!isset($this->filter['search'])?new mfArray():$this->filter['search'];
    }
    
    function equal()
    {
        return $this->filter['equal']=!isset($this->filter['equal'])?new mfArray():$this->filter['equal'];
    }
    
    function setSortBy($value)
    {
        $this->filter['sortby']=$value;
        return $this;
    }
    
     function set($name,$value)
    {
        $this->filter[$name]=$value;
        return $this;
    }
   
    function getFilter()
    {
        return  $this->filter;
    }
    
    function __toString() {
        return (string)$this->getSearches()->implode();
    }
    
    function getSearches()
    {
         return $this->searches=$this->searches===null?new mfArray():$this->searches;
    }
         
    
    
       
    
    
}
