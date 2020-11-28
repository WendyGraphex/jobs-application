<?php

/*
 * https://www.project55.net/facebook/oauth/callback/event_user
 * TODO
 * - FacebookPicture                          OK
 * - Test de connection => callbackError      Presque
 * - email                                    OK
 * - picture                                  OK
 * - employer uploadAvatarFromUrl             OK
 */

class facebook_oauth_callbackEventUserAction extends mfAction
{

    function execute(mfWebRequest $request)
    {      
         
        $_SERVER['HTTPS']=1;
        $_SERVER['HTTP_SSL_HTTPS']=1;        
        $messages = mfMessages::getInstance();
        // echo "<pre>";  var_dump($_SESSION); die(__METHOD__);             
        try 
        {                          
            $fb=new FacebookOauth();                              
            $accessToken = $fb->getRedirectLoginHelper()->getAccessToken($fb->getEventUserUrlCallBack());                   
            if (!$accessToken) 
                throw new mfException(__('Error auth'));
            $fb->setDefaultAccessToken($accessToken);                                      
            $event_user = new SiteEventUser($fb->getUser()->getEmail());

            $event_user->add(array(
                'firstname'=>$fb->getUser()->getFirstName(),                       
                'lastname'=>$fb->getUser()->getLastName(),  
                'is_locked'=>'NO'
            ))->validate();

            $event_user->uploadAvatarFromUrl(new FacebookPicture($fb->getUser()->getPicture()));                                 
            $this->getUser()->signin($event_user,$request->getIp());

            $this->getEventDispather()->notify(new mfEvent($event_user, 'site_event.user.connected'));                   
            $this->redirect(to_link_i18n(mfConfig::get('mf_site_event_redirect_account')));   
        }             
        catch (Exception $e) {     
              $messages->addError($e);  
                  echo "<!-- ".$e->getMessage()." -->";
        }
        $this->forward($this->getModuleName (), 'callbackError');                            
    }

}


