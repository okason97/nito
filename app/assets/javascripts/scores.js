$(document).ready(function() {
    $("input:checkbox").each(function() {
        console.log($(this).is(':checked'))
        if ($(this).is(':checked')) {
            $(this).parent().parent().find('td').eq(1).find('input').eq(0).prop('disabled', true);
        }else{
            $(this).parent().parent().find('td').eq(1).find('input').eq(0).prop('disabled', false);        
        }            
    });      
    $("input:checkbox").click(function() {
        console.log($(this).parent().parent().find('td').eq(1).find('input').eq(0))
        if ($(this).is(':checked')) {
            $(this).parent().parent().find('td').eq(1).find('input').eq(0).prop('disabled', true).val(0);
        }else{
            $(this).parent().parent().find('td').eq(1).find('input').eq(0).prop('disabled', false);        
        }            
    });      
});