<?php

class LinkedInOauthApi {
    
    private $redirectUrl = '';
    private $clientId = '';
    private $clientSecret = '';
    private $scope = 'r_liteprofile';
    private $code, $token, $me;
   
    const URL_OAUTH = "https://www.linkedin.com/oauth/v2";
    const URL_API = "https://api.linkedin.com/v2";
    
    
    function __construct($client_id, $client_secret) {
        $this->clientId = $client_id;
        $this->clientSecret = $client_secret;
    }
    
    function setScope($scope)
    {
        $this->scope = $scope;
        return $this;    
    }
    
    function setCode($code)
    {
        $this->code = $code;
        return $this;    
    }
    
    function setCallback($url)
    {
        $this->redirectUrl = $url;
        return $this;
    }

    public function call($url){
        $ch = curl_init();

            curl_setopt($ch, CURLOPT_URL,$url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
             
            if( $result = curl_exec($ch))
               return json_decode($result, true);
            throw new Exception(curl_error($ch));
    }
    
    function getApiUri()
    {
        return self::URL_OAUTH."/authorization?response_type=code&client_id=".$this->clientId."&scope=".$this->scope."&state=".$this->state."&redirect_uri=".$this->redirectUrl;
    }
    
    function getToken()
    {
        $url = self::URL_OAUTH."/accessToken?grant_type=authorization_code&redirect_uri=".$this->redirectUrl."&client_id=".$this->clientId."&client_secret=".$this->clientSecret."&code=".$this->code;

        $result = $this->call($url);
        $this->token = $result["access_token"];
        return $this->token;
        
    }
    
    function getData()
    {
        $url = self::URL_API."/me?oauth2_access_token=".$this->token;
        $results = $this->call($url);
        return $results;
    }
    
    function getPicture($userData)
    {
        $url = self::URL_API."/me?projection=(id,profilePicture(displayImage~:playableStreams))&oauth2_access_token=".$this->token;
        $results = $this->call($url);
      //  var_dump($results);
        $userData->setPicture($results["profilePicture"]["displayImage~"]["elements"][3]["identifiers"][0]["identifier"]);
    }
    
    
    function getMe()
    {
        if ($this->me===null)
        {
            $this->me = new LinkedInOauthData($this->getData());
        }
        return $this->me;
    }
    
}

