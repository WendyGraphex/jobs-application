
<table>
    <tr>
        <td>{__('Model')}
        </td>
        <td><div class="errors-form" name="model_id">{$form.model_id->getError()}</div>  
            {html_options class="CustomerEmail"  name="model_id" options=$form->model_id->getOption('choices')}
            <a href="#" id="LoadModelEmail">{__('Use')}</a>
        </td>
    </tr>
      <tr>
        <td>{__('Date')}
        </td>
        <td>
            <div class="errors-form" name="sent_at">{$form.sent_at->getError()}</div>
            <input type="text" class="CustomerEmail date" name="sent_at" value="{format_date($item->get('sent_at'),"a")}"/>
        </td>
    </tr>
      <tr>
        <td>{__('To')}
        </td>
        <td>{$customer->get('email')}
        </td>
    <tr>
    <tr>
        <td>{__('Subject')}
        </td>
        <td>
            <div class="errors-form" name="subject">{$form.subject->getError()}</div>
            <input type="text" class="CustomerEmail" name="subject" size="64" value="{$item->get('subject')}"/>
        </td>
    </tr>
     <tr>
        <td>{__('Message')}
        </td>
        <td> <div class="errors-form" name="body">{$form.body->getError()}</div>
            <textarea class="CustomerEmail editor" rows="10" cols="64" name="body">{$item->get('body')}</textarea>
        </td>
    </tr>
</table>    



<script type="text/javascript">

    $(".CustomerEmail").click(function() {  $(".errors-form[name="+$(this).attr('name')+"]").html(""); });


    $(".CustomerEmail.date").datepicker();
 
 
</script> 