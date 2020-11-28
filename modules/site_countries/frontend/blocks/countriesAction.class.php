<?php


class site_countries_countriesActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {
         $this->user=$this->getUser();         
         $this->countries=SiteCountry::getLanguagesByCountries();             
         $this->country=$this->countries->getCountryByCode($request->getGetParameter('country',$this->user->getCountry()),new SiteCountry('GB'));                                      
         if ($country=$this->getUser()->getStorage()->read('COUNTRY'))
         {             
             if ($request->getGetParameter('country') && $country->get('id')!=$this->country->get('id'))           
                $this->getUser()->getStorage()->write('COUNTRY',$this->country);     
             else    
                $this->country=$country;
         }
         else
         {        
             $this->getUser()->getStorage()->write('COUNTRY',$this->country);            
         }               
         $this->language=$this->country->getLanguages()->getLanguageByCode($this->getUser()->getLanguage(),new Language('en','frontend'));      
       //  echo $this->language->get('code');
    } 
    
    
}

