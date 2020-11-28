<?php



class CustomerAcademyTopicForCategoryI18nViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('topic', new CustomerAcademyTopicForm($this->getDefault('topic')));
        $this->embedForm('topic_i18n', new CustomerAcademyTopicI18nForm($this->getDefault('topic_i18n')));
        unset($this->topic_i18n['id'],$this->topic['id']);
    }

    function getIcon()
    {
        return $this['topic']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['topic']['icon']->hasValue();
    }
    
    function getValuesForTopic()
    {
        $values= $this['topic']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForTopicI18n()
    {
        return $this['topic_i18n']->getValue();      
    }
}
