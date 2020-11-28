<?php



class SiteCompanyBase extends mfObject3 {
 
    protected static $fields=array('name','commercial','siret','tva','picture','email','web','fax','phone','coordinates',
                                   'address1','address2','postcode','city','country','state','ape','mobile','footer','header',
                                   'is_site','is_active','created_at','updated_at');
    
    const table="t_site_company";
            
    function __construct($parameters=null) {
      parent::__construct();
      $this->getDefaults();
      if ($parameters===null) return $this; 
      if (is_array($parameters)||$parameters instanceof ArrayAccess) {
           if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);
           return $this->add($parameters); 
      }
      else if (is_numeric((string)$parameters)) {
          $this->loadById((string)$parameters);
      }
    } 
    
    protected function getDefaults()
    {
       $this->created_at=date("Y-m-d H:i:s");  
       $this->updated_at=date("Y-m-d H:i:s");
       $this->is_active=isset($this->is_active)?$this->is_active:"NO";
       $this->is_site=isset($this->is_site)?$this->is_site:"NO";
    }
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }
    
    // Company directory data
    public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/data/site/company/".$this->get('id');
    }       
    
    public function getAddress()
    {
        return $this->get('address1')." ".$this->get('address2')." ".$this->get('postcode')." ".$this->get('city');
    }  
        
    public function getCoordinates()
    {
        if ($this->get('coordinates'))
        {             
            $coordinates= new GPSCoordinate($this->get('coordinates'));
            return $coordinates;
        }   
        return null;
    }        
    
    function hasFooter()
    {
        return (boolean)$this->get('footer');
    }
    
     function hasHeader()
    {
        return (boolean)$this->get('header');
    }
    
     function hasPicture()
    {
        return (boolean)$this->get('picture');
    }
    /* =================================== P I C T U R E =========================================== */
    
    public function getPicture()
    {
      if (!$this->get('_picture'))      
      {    
         $this->_picture=new PictureObject3(array(
                 "path"=>$this->getDirectory(),
                 "picture"=>$this->get('picture'),
                 "urlPath"=>url("/nocache/data/site/company/".$this->get('id')."/","web","frontend",$this->getSite()),
                 "url"=>url("/nocache/data/site/company/".$this->get('id')."/".$this->get('picture'),"web","frontend",$this->getSite())
              ));
      }
      return $this->_picture;     
    }
    
    public function deletePicture()
    {
        $this->getPicture()->remove(); 
        $this->set('picture','');
        $this->save();
    }       
    
    public function getNameForPicture()
    {
       return preg_replace('/[^a-z0-9]/iu','', $this->get('name')); 
    }  
    
    /* =================================== H E A D E R =========================================== */
    public function getHeader()
    {
      if (!$this->get('_header'))      
      {    
         $this->_header=new PictureObject3(array(
                 "path"=>$this->getDirectory(),
                 "picture"=>$this->get('header'),
                 "urlPath"=>url("/nocache/data/site/company/".$this->get('id')."/","web","frontend",$this->getSite()),
                 "url"=>url("/nocache/data/site/company/".$this->get('id')."/".$this->get('header'),"web","frontend",$this->getSite())
              ));
      }
      return $this->_header;     
    }
    
    public function getNameForHeader()
    {
       return __("header")."-".preg_replace('/[^a-z0-9]/iu','', $this->get('name')); 
    }  
    
     public function deleteHeader()
    {
        $this->getHeader()->remove(); 
        $this->set('header','');
        $this->save();
    }  
    
    /* =================================== F O O T E R =========================================== */
    public function getFooter()
    {
      if (!$this->get('_footer'))      
      {    
         $this->_footer=new PictureObject3(array(
                 "path"=>$this->getDirectory(),
                 "picture"=>$this->get('footer'),
                 "urlPath"=>url("/nocache/data/site/company/".$this->get('id')."/","web","frontend",$this->getSite()),
                 "url"=>url("/nocache/data/site/company/".$this->get('id')."/".$this->get('footer'),"web","frontend",$this->getSite())
              ));
      }
      return $this->_footer;     
    }
    
    public function getNameForFooter()
    {
       return __("footer")."-".preg_replace('/[^a-z0-9]/iu','', $this->get('name')); 
    }  
    
    public function deleteFooter()
    {
        $this->getFooter()->remove(); 
        $this->set('footer','');
        $this->save();
    }  
    
    function isAutoEnterprise()
    {             
        if (!$this->get('tva') && $this->get('ape'))
            return true;    
        if ($this->get('autoentreprise')=='YES')
            return true;
        return false;
    }    
    
     function toArray($fields=null)
    {
        $values=  parent::toArray($fields);
        $values['url']=url("");
        if ($this->hasPicture())
            $values['picture']=array('url'=>$this->getPicture()->getUrl());
        if ($this->hasHeader())
            $values['header']=array('url'=>$this->getHeader()->getUrl());
        if ($this->hasFooter())
            $values['footer']=array('url'=>$this->getFooter()->getUrl());
        return $values;
    }    
    
    
    static function getSiteCompany()
   {
       static $company=null;       
       if ($company)
          return $company;
       $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT * FROM ".SiteCompany::getTable().";")               
                ->makeSqlQuery();   
        if (!$db->getNumRows())
        {
            $company=new SiteCompany();
            return $company;
        }    
        return $db->fetchObject('SiteCompany')->loaded();                       
   }
        
   
   function getEmailWithName()
   {
       return array($this->get('email')=>$this->get('commercial'));
   }
  
   function getCountry()
   {
       return new CountryFormatter($this->get('country'));
   }
   
   
}

