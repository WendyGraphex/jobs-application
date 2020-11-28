<?php

class SaleOrderPdfBase extends wkhtmltopdf {
    
    protected $order=null,$model=null;
    
    function __construct(SaleOrder $order,$options=array())
    {        
       $this->order=$order;       
       parent::__construct($options, null);    
    }
    
    function getSettings()
    {
        return $this->settings=$this->settings===null?new SaleOrderSettings():$this->settings;
    }
    function getOrder()
    {
        return $this->order;
    }
    
    function getModel()
    {
         return $this->model=$this->model===null?$this->getSettings()->getSaleOrderModel():$this->model;
    }
    
    
    function hasModel()
    {
        return $this->getSettings()->hasSaleOrderModel();
    }
    
   /* function getFilename()
    {                         
        return $this->getSalary()->getFile();
    }
    
    function getName()
    {
        return $this->getFile()->getName();
    }
    
    function getFile()
    {
        return new File($this->getFilename());
    }*/
    
    
    function configure()
    {            
        $this->setOption('filename',$this->getOrder()->getPdf());       
        /* $this->setOption('orientation','P');  */        
        parent::configure(); 
    }
    
    function isReadable()
    {
        return $this->getSalary()->getPdf()->isExist();
    }
    
   function output()
    {       
       $this->setOption('debug',true);        
       $this->create();            
       readfile($this->getTemplateFile());      
    }
    
   
    function save()
    {               
        $this->create();         
      //  parent::save();       
    }
    
    function forceOutput()
    {
        $this->create();           
        
       // die(__METHOD__);
       /* mfContext::getInstance()->getResponse()
             ->setHttpHeader('Cache-Control: no-cache, must-revalidate')          
             ->sendFile($this->getSalary()->getPdf()->getFilename());     */
         mfContext::getInstance()->getResponse() 
             ->setHttpHeader('Cache-Control: no-cache, must-revalidate')
             ->setHttpHeader('Content-disposition: filename="'.$this->getOrder()->getPdf()->getName().'"')
             ->sendFile($this->getOrder()->getPdf()->getFile());          
        return $this;
    } 
    
    function create()
    {                   
       //  $this->debug();
         $orientation = $this->hasModel() && $this->getModel()->hasOrientation()?"--orientation ".$this->getModel()->get('orientation'):"";  
         $this->setOption("options",$orientation." --enable-javascript --margin-bottom 0.0 --margin-left 0.0 --margin-right 0.0 --margin-top 0.0")
             ->createPDF('sales_order','pdf',array('order'=>$this->order,'model'=>$this->model));                          
    }
}

