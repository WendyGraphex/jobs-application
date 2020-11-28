<?php


class CustomerMessageFileBase extends mfObject3 {
     
    protected static $fields=array('message_id','status','file','size','extension','created_at');    
   const table="t_customer_message_file"; 
    protected static $foreignKeys=array('message_id'=>'CustomerMessage',                                  
                                       );  


    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);                     
          return $this->add($parameters); 
      }   
      else
      {         
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
      }   
    }        
     
    
    protected function getDefaults()
    {
       $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),               
        ));       
    }
    
  /*  function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new CustomerMessageFormatter($this):$this->formatter;
    }*/
    
 
    
    function getCreatedAt()
    {
        return new DateTimeFormatter($this->get('created_at'));
    }
    
    
    function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/data/messages/".$this->get('message_id')."/files/".$this->get('id');
    }        
    
    function getMessage()
    {
        return $this->_message_id=$this->_message_id===null?new CustomerMessage($this):$this->_message_id;   
    }
    
    
    function getSize()
    {
        return new IntegerFormatter($this->get('size'));
    }
    
    function getFileManager()
    {          
        return $this->_file=$this->_file===null?new CustomerMessageFileManager($this):$this->_file;   
    }
    
    function getName()
    {
        return new mfFilename($this->get('name'));
    }
    
    function create(mfValidatedFile $file)
    {      
        if ($file===null)
            return  $this;            
        $this->set('file',$this->getFileManager()->escapeFilename(new mfString($file->generateFilename())));
        $this->set('extension',$file->getExtension());
        $this->set('size',$file->getFilesize());  
        $this->save();        
        $file->save($this->getFileManager()->getDirectory(),$this->get('file')); 
        $this->getMessage()->incFile(); 
        return $this;
    }
    
     function delete() {                 
        $this->getFileManager()->delete();                  
        parent::delete();                
        $this->getMessage()->decFile();
        return $this;
    }
    
    static function loadMessagesForPager($pager)
    {
        $messages=new mfArray($pager->getKeys());    
        foreach ($pager as $item)
            $item->files= new CustomerMessageFileCollection();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array())
                ->setQuery("SELECT * FROM ".CustomerMessageFile::getTable().
                           " WHERE message_id IN('".$messages->implode("','")."')".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return ;
        while ($item=$db->fetchObject('CustomerMessageFile'))
        { 
            $pager[$item->get('message_id')]->getFiles()->push($item);
        }              
         
    }
}
