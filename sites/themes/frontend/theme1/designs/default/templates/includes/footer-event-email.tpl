<div style="margin-top: 40px;">
    <p>Sincerely,</p>
    <p>Graphex Technology Team</p>
    --
    <div class="" style="width: 200px;">
        <a href="{$company.url}"><img title="{$company.name}" class="logo" src="{$company.picture.url}" alt="{$company.name}" style="max-width: 100%;"></a>              
    </div><br/>
    <a href="{$company.url}" style="color: #222;text-decoration: none;">{$company.web}</a><br/><br/>
    <div style="margin-bottom: 20px;">
      {*  <a href="{$links.have_question}" style="color: #222;margin-right: 10px;text-decoration: none;">HAVE A QUESTION ? |</a>
        <a href="{$links.invite_freelancer}" style="color: #222;margin-right: 10px;text-decoration: none;">INVITE A FREELANCER |</a>
        <a href="{$links.invite_employer}" style="color: #222;margin-right: 10px;text-decoration: none;">INVITE A EMPLOYER</a> *}
    </div>
    <div class="social-email">
        <div style="margin-bottom: 10px;"></div>
        {foreach $socials as $item}
            <a href="{$item.link}"><img src="{url("`$item.awe`.png","picture")}"/></a>
        {/foreach}
    </div>
</div>
