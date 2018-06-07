jQuery.fn.extend({
    addCommentForm: function (callback) {
        var $this = $(this);
        var $paid = $this.data('comment-paid');
        if ($paid != 1) {
            return;
        }

        if ($this.hasClass('comment-form-loading')) {
            return false;
        }


        if (typeof escapeHtmlEntities !== 'function') {
            var $script = document.createElement('script');
            $script.type = 'text/javascript';
            $script.async = true;
            $script.src = 'https://hocmai.vn/theme/hocmai/js/escapeHtmlEntities.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore($script, s);
        }

        var $type = $this.data('comment-type');
        var commentType = $this.data('type');
        switch ($type) {
            case 'scorm':
            case 'question':
                var $scormid = $this.data('scormid');
                var $question = $this.data('question');
                var course = $this.data('course');
                if (!$this.attr('id')) {
                    $this.attr('id', 'qa_' + $scormid + '_wrapper');
                }
                $.ajax({
                    url: '/qa/comment-form-2.php',
                    data: {type: $type, scormid: $scormid, commentType: commentType, question: $question, course: course},
                    type: 'GET',
                    beforeSend: function () {
                        $this.addClass('comment-form-loading');
                    },
                    success: function ($response) {
                        var $form = $response.trim();
                        if ($form) {
                            $this.prepend($form);
                            $this.find('[data-comment-action="submit"],[data-comment-action="cancel"]').data('wrapperTarget', $this.attr('id'));
                            if (commentType == '1' && $this.parents(".tab-pane").hasClass('focus')) {
                                $this.find('textarea').first().focus();
                                $this.parents(".tab-pane").removeClass('focus');
                            }
                        }
                        $this.removeClass('comment-form-loading');
                        if (typeof callback == 'function') {
                            callback();
                        }
                    },
                    error: function () {
                        $this.removeClass('comment-form-loading');
                    }
                });
                break;
        }
    }
});

if (!('ifCond' in Handlebars.helpers)) {
    Handlebars.registerHelper('ifCond', function (v1, operator, v2, options) {
        switch (operator) {
            case '==':
                return (v1 == v2) ? options.fn(this) : options.inverse(this);
            case '===':
                return (v1 === v2) ? options.fn(this) : options.inverse(this);
            case '<':
                return (v1 < v2) ? options.fn(this) : options.inverse(this);
            case '<=':
                return (v1 <= v2) ? options.fn(this) : options.inverse(this);
            case '>':
                return (v1 > v2) ? options.fn(this) : options.inverse(this);
            case '>=':
                return (v1 >= v2) ? options.fn(this) : options.inverse(this);
            case '&&':
                return (v1 && v2) ? options.fn(this) : options.inverse(this);
            case '||':
                return (v1 || v2) ? options.fn(this) : options.inverse(this);
            case '!=':
                return (v1 != v2) ? options.fn(this) : options.inverse(this);
            default:
                return options.inverse(this);
        }
    });
}

$(document).ready(function () {
    $('[data-toggle="comments"][data-action="auto"]').each(function ($i) {
        var $this = $(this);
        var $type = $this.data('comment-type');
        switch ($type) {
            case 'scorm':

                $this.addCommentForm();
                QA.loadQuestions($this);
                break;
            case 'question':
                $this.addCommentForm(function () {
                    QA.loadQuestions($this, '/qa/action/search.php', true);
                });
                break;
        }
        return false;
    });
  
    if($(document).width() < 959){
        var test = $('#scorm-view-comments').detach();            
        if (test) {
             $('#qa-mobile').append(test);
        }       
    }else{
        if($('#qa-mobile').find('#scorm-view-comments').length > 0 && !$('#content').find('#scorm-view-comments')){
            var comnentDetail = $('#scorm-view-comments').detach();
            $('#content').append(comnentDetail);
        }        
    }


    $('[data-toggle="comments"][data-action="click"]').click(function ($i) {
        var $this = $(this);
        var $type = $this.data('comment-type'),
            $paid = $this.data('comment-paid'),
            $count = $this.data('comment-count'),
            $firstPage = $this.data('first-page');
        if (!$firstPage) {
            $firstPage = 20;
        }
        var $targetID = '';
        if ($this.is('a')) {
            $targetID = $this.attr('href');
        }
        if ($this.data('comment-target')) {
            $targetID = '#' + $this.data('comment-target');
        }
        if (!$targetID) {
            return false;
        }
        var $target = $($targetID);

        if ($target.hasClass('comments-loaded')) {
            $target.toggle();
        } else {
            $target.show().data({
                'comment-type': $type,
                'comment-paid': $paid,
                'comment-count': $count,
                'first-page': $firstPage
            });
            switch ($type) {
                case 'scorm':
                    $target.data('scormid', $this.data('scormid'));
                    $target.addCommentForm();
                    $target.loadComments();
                    break;
            }
        }
        return false;
    });



    var commentContainer = $('[data-toggle="comments"]');


    /*commentContainer.on('keydown', '.qa_form_simple .qa_content', function (event) {
        var self = $(this);
        if (event.keyCode == 13) {
            if (!event.shiftKey) {
                self.parents('.qa_form_simple').find('[data-comment-action="submit"]').click();
                event.preventDefault();
            }
        }

    });*/

    //Nháº¥n nĂºt gá»­i
    commentContainer.on('click', '[data-comment-action="submit"]', function () {
        var $this = $(this);
        var $type = $this.data('comment-type');

        switch ($type) {
            case 'scorm':
            case 'question':
                var $scormid = $this.data('scormid');
                var $commentForm = $this.parents('.qa_form');
                var $inputComment = $commentForm.find('textarea');
                var commentType = $commentForm.find('[name="type"]').val();
                var time = $commentForm.find('[name="time"]').val();
                var targetId = $commentForm.find('[name="target"]').val();
                var question = $commentForm.find('[name="question"]').val();
                var parentContainer = $this.parents('.view-scorm-comments');
                var course = $commentForm.find('[name="course"]').val();

                var content = $inputComment.val();


                var form = $this.parents('.qa_form');
                var imageContainer = form.find('.image_uploaded');
                var images = imageContainer.find('.img-iu');

                if (images.length > 0) {
                    images.each(function (index) {
                        var self = $(this);
                        var image = self.data('img');
                        if (image) {
                            content += '[img]' + image + '[/img]';
                        }
                    });
                }

                $content = escapeHtmlEntities(content);

                if ($content.length < 10) {
                    alert("Ná»™i dung bĂ¬nh luáº­n quĂ¡ ngáº¯n");
                } else {

                    var $error = $this.attr("error"),
                        $replyto = $this.attr("replyto"),
                        $qaid = $this.attr("qaid"),
                        $qa_moderate = $commentForm.data('qa-moderate');
                    $wrapper = $('#' + $this.data('wrapperTarget'));

                    if ($this.hasClass('submitting')) {
                        return false;
                    }

                    $.ajax({
                        url: '/qa/action/save.php',
                        data: {
                            action: 'save',
                            scormid: $scormid,
                            replyto: $replyto,
                            qaid: $qaid,
                            content: $content,
                            error: $error,
                            type: commentType,
                            time: time,
                            target: targetId,
                            question: question,
                            course: course
                        },
                        type: 'POST',
                        dataType: 'json',
                        beforeSend: function () {
                            $this.addClass('submitting');
                        },
                        success: function ($response) {

                            var $comment;
                            if ($response.status == 'success') {

                                var $commentQA = $wrapper.find('#comment-' + $qaid);

                                $this.removeAttr('replyto').removeAttr('qaid');
                                $commentForm.find('.btn_cancel').hide();
                                $commentForm.detach().prependTo($wrapper);
                                $commentQA.removeClass("flash");

                                imageContainer.empty();

                                $inputComment.val('');
                                //$commentForm.find('[name="question"]').val('');
                                //parentContainer.data('question', '');

                                if ($response.repair == 1) {
                                    $commentQA.scrollTop(0);

                                    $('#comment-' + $qaid + ' .content p').html($response.comment);
                                    $commentQA.addClass("flash");
                                    $commentQA.attr('text_comment', $("<div/>").html($response.text).text());
                                } else {
                                    if (!$qa_moderate) {
                                        if ($replyto > 0) {
                                            var $commentReplyTo = $wrapper.find('#comments-' + $replyto);
                                            $commentReplyTo.scrollTop(0);

                                            $comment = $(QA.renderReply($response.data, $response.guest));

                                            $comment.find('.more, .btnRepair, .btnReply').data('wrapperTarget', $wrapper.attr('id'));

                                            $commentReplyTo.prepend($comment);
                                            $commentReplyTo.find('.comment').first().addClass("flash");
                                            $total_comment = $wrapper.find('#comment-' + $replyto).find('.btnReply span');
                                            $total_comment.html(parseInt($total_comment.html()) + 1);
                                        } else {
                                            var $qaComments = $wrapper.find('.qa_comments');
                                            if ($qaComments.length == 0) {

                                                $qaComments = $('<ul id="qa_comments-' + $scormid + '-'+ commentType +'" class="qa_comments"></ul>');
                                                $qaComments.appendTo($wrapper);
                                            }

                                            //if (commentType == 1) {
                                                $wrapper.find('.qa_comments').html(QA.loadMoreComments($scormid, $response.data, $response.count, $response.remainCount, 0, $response.first_perpage, $response.guest, targetId, question));
                                                $wrapper.find('.qa_comments .more, .qa_comments .btnRepair, .qa_comments .btnReply').data('wrapperTarget', $wrapper.attr('id'));
                                                $qaComments.find('.comment').first().addClass("flash");
                                            /*} else {
                                                $comment = $(QA.renderQuestion($response.data, $response.guest));

                                                $comment.find('.more, .btnRepair, .btnReply').data('wrapperTarget', $wrapper.attr('id'));
                                                $qaComments.scrollTop(0);
                                                $qaComments.prepend($comment);
                                                $qaComments.find('.comment').first().addClass("flash");
                                            }*/
                                        }
                                    }
                                }
                                $(".btn-question-follow[data-id='"+question+"']").text('Äang theo dĂµi cĂ¢u há»i ('+$response.countFollow+')');
                                $(".btn-question-comment[data-id='"+question+"']").text('Tháº£o luáº­n ('+$response.countComment+')');
                            } else {
                                alert($response.message);
                            }
                            $this.removeClass('submitting');
                        },
                        error: function () {
                            $this.removeClass('submitting');
                        }
                    });
                }
                break;
        }
        return false;
    });

    //Nháº¥n nĂºt há»§y bĂ¬nh luáº­n
    commentContainer.on('click', '[data-comment-action="cancel"]', function () {
        var $this = $(this);

        $scormid = $this.prev().attr("scormid");
        $wrapper = $('#' + $this.data('wrapperTarget'));
        $this.hide();
        $wrapper.find('[data-comment-action="submit"], [data-comment-action="cancel"]').removeAttr('replyto').removeAttr('qaid');

        var form = $wrapper.find('.qa_form');
        if (form.parents('.view-qa-single').length) {
            form.hide();
        }
        $wrapper.find('.qa_form [name="question"]').show();
        $wrapper.find('.qa_form .report_error').show();
        $wrapper.find('textarea').val('');

        if ($wrapper.find('.comment-guide').length) {
            $wrapper.find('.qa_form').detach().insertAfter($wrapper.find('.comment-guide'));
        } else {
            $wrapper.find('.qa_form').detach().prependTo($wrapper);
        }

        return false;
    });

    //Nháº¥n vĂ o cĂ¡c kĂ½ hiá»‡u
    commentContainer.on('click', '.qa_tex img', function () {
        var $this = $(this);
        var tag = $this.attr("alt"),
            textarea = $this.parents('.qa_form').find("textarea"),
            selectionStart = textarea[0].selectionStart,
            selectionEnd = textarea[0].selectionEnd;

        var val = textarea.val();
        var selected_txt = val.substring(selectionStart, selectionEnd);
        var before_txt = val.substring(0, selectionStart);
        var after_txt = val.substring(selectionEnd, val.length);

        textarea.val(before_txt + (tag == 'tex' ? '[' + tag + ']' + selected_txt + '[/' + tag + ']' : tag) + after_txt);

        //console.log(before_txt.length + ('[' + tag + ']').length);
        textarea[0].selectionStart = textarea[0].selectionEnd = before_txt.length + selected_txt.length + (tag == 'tex' ? '[' + tag + ']' : tag).length;

        if (textarea.setSelectionRange) {
            textarea.focus();
            textarea.setSelectionRange(selectionStart, selectionEnd);
        } else if (textarea.createTextRange) {
            var range = textarea.createTextRange();
            range.collapse(true);
            range.moveEnd('character', selectionEnd);
            range.moveStart('character', selectionStart);
            range.select();
        }

        textarea.focus();
    });

    //ChĂ¨n liĂªn káº¿t
    commentContainer.on('click', '.insert_link', function () {
        var textarea = $(this).parents('.qa_form').find("textarea");
        textarea.focus().val(textarea.val() + '[link=ChĂ¨n liĂªn káº¿t vĂ o Ä‘Ă¢y]ChĂ¨n ná»™i dung vĂ o Ä‘Ă¢y[/link]');
    });

    //ChĂ¨n áº£nh
    commentContainer.on('change', '.upload_image', function (e) {
        var textarea = $(this).parents('.qa_form').find("textarea");
        var event = e.originalEvent;
        var files = event.target.files;

        var self = $(this);
        var imgContainer = self.parents('.qa_form').find('.image_uploaded');

        if (files.length == 1) {
            for (var i = 0; i < files.length; i++) {

                // Ensure it's an image
                if (files[i].type.match(/image.*/)) {

                    // Load image
                    var reader = new FileReader();
                    reader.onload = function (readerEvent) {
                        var image = new Image();
                        image.onload = function (imageEvent) {

                            // Resize image
                            var canvas = document.createElement('canvas');
                            var canvas_hight = document.createElement('canvas'),
                                max_size = 1024,
                                max_size_thumb = 300;
                            width_hight = width = image.width,
                                height_hight = height = image.height;

                            if (width > height) {
                                if (width > max_size_thumb) {
                                    height *= max_size_thumb / width;
                                    width = max_size_thumb;
                                }
                                if (width_hight > max_size) {
                                    height_hight *= max_size / width_hight;
                                    width_hight = max_size;
                                }
                            } else {
                                if (height > max_size_thumb) {
                                    width *= max_size_thumb / height;
                                    height = max_size_thumb;
                                }
                                if (height_hight > max_size) {
                                    width_hight *= max_size / width_hight;
                                    height_hight = max_size;
                                }
                            }

                            canvas_hight.width = width_hight;
                            canvas_hight.height = height_hight;
                            canvas_hight.getContext('2d').drawImage(image, 0, 0, width_hight, height_hight);
                            canvas.width = width;
                            canvas.height = height;
                            canvas.getContext('2d').drawImage(image, 0, 0, width, height);
                            // Upload image
                            var xhr = new XMLHttpRequest();
                            if (xhr.upload) {


                                // File uploaded / failed
                                xhr.onreadystatechange = function (event) {
                                    if (xhr.readyState == 4) {
                                        if (xhr.status == 200) {

                                            textarea.focus();
                                            if (imgContainer.length > 0) {
                                                imgContainer.append('<div class="img-iu" data-img="'+ xhr.responseText.replace(/(\r\n|\n|\r)/gm,"") +'"><a class="remove-image close">x</a><img src="'+ xhr.responseText +'"></div>');
                                            } else {
                                                textarea.val(textarea.val() + '[img]' + xhr.responseText + '[/img]');
                                            }

                                        } else {
                                            alert('CĂ³ lá»—i xáº£y ra, vui lĂ²ng thá»­ láº¡i!');
                                        }
                                    }
                                }

                                // Start upload
                                xhr.open('post', '/qa/process.php', true);
                                xhr.send(canvas.toDataURL('image/jpeg') + '|' + canvas_hight.toDataURL('image/jpeg'));

                            }

                        }

                        image.src = readerEvent.target.result;

                    }
                    reader.readAsDataURL(files[i]);
                }

            }
        } else {
            alert("Sá»‘ áº£nh táº£i lĂªn quĂ¡ nhiá»u!")
        }
        ;
        // Clear files
        event.target.value = '';
    });

    //Nháº¥n nĂºt xem thĂªm bĂ­nh luáº­n
    commentContainer.on('click', '.qa_comments .more', function () {
        var $this = $(this);
        var $qaid = ($this.attr("qaid") != undefined) ? $this.attr("qaid") : 0;
        var $scormid = $this.attr("scormid") != 'undefined' ? $this.attr("scormid") : 0;
        var $page = $this.attr("page");
        var targetId = $this.data('target');
        var type = $this.parents(".view-scorm-comments").data('type');

        var $wrapper = $('#' + $this.data('wrapperTarget'));
        var $firstPage = $wrapper.data('first-page');
        var question = $this.data('question');
        var course = $this.parents(".view-scorm-comments").data('course');
        if (!$firstPage) {
            $firstPage = 20;
        }
        if ($this.hasClass('loading')) {
            return false;
        }
        $.ajax({
            url: '/qa/action/list-more.php',
            data: {
                action: 'listmore',
                qaid: $qaid,
                scormid: $scormid,
                page: $page,
                first_page: $firstPage,
                target: targetId,
                type: type,
                course: course,
                question: question
            },
            type: 'POST',
            dataType: 'JSON',
            beforeSend: function () {
                $this.addClass('loading');
            },
            success: function (response) {
                console.log(response);
                if (response.status == 'success') {
                    var html = '';
                    if ($qaid) {
                        html = QA.loadMoreReplies($qaid, response.data, response.count, response.remain, $page, response.first_perpage, response.guest, $scormid, question);
                    } else {
                        html = QA.loadMoreComments($scormid, response.data, response.count, response.remainCount, $page, response.first_perpage, response.guest, targetId, question);
                    }
                }

                if (html) {
                    var $data = $(html);
                    $data.last().data('wrapperTarget', $this.data('wrapperTarget'));
                    $data.find('.btnRepair, .btnReply').data('wrapperTarget', $this.data('wrapperTarget'));
                    $this.parent().append($data);
                }

                $this.removeClass('loading');
                $this.remove();
            },
            error: function () {
                $this.removeClass('loading');
            }
        });

        return false;
    });

    //Nháº¥n like bĂ¬nh luáº­n
    commentContainer.on('click', '.qa_comments .btnLike', function () {
        var $this = $(this);

        if ($this.hasClass('notlogin')) {
            alert("Báº¡n chÆ°a Ä‘Äƒng nháº­p!");
            return false;
        }

        var $qaid = $this.attr("qaid");
        var $scormid = $this.attr("scormid");

        $.ajax({
            url: '/qa/action/like.php',
            data: {qaid: $qaid, scormid: $scormid},
            type: 'POST',
            success: function (data) {
                var $countLike = $this.children("span");
                if ($this.hasClass("disabled")) {
                    var $count = parseInt($countLike.html()) - 1;
                    $countLike.html($count);
                    if ($count == 0) {
                        $countLike.hide();
                    }
                    $this.removeClass("disabled");
                    $this.attr("title", "ThĂ­ch");
                } else {
                    var $count = parseInt($countLike.html()) + 1;
                    $countLike.show().html($count);
                    $this.addClass("disabled");
                    $this.attr("title", "Bá» thĂ­ch");
                }
            }
        });

        return false;
    });

    //Type in question input


    var timer;
    commentContainer.on('input', 'input[name="question"]' ,  function() {
        var self = $(this);

        clearTimeout(timer);
        timer = setTimeout(function () {
            var question = self.val();
            var parentContainer = self.parents('.view-scorm-comments');

            parentContainer.data('question', question);
            parentContainer.removeClass('comments-loading comments-loaded');
            QA.loadQuestions(parentContainer, '/qa/action/search.php', true);

        }, 500);
    });

    //Nháº¥n nĂºt sá»­a bĂ¬nh luáº­n
    commentContainer.on('click', '.qa_comments .btnRepair', function () {
        var $this = $(this),
            $scormid = $this.attr("scormid"),
            $qaid = $this.attr("qaid");

        var $wrapper = $('#' + $this.data('wrapperTarget'));

        $wrapper.find('[data-comment-action="submit"]').removeAttr('replyto').removeAttr('qaid');
        $wrapper.find('.qa_form').show();
        $wrapper.find('.qa_form .btn_cancel').show();
        $wrapper.find('.qa_form .report_error').hide();
        $wrapper.find('.qa_form [name="question"]').hide();
        $wrapper.find('.qa_form').detach().appendTo($this.parent().parent());

        $wrapper.find('.qa_form textarea').focus();
        $wrapper.find('[data-comment-action="submit"]').attr("qaid", $qaid);

        $.post('/qa/action/get-comment.php', {qaid: $qaid}, function (response) {
            if (response.status == 'success') {
                $wrapper.find('textarea').val(response.data.content);
            }
        }, 'JSON');
        return false;
    });

    //Nháº¥n vĂ o nĂºt tráº£ lá»i bĂ¬nh luáº­n
    commentContainer.on('click', '.qa_comments .btnReply', function () {
        var $this = $(this);
        if ($this.hasClass('notlogin')) {
            alert("Báº¡n hĂ£y Ä‘Äƒng nháº­p Ä‘á»ƒ tham gia tháº£o luáº­n nhĂ©!");
            return false;
        }


        var $scormid = $this.attr("scormid"),
            $replyto = $this.attr("replyto");

        var $wrapper = $('#' + $this.data('wrapperTarget'));

        $wrapper.find('[data-comment-action="submit"]').removeAttr('replyto').removeAttr('qaid');
        $wrapper.find('.qa_form .btn_cancel').show();
        $wrapper.find('.qa_form').show();
        $wrapper.find('.qa_form').detach().appendTo($this.parent().parent());
        $wrapper.find('.qa_form textarea').val('');
        $wrapper.find('.qa_form textarea').focus();
        $wrapper.find('.qa_form [name="question"]').hide();
        $wrapper.find('[data-comment-action="submit"]').attr("replyto", $replyto);
        $wrapper.find('.qa_form .report_error').hide();
        return false;
    });

    //Nháº¥n nĂºt duyá»‡t hoáº·c bá» duyá»‡t
    commentContainer.on('click', '.qa_comments .btnApprove', function () {
        var $this = $(this),
            $scormid = $this.attr("scormid"),
            $qaid = $this.attr("qaid");

        $ok = confirm("Báº¡n cĂ³ cháº¯n cháº¯n " + ($this.hasClass("approved") ? "Bá»" : "") + " DUYá»†T ná»™i dung nĂ y khĂ´ng?");

        if ($ok == true) {
            $.ajax({
                url: '/qa/comment2.php',
                data: {action: 'approve', qaid: $qaid, scormid: $scormid},
                type: 'POST',
                success: function (data) {
                    if (data == 'ok') {
                        if ($this.hasClass("approved")) {
                            $this.removeClass('approved');
                            $this.text('Duyá»‡t');
                        } else {
                            $this.addClass('approved');
                            $this.text('Bá» duyá»‡t');
                        }
                    }
                }
            });
        }

        return false;
    });
    //Nháº¥n nĂºt xĂ³a bĂ¬nh luáº­n
    commentContainer.on('click', '.qa_comments .btnDelete', function () {
        var $this = $(this),
            $scormid = $this.attr("scormid"),
            $qaid = $this.attr("qaid");

        $ok = confirm("Báº¡n cĂ³ cháº¯n cháº¯n XĂ“A ná»™i dung nĂ y khĂ´ng?");

        if ($ok == true) {
            $.ajax({
                url: '/qa/action/delete.php',
                data: {action: 'delete', qaid: $qaid, scormid: $scormid},
                type: 'POST',
                success: function (data) {
                    if (data == 'ok') {
                        $this.parent().parent().fadeOut("slow", function () {
                            $this.closest('li').remove();
                        });
                    }
                }
            });
        }

        return false;
    });

    //Chuyá»ƒn bĂ¬nh luáº­n thĂ nh bĂ¡o lá»—i
    commentContainer.on('click', '.qa_comments .convert_error', function () {
        var $this = $(this),
            $scormid = $this.attr("scormid"),
            $status = $this.attr("status");
        $qaid = $this.attr("qaid");

        $ok = confirm("Báº¡n cĂ³ muá»‘n chuyá»ƒn tháº£o luáº­n nĂ y thĂ nh thĂ´ng bĂ¡o lá»—i?");

        if ($ok == true) {
            $.ajax({
                url: '/qa/comment2.php',
                data: {action: 'convert_error', qaid: $qaid, scormid: $scormid, status: $status},
                type: 'POST',
                success: function (data) {
                    $this.parent().parent().removeClass('flash');
                    if (data == 'ok') {
                        $this.parent().parent().addClass('flash');
                        if ($status == 2) {
                            $this.html('Chuyá»ƒn vá» tráº£ lá»i');
                            $this.attr('status', '1');
                        } else {
                            $this.html('Chuyá»ƒn vá» bĂ¡o lá»—i');
                            $this.attr('status', '2');
                        }
                    } else if (data == 'no') {
                        alert('Báº¡n khĂ´ng cĂ³ quyá»n thá»±c hiá»‡n thao tĂ¡c nĂ y!');
                    }
                }
            });
        }

        return false;
    });

    /*commentContainer.on('click', '.qa_comments .view-qa a', function (e) {
        e.preventDefault();
        var self = $(this);
        var url = self.attr('href');
        var id = self.data('id');
        var scormId = self.data('scormid');
        var type = self.data('type');

        var modal = $('#viewQAModal');
        var container = modal.find('.view-scorm-comments');

        $.ajax({
            url: '/qa/action/list.php',
            data: {scormid: scormId, type: type, notif_qaid: id},
            type: 'GET',
            dataType: 'JSON',

            beforeSend: function () {
                self.addClass('comments-loading');
            },

            success: function ($response) {
                if ($response.status == 'success') {
                    container.html(QA.showCommentBlock(scormId, $response.data, $response.count, $response.remainCount, 0, $response.first_perpage, $response.guest));
                    container.find('.qa_comments .more').data('wrapperTarget', id);
                    modal.modal('show');
                    history.pushState('', '', url);
                } else {
                    //window.location = url;
                }
            },

            error: function () {
                self.removeClass('comments-loading');
            }
        });
    });*/

    //Nháº¥n like bookmark
    commentContainer.on('click', '.qa_comments .btnBookmark', function () {
        var $this = $(this);
        if ($this.hasClass('notlogin')) {
            alert("Báº¡n chÆ°a Ä‘Äƒng nháº­p!");
            return false;
        }

        var $qaid = $this.attr("qaid");
        var $scormid = $this.attr("scormid");

        $.ajax({
            url: '/qa/action/bookmark.php',
            data: {qaid: $qaid, scormid: $scormid},
            type: 'POST',
            dataType: 'JSON',
            success: function (data) {
                if (data.status == 'success') {
                    if (data.state == 1) {
                        $this.attr("title", "Bá» theo dĂµi");
                        $this.text("Bá» theo dĂµi");
                        console.log(23);
                    } else {
                        $this.attr("title", "Theo dĂµi");
                        $this.text("Theo dĂµi");
                    }
                }
            }
        });

        return false;
    });

    $('#learn-page').on('focus', '.qa_form textarea', function () {
        var self = $(this);
        var form = self.parents('.qa_form');

        if (typeof QA.videoPlayer !== 'undefined') {
            QA.videoPlayer.pause();
            var videoIndex = QA.getVideoIndex(QA.videoPlayer);
            form.find('[name="time"]').val(videoIndex.offset);
            form.find('[name="target"]').val(videoIndex.scoreid);

            if (!QA.focus || (QA.focus && QA.currentVideo == videoIndex.scoreid && Math.abs(QA.currentOffset - videoIndex.offset) > 120)) {

                if (form.parent().hasClass('.view-scorm-comments')) {
                    // load comment
                    var container = $('[data-toggle="comments"][data-action="tab-show"]');
                    container.data('target', videoIndex.scoreid);
                    container.data('path', 1);
                    container.data('time', videoIndex.offset);
                    QA.loadQuestions(container);
                }
            }

            QA.focus = 1;
            QA.currentVideo = videoIndex.scoreid;
            QA.currentOffset = videoIndex.offset;
        }
    });

    $('#viewQAModal').on('hidden.bs.modal', function () {
        window.history.back();
    });

    var $notifPage = 1;
    $('#notification').click(function (e) {
        var $this = $(this);
        if (!$this.hasClass('loaded')) {
            $this.addClass('loaded');
            $.ajax({
                url: '/qa/action/notification.php',
                data: {notif_page: 0},
                type: 'POST',
                success: function (data) {
                    if (data != '') {
                        console.log(data);
                        $('#notification-list').append(data);
                        $notifPage++;
                    }
                }
            });
        }
        $('#notification-box').show();
        return false;
    });

    $('#notification-more').click(function (e) {
        var $this = $(this);
        if (!$this.hasClass('loading')) {
            $this.addClass('loading');
            $.ajax({
                url: '/qa/action/notification.php',
                data: {notif_page: $notifPage},
                type: 'POST',
                success: function (data) {
                    if (data != '') {
                        $('#notification-list').append(data);
                        $notifPage++;
                    } else {
                        $this.hide();
                    }
                    $this.removeClass('loading');
                }
            });
        }
        return false;
    });

    $notifID = 0;
    $('#notification-box').hover(function (e) {
        clearTimeout($notifID);
    }, function (e) {
        var $this = $(this);
        $notifID = setTimeout(function () {
            $this.hide();
        }, 500);
    });
    
    $('#notification-box').on('click', '[data-notifid]', function () {
        var $this = $(this);
        var $notifID = $this.data('notifid');
        if ($notifID) {
            $.ajax({
                url: '/qa/action/read-notification.php',
                data: {action: 'readnotif', notifid: $notifID},
                type: 'GET',
                success: function ($response) {

                }
            });
        }
        $this.css({color: '#505050'});
    });

    commentContainer.on('click', '.qa_form .remove-image', function (e) {
        e.preventDefault();

        var self = $(this);
        self.closest('div').remove();
    });
});