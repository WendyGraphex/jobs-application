<?php

/*
 * https://www.project55.net/facebook/oauth/callback/employer
 * TODO
 * - FacebookPicture                          OK
 * - Test de connection => callbackError      Presque
 * - email                                    OK
 * - picture                                  OK
 * - employer uploadAvatarFromUrl             OK
 */

class facebook_oauth_callbackEmployerAction extends mfAction
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
            $accessToken = $fb->getRedirectLoginHelper()->getAccessToken($fb->getEmployerUrlCallBack());                   
            if (!$accessToken) 
                throw new mfException(__('Error auth'));
            $fb->setDefaultAccessToken($accessToken);                                      
            $employer = new EmployerUser($fb->getUser()->getEmail());

            $employer->add(array(
                'firstname'=>$fb->getUser()->getFirstName(),                       
                'lastname'=>$fb->getUser()->getLastName(),  
                'is_locked'=>'NO'
            ))->validate();

            $employer->uploadAvatarFromUrl(new FacebookPicture($fb->getUser()->getPicture()));                                 
            $this->getUser()->signin($employer,$request->getIp());

            $this->getEventDispather()->notify(new mfEvent($employer, 'employer.connected'));                   
            $this->redirect(to_link_i18n(mfConfig::get('mf_employer_redirect_account')));   
        }             
        catch (Exception $e) {     
              $messages->addError($e);  
                  echo "<!-- ".$e->getMessage()." -->";
        }
        $this->forward($this->getModuleName (), 'callbackError');                            
    }

}


