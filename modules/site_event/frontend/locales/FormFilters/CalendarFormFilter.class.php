<?php

class CalendarFormFilter extends mfFormFilterBase {

    protected $user=null,$calendar=null,$is_processed=false;
    
    function __construct($user,$defaults=array())
    {                
       $this->user=$user;             
       parent::__construct($defaults);      
    }        
    
    
    function getUser()
    {
      return $this->user;    
    }
    
     function getSettings()
    {
        return $this->settings;
    }
    
     
    function configure()
    {                 
       $this->addDefaults(array(   
            'date_in'=>date("Y-m-d"),              
            'mode'=>'MONTH', //'DAY', //'WEEK', //'MONTH',       
            'in'=>array(
                        
                        'lang'=>'',
                        'country'=>''
                 ),
       ));           
       $this->setClass('SiteEvent');
       $this->setFields(array());
       $this->setQuery("SELECT {fields} FROM ".SiteEvent::getTable().    
                       " INNER JOIN ".SiteEventI18n::getInnerForJoin('event_id').
                       " WHERE in_at >= '{in_at}' AND in_at <= '{out_at}' ".
                           // " AND in_at IS NOT NULL ".                         
                       ";"); 
       // Validators        
       $this->setValidators(array( 
            'date_in' => new mfValidatorDate(array()),
            'action' => new mfValidatorChoice(array('choices'=>array('NEXT','PREV'),"required"=>false)),
            'mode' => new mfValidatorChoice(array('key'=>true,'choices'=>array('MONTH'=>__("Month"),'WEEK'=>__('Week'),/* 'DAY'=>__('Day')*/ ))),                     
            'in'=>new mfValidatorSchema(array(     
                            'country'=>new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> SiteEventUtils::getFormattedCountriesForSelect()->unshift(array(''=>__("All countries"))))),                                                  
                          //  'user_language'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployerAdvertUtils::getUserLanguagesForSelect()->unshift(array(''=>__('All languages'))))),
                            'lang'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> SiteEventUtils::getLanguagesForSelect()->unshift(array(''=>__('All languages'))))),                          
                    ),array("required"=>false)),   
            'begin'=>new mfValidatorSchema(array( 
                                    
                    ),array("required"=>false)),          
            'equal' => new mfValidatorSchema(array(     
                           
                            ),array("required"=>false)), 
            'range' => new mfValidatorSchema(array(   
                            //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                              "price"=>new mfValidatorIntegerRangeCompare(array("required"=>false,'min'=>SiteEventUtils::getMinPrice(),'max'=>SiteEventUtils::getMaxPrice())),           
                                ),array("required"=>false)),  
                                
        ));          
    }
    
    
    function getNextDate()
    {     
        if ($this['mode']->getValue()=='WEEK')
            return $this->date->getDayAdd(7);   
        if ($this['mode']->getValue()=='MONTH')
            return $this->date->getNextMonthDay() ; 
        return $this->date->getDayAdd(1);   
    }
        
    function getPreviousDate()
    {
         if ($this['mode']->getValue()=='WEEK')
            return  $this->date->getDaySub(7); 
          if ($this['mode']->getValue()=='MONTH')
            return $this->date->getPreviousMonthDay(); 
         return  $this->date->getDaySub(1);     
    }
    
     function execute()
    {                      
        $min=new Time(6);
        $max=new Time(23);        
        $this->date=new Day($this['date_in']->getValue());      
        $mode=strtolower($this['mode']->getValue());            
        if ($this['action']->getValue()=='NEXT')
            $this->date=$this->getNextDate();
        elseif ($this['action']->getValue()=='PREV')
            $this->date=$this->getPreviousDate();     
        $this->calendar=new Calendar($this->date->getDate(),array("class"=>"SiteEventDay",
                                                                     "mode"=>$mode,
                                                                     "start_day"=>"monday",
                                                                     "start_first_day"=>false,
                                                                     "autocomplete"=>true,
                                                                   /*  "hours"=>array('class'=>'SiteEventTime',
                                                                                    'scale_hour'=>0,
                                                                                  //  'with_seconds'=>true,
                                                                                    'min'=>$min->getHour(),
                                                                                    'max'=>$max->getHour()
                                                                      )*/
        ));  
     //  echo "<pre>"; var_dump($this->calendar->getDays()->split(7));
       
               
       //echo "<pre>"; var_dump($this->calendar->getDays()); die(__METHOD__);
        
        $date_end=$this->calendar->getLastDay();     
        $date_start=$this->calendar->getFirstDay();         
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('in_at'=>$date_start->getDate()." 00:00:00",
                                  'lang'=>$this->getUser()->getLanguage(),
                                //  'company_id'=>$this->getUser()->getGuardUser()->get('company_id'),
                                  'out_at'=>$date_end->getDate()." 23:59:59"))    
            ->setObjects(array('SiteEvent','SiteEventI18n'))         
            ->setQuery($this->getQuery())
            ->makeSqlQuery();           
     //  echo $db->getQuery();
      //  echo "<!-- ".$db->getQuery()." -->";
        $this->number_of_events=0;
     //   $events=new SiteEventCollection();
         while ($items=$db->fetchObjects())
        {       
            $this->number_of_events++; 
            $item=$items->getSiteEvent();
            $item->setI18n($items->getSiteEventI18n());
            
            for ($i=0;$i < $item->getNumberOfDays(); $i++)
            {
                $day=$item->getInAt()->getDayAdd($i);
                if ($site_event_day=$this->getCalendar()->getDay($day->getDate()))  
                {      
                     $site_event_day->getEvents()->push($item);             
                }  
            }            
            
        }  
       //  echo "<pre>"; var_dump($this->calendar);
        $this->is_processed=true;        
    }        
   
    function getCalendar()
    {
        return $this->calendar;
    }
    
   /* function getNumberOfMeetings()
    {
        return $this->number_of_meetings;
    }*/
    
    function getDate()
    {     
       return $this->_date=$this->_date===null?new DateFormatter($this->date->getDate()):$this->_date;       
    }
    
    function isProcessed()
    {
        return $this->is_processed;
    }
    
      function getPrice()
    {
        return $this->price=$this->price===null?new mfArray(array($this['range']['price']['min']->getValue(),$this['range']['price']['max']->getValue())):$this->price;
    }
}

