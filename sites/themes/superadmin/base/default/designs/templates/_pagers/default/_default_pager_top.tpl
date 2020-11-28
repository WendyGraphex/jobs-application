<div>
    {__("page")|capitalize}: {$pager->getPage()}/{$pager->getPages()} {if $pager->getNbItems()}-&nbsp;
    <span id="{if $class}{$class}-{/if}begin_result">{$pager->getBeginNumberResult()}</span>&nbsp;-&nbsp;
    <span id="{if $class}{$class}-{/if}end_result">{$pager->getEndNumberResult()}</span>&nbsp;
    {__("of")}&nbsp;
    {/if}<span id="{if $class}{$class}-{/if}nb_results">{format_number_choice('[0]no result|[1]one result|(1,Inf]%s results',$pager->getResults(),$pager->getResults())}</span>
    {html_options name="{if $class}{$class}-{/if}nbitemsbypage" options=$formFilter->nbitemsbypage->getOption('choices') selected=(string)$formFilter.nbitemsbypage}
</div>
