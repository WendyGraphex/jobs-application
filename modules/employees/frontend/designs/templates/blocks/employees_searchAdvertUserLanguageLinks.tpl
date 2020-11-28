  <li>{('User languages')}:
  {foreach $language_letters as $letter}<a href="{$letter->getUrl()}">{$letter} </a>{/foreach}
  </li>
