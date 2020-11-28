<div>
    Event Published
    <p>Sincerely,</p>
    <p>Graphex Technology Team</p>
    --
    <div class="" style="width: 200px;">
        <a href="{$company.url}"><img title="{$company.name}" class="logo" src="{$company.picture.url}" alt="{$company.name}" style="max-width: 100%;"></a>              
    </div><br/>

    <a href="{$company.url}" style="color: #222;text-decoration: none;">{$company.web}</a><br/><br/>
    <div style="margin-bottom: 20px;">
        
    </div>
    <div>
        <div style="margin-bottom: 10px;"></div>
        {foreach $socials as $item}
            <a href="{$item.link}" style="color: #222;text-decoration: none;padding: 15px;font-size: 30px;"><i class="fa fa-{$item.awe}"></i></a>
        {/foreach}
    </div>
</div>
