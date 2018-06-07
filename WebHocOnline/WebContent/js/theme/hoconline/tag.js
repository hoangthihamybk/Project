function add_tag(tag_content,type_tag,articles_id){
    $tag_content = tag_content;
    $type_tag = type_tag;
    $articles_id = articles_id;
        $j.ajax({
            async:false,
            url: '/tags/index.php',
            data: 'action=add&tag_content=' + $tag_content+'&type_tag='+$type_tag+'&articles_id='+$articles_id ,
            type: 'POST',
            dataType: 'json',
            success: function(data) {
                if (data.status == 'ok') {
                    $j('#tags').addTag(data.tag,{focus:true},true);
                }else alert(data.message);
            }
        });
        return false;
}
function delete_tag(tag_content,type_tag,articles_id){
    $tag_content = tag_content;
    $type_tag = type_tag;
    $articles_id = articles_id;
    if (confirm('Bạn có chắc chắn muốn xóa không?')) {
        $j.ajax({
            async:false,
            url: '/tags/index.php',
            data: 'action=delete&type_tag='+$type_tag+'&articles_id='+$articles_id+'&tag_content='+$tag_content ,
            type: 'POST',
            dataType: 'json',
            success: function(data) {
                if (data.status == 'ok') {
                    $j('#tags').removeTag($tag_content);
                }else alert(data.message);
            }  
        }); 
    }
    return false;
}
function onAddTag(tag) {
    $type_tag = $j('#tags').attr('type_tag');
    $articles_id = $j('#tags').attr('articles_id');
    if ($type_tag && $articles_id) {
        add_tag(tag,$type_tag,$articles_id);    
    }else $j('#tags').addTag(tag,{focus:true},true);
}
function onRemoveTag(tag) {
    $type_tag = $j('#tags').attr('type_tag');
    $articles_id = $j('#tags').attr('articles_id');
    if ($type_tag && $articles_id) {
        delete_tag(tag,$type_tag,$articles_id);    
    }else {
        if (confirm("Bạn có chắc chắn muốn xóa không?")) {
            $j('#tags').removeTag(tag);
        };
    }
}
jQuery(document).ready(function($) {
    $('#tags').tagsInput({
        autocomplete_url:'/tags/index.php?action=autocomplete',
        width:'100%',
        height:'auto',
        onAddTag:onAddTag,
        onRemoveTag:onRemoveTag
    });
});
