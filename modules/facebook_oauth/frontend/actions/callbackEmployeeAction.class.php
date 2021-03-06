<?php

/*
 * https://www.project55.net/facebook/oauth/callback/employee
 * TODO
 * - FacebookPicture                          OK
 * - Test de connection => callbackError      Presque
 * - email                                    OK
 * - picture                                  OK
 * - customer uploadAvatarFromUrl             OK
 */

class facebook_oauth_callbackEmployeeAction extends mfAction
{

    function execute(mfWebRequest $request)
    {      
        $_SERVER['HTTPS']=1;
        $_SERVER['HTTP_SSL_HTTPS']=1;        
        $messages = mfMessages::getInstance();                               
    //      echo "<pre>";  var_dump($_SESSION); die(__METHOD__);             
        try 
        {               
                $fb=new FacebookOauth(new FacebookOauthSettings());  
                           
                $accessToken = $fb->getRedirectLoginHelper()->getAccessToken($fb->getEmployeeUrlCallBack());                   
                if (!$accessToken) 
                    throw new mfException(__('Error auth'));          
                $fb->setDefaultAccessToken($accessToken);                                                   
                
                $employee = new Employee($fb->getUser()->getEmail());
                $employee->add(array(
                    'firstname'=>$fb->getUser()->getFirstName(),                       
                    'lastname'=>$fb->getUser()->getLastName(),  
                    'is_locked'=>'NO'
                ))->validate();
                
               
                $employee->uploadAvatarFromUrl(new FacebookPicture($fb->getUser()->getPicture()));      
           
                $this->getUser()->signin($employee,$request->getIp());
                $this->getEventDispather()->notify(new mfEvent($employee, 'employee.connected'));                   
                $this->redirect(to_link_i18n(mfConfig::get('mf_employee_redirect_account')));                 
            }             
            catch (Exception $e) {     
                  $messages->addError($e);       
                      echo "<!-- ".$e->getMessage()." -->";
            }
            $this->forward($this->getModuleName (), 'callbackError');                          
    }

}


