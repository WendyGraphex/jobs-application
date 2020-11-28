<?php

// "SELECT {fields} FROM t_customers_contract LEFT JOIN t_customers ON t_customers.id=t_customers_contract.customer_id LEFT JOIN t_customers_address ON t_customers_address.customer_id=t_customers.id LEFT JOIN t_users AS telepro ON telepro.id=t_customers_contract.telepro_id LEFT JOIN t_users AS sale1 ON sale1.id=t_customers_contract.sale_1_id LEFT JOIN t_users AS sale2 ON sale2.id=t_customers_contract.sale_2_id LEFT JOIN t_customers_contracts_status ON t_customers_contracts_status.id=t_customers_contract.state_id LEFT JOIN t_customers_contract_product ON t_customers_contract_product.contract_id=t_customers_contract.id LEFT JOIN t_partners_company ON t_partners_company.id=t_customers_contract.financial_partner_id LEFT JOIN t_users_team ON t_users_team.id=t_customers_contract.team_id LEFT JOIN t_products_taxes ON t_products_taxes.id=t_customers_contract.tax_id LEFT JOIN t_customers_contracts_status_i18n ON t_customers_contracts_status_i18n.status_id=t_customers_contracts_status.id AND lang='{lang}' GROUP BY t_customers_contract.id ORDER BY t_customers_contract.opened_at DESC;"
// "SELECT  {fields} FROM  t_customers_contract LEFT JOIN t_customers ON t_customers.id=t_customers_contract.customer_id LEFT JOIN t_customers_address ON t_customers_address.customer_id=t_customers.id LEFT JOIN t_users AS telepro ON telepro.id=t_customers_contract.telepro_id LEFT JOIN t_users AS sale1 ON sale1.id=t_customers_contract.sale_1_id LEFT JOIN t_users AS sale2 ON sale2.id=t_customers_contract.sale_2_id LEFT JOIN t_customers_contracts_status ON t_customers_contracts_status.id=t_customers_contract.state_id LEFT JOIN t_customers_contract_product ON t_customers_contract_product.contract_id=t_customers_contract.id LEFT JOIN t_partners_company ON t_partners_company.id=t_customers_contract.financial_partner_id LEFT JOIN t_users_team ON t_users_team.id=t_customers_contract.team_id LEFT JOIN t_products_taxes ON t_products_taxes.id=t_customers_contract.tax_id LEFT JOIN t_customers_contracts_status_i18n ON t_customers_contracts_status_i18n.status_id=t_customers_contracts_status.id AND lang='{lang}'  WHERE  (t_customers.lastname COLLATE UTF8_GENERAL_CI LIKE '%%MA%%' OR t_customers.firstname COLLATE UTF8_GENERAL_CI LIKE '%%MA%%') GROUP BY  t_customers_contract.id ORDER BY t_customers_contract.opened_at DESC;"
// "SELECT t_users.id,t_users.firstname,t_users.lastname,t_users.email,t_users.password,t_users.lastlogin,t_users.last_password_gen,t_users.username,t_users.mobile,t_users.application,t_users.is_active,t_users.is_guess,t_users.created_at,t_users.updated_at,t_users.picture,t_users.sex,t_users.email_tosend,(SELECT GROUP_CONCAT(t_users_function_i18n.value ORDER BY t_users_function_i18n.value ASC) FROM t_users_functions LEFT JOIN t_users_function ON t_users_function.id=t_users_functions.function_id LEFT JOIN t_users_function_i18n ON t_users_functions.function_id=t_users_function_i18n.function_id AND t_users_function_i18n.lang='{lang}' WHERE t_users_functions.user_id=t_users.id) as functions ,(SELECT GROUP_CONCAT(t_groups.name ORDER BY t_groups.name ASC) FROM t_user_group LEFT JOIN t_groups ON t_groups.id=t_user_group.group_id WHERE t_user_group.user_id=t_users.id) as groups ,(SELECT GROUP_CONCAT(t_users_team.name ORDER BY t_users_team.name ASC) FROM t_users_team_users LEFT JOIN t_users_team ON t_users_team.id=t_users_team_users.team_id WHERE t_users_team_users.user_id=t_users.id) as teams FROM t_users WHERE application='admin' ORDER BY `id` ASC;"
class tests_sqlAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {                                  
        echo __METHOD__;
   //  $query="SELECT {fields} FROM t_customers_contract LEFT JOIN t_customers ON t_customers.id=t_customers_contract.customer_id LEFT JOIN t_customers_address ON t_customers_address.customer_id=t_customers.id LEFT JOIN t_users AS telepro ON telepro.id=t_customers_contract.telepro_id LEFT JOIN t_users AS sale1 ON sale1.id=t_customers_contract.sale_1_id LEFT JOIN t_users AS sale2 ON sale2.id=t_customers_contract.sale_2_id LEFT JOIN t_customers_contracts_status ON t_customers_contracts_status.id=t_customers_contract.state_id LEFT JOIN t_customers_contract_product ON t_customers_contract_product.contract_id=t_customers_contract.id LEFT JOIN t_partners_company ON t_partners_company.id=t_customers_contract.financial_partner_id LEFT JOIN t_users_team ON t_users_team.id=t_customers_contract.team_id LEFT JOIN t_products_taxes ON t_products_taxes.id=t_customers_contract.tax_id LEFT JOIN t_customers_contracts_status_i18n ON t_customers_contracts_status_i18n.status_id=t_customers_contracts_status.id AND lang='{lang}' GROUP BY t_customers_contract.id ORDER BY t_customers_contract.opened_at DESC;"; 
   //  $query_where="SELECT {fields} FROM t_customers_contract LEFT JOIN t_customers ON t_customers.id=t_customers_contract.customer_id LEFT JOIN t_customers_address ON t_customers_address.customer_id=t_customers.id LEFT JOIN t_users AS telepro ON telepro.id=t_customers_contract.telepro_id LEFT JOIN t_users AS sale1 ON sale1.id=t_customers_contract.sale_1_id LEFT JOIN t_users AS sale2 ON sale2.id=t_customers_contract.sale_2_id LEFT JOIN t_customers_contracts_status ON t_customers_contracts_status.id=t_customers_contract.state_id LEFT JOIN t_customers_contract_product ON t_customers_contract_product.contract_id=t_customers_contract.id LEFT JOIN t_partners_company ON t_partners_company.id=t_customers_contract.financial_partner_id LEFT JOIN t_users_team ON t_users_team.id=t_customers_contract.team_id LEFT JOIN t_products_taxes ON t_products_taxes.id=t_customers_contract.tax_id LEFT JOIN t_customers_contracts_status_i18n ON t_customers_contracts_status_i18n.status_id=t_customers_contracts_status.id AND lang='{lang}' WHERE (t_customers.lastname COLLATE UTF8_GENERAL_CI LIKE '%%MA%%' OR t_customers.firstname COLLATE UTF8_GENERAL_CI LIKE '%%MA%%') GROUP BY t_customers_contract.id ORDER BY t_customers_contract.opened_at DESC;";
     $query="SELECT t_users.id,t_users.firstname,t_users.lastname,t_users.email,t_users.password,t_users.lastlogin,t_users.last_password_gen,t_users.username,t_users.mobile,t_users.application,t_users.is_active,t_users.is_guess,t_users.created_at,t_users.updated_at,t_users.picture,t_users.sex,t_users.email_tosend".
        // ",(SELECT GROUP_CONCAT(t_users_function_i18n.value ORDER BY t_users_function_i18n.value ASC) FROM t_users_functions LEFT JOIN t_users_function ON t_users_function.id=t_users_functions.function_id LEFT JOIN t_users_function_i18n ON t_users_functions.function_id=t_users_function_i18n.function_id AND t_users_function_i18n.lang='{lang}' WHERE t_users_functions.user_id=t_users.id) as functions ".
        // ",(SELECT GROUP_CONCAT(t_groups.name ORDER BY t_groups.name ASC) FROM t_user_group LEFT JOIN t_groups ON t_groups.id=t_user_group.group_id WHERE t_user_group.user_id=t_users.id) as groups ".
        // ",(SELECT GROUP_CONCAT(t_users_team.name ORDER BY t_users_team.name ASC) FROM t_users_team_users LEFT JOIN t_users_team ON t_users_team.id=t_users_team_users.team_id WHERE t_users_team_users.user_id=t_users.id) as teams ".
         " FROM t_users ".
       //  " WHERE application='admin'".        
         " GROUP BY `id2`".
         " ORDER BY `id` ASC".         
         ";";
     
     // SELECT(.*)FROM(.*)(WHERE(.*))? (GROUP BY (.*))? (ORDER BY (.*))?
     //if (preg_match("#^SELECT(.*)(SELECT(.*)FROM(.*)(WHERE(.*))?(ORDER BY(.*))?)*(.*) FROM(.*) (GROUP BY (.*))? (ORDER BY (.*))?;$#smi", $query,$matches))   
     //if (preg_match("#^SELECT(.*)(,.?SELECT(.*)FROM(.*)( ?WHERE(.*))?( ?ORDER BY(.*))?)* FROM(.*)( ?GROUP BY (.*))? (ORDER BY (.*))?;$#smi", $query,$matches))   
     if (preg_match("#^SELECT(.*)(,.?SELECT(.*)FROM(.*)( ?WHERE(.*))?( ?ORDER BY(.*))?)* FROM(.*);$#smi", $query,$matches))   
     {
       // 9  (ORDER BY (.*))? // (GROUP BY(.*))?             
     //  if (preg_match("#^(.*)WHERE(.*?)(ORDER BY|GROUP BY)(.*?)(GROUP BY (.*))? ?(ORDER BY(.*))?$#smi",$matches[9],$where))
     //  if (preg_match("#^(.*)WHERE(.*?)(ORDER BY|GROUP BY)(.*)?(GROUP BY (.*))?$#smi",$matches[9],$where))
       if (preg_match("#^(.*)WHERE(.*?)(ORDER BY|GROUP BY)(.*?)(GROUP BY (.*))?(ORDER BY(.*))?$#smi",$matches[9],$where))
     //  if (preg_match("#^(.*)WHERE(.*)(ORDER BY(.*))?$#smi",$matches[9],$where))
       {
           
       } 
       elseif (preg_match("#^(.*?)(ORDER BY|GROUP BY)(.*?)(GROUP BY (.*))?(ORDER BY(.*))?$#smi",$matches[9],$where))
       {
           
       }    
       echo "ICI";
       echo "<pre>"; 
                var_dump($matches[9],$where); 
       echo "</pre>";
     }
     return mfView::NONE;
        
    } 
}

