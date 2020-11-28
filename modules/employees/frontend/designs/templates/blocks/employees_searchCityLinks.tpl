  <li>{('Cities')}:
  {foreach $city_letters as $letter}<a href="{$letter->getUrl()}">{$letter} </a>{/foreach}
  </li>
