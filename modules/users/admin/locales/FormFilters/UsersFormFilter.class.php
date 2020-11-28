<?php

class UsersFormFilter extends mfFormFilterBase
{

    protected $user = null, $language = null, $conditions = null;

    function __construct($user)
    {
        $this->user = $user;
        $this->language = $user->getCountry();
        $this->conditions = new ConditionsQuery();
        $this->conditions->setParameters(array('user_id' => $this->getUser()->getGuardUser()->get('id')));
        parent::__construct();
    }

    function getUser()
    {
        return $this->user;
    }

    function getLanguage()
    {
        return $this->language;
    }

    function configure()
    {
        //   var_dump($this->conditions);
        $this->setDefaults(array(
            'order' => array(
                "id" => "asc",
            ),
            'search' => array(
                "is_active" => "*",
            ),
            'nbitemsbypage' => 20,
        ));
        $this->setClass('User');
        $this->setFields(array(
            'username' => array(
                'class' => 'User',
                'search' => array('conditions' =>
                    User::getTableField('username') . " COLLATE UTF8_GENERAL_CI LIKE '%%{username}%%'"
                )
            ),
            'firstname' => array(
                'class' => 'User',
                'search' => array('conditions' =>
                    User::getTableField('firstname') . " COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%'"
                )
            ),
            'lastname' => array(
                'class' => 'User',
                'search' => array('conditions' =>
                    User::getTableField('lastname') . " COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%'"
                )
            ),
        ));
        $this->setQuery("SELECT {fields}" .
          /*  "(SELECT GROUP_CONCAT(" . Group::getTableField('name') . " ORDER BY " . Group::getTableField('name') . " ASC)" .
            " FROM " . UserGroup::getTable() .
            " LEFT JOIN " . UserGroup::getOuterForJoin('group_id') .
            " WHERE " . UserGroup::getTableField('user_id') . "=" . User::getTableField('id') .
            ") as groups" .*/
            " FROM " . User::getTable() .
           /* " LEFT JOIN ".User::getOuterForJoin('content_group_id').
          /*  " LEFT JOIN ".ContentGroup::getOuterForJoin('application_id').
            " LEFT JOIN ".UserApplicationI18n::getInnerForJoin('application_id')." AND ".UserApplicationI18n::getTableField('lang')."='{lang}'".
            " LEFT JOIN ".ContentGroup::getOuterForJoin('country_id').
            " LEFT JOIN ".ContentGroup::getOuterForJoin('language_id')." AND ".Language::getTableField('application')."='admin'".
            " LEFT JOIN ".User::getOuterForJoin('profession_id').
            " LEFT JOIN ".UserProfessionI18n::getInnerForJoin('profession_id')." AND ".UserProfessionI18n::getTableField('lang')."='{lang}'".
            " LEFT JOIN ".User::getOuterForJoin('specialty_id').
            " LEFT JOIN ".UserSpecialityI18n::getInnerForJoin('speciality_id')." AND ".UserSpecialityI18n::getTableField('lang')."='{lang}'".*/
            " WHERE ".User::getTableField('application')."='admin' " .
            ";");

        // Validators
        $this->setValidators(array(
            'order' => new mfValidatorSchema(array(
                "id" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "username" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "firstname" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "lastname" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "email" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "created_at" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "updated_at" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "last_password_gen" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "lastlogin" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            ), array("required" => false)),
            'search' => new mfValidatorSchema(array(
                "id" => new mfValidatorInteger(array("required" => false)),
                "username" => new mfValidatorString(array("required" => false)),
                "firstname" => new mfValidatorString(array("required" => false)),
                "lastname" => new mfValidatorString(array("required" => false)),
                "email" => new mfValidatorString(array("required" => false)),
                "is_active" => new mfValidatorChoice(array("required" => false, 'key' => true, "choices" => array("" => "", "YES" => __("YES"), "NO" => __("NO")))),
            ), array("required" => false)),
            'range' => new mfValidatorSchema(array(
                "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                "lastlogin"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
             ),array("required"=>false)),
            'nbitemsbypage' => new mfValidatorChoice(array("choices" => array("5" => 5, "10" => 10, "20" => 20, "50" => 50, "100" => 100, "250" => 250))),
        ));
    }

}

