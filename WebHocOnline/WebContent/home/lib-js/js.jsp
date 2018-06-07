<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script type="text/javascript" src="../js/theme/new2/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="../js/theme/new2/jquery.cookie.js"></script>
    <script type="text/javascript" src="../js/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../js/theme/bt/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/plugins/jquery.validate.min.js"></script>
    <script type="text/javascript" src="../js/plugins/select2.js"></script>

 	<script type="text/javascript" src="js/js1.js"></script>
     
    <script src="../js/loginv2/lib.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/plugins/handlebars.js"></script>

    <script type="text/javascript" src="../js/plugins/MathJax.js"></script>
    <script type="text/javascript" src="../js/theme/new2/player.js"></script>
    <script type="text/javascript" src="../js/qa/qa.js"></script>
    <script type="text/javascript" src="../js/theme/new2/user-info.js"></script>
    <script type="text/javascript" src="../js/theme/new2/scripts.js"></script>
    <script type="text/javascript" src="../js/theme/new2/cfl.js"></script>
    <script type="text/javascript" src="../js/qa/comments.js"></script>

    <script type="text/javascript" src="../js/theme/new2/notes.js"></script>
    <script type="text/javascript" src="../js/theme/new2/mycourse.js"></script>
    <script type="text/javascript" src="../js/theme/new2/loginv2.js"></script>
    <script type="text/javascript" src="../js/theme/new2/section-level.js"></script>
    
    <script id="qa-item" type="text/x-handlebars-template">
    <li>
        {{#ifCond type '==' 1 }}
        <div class="row clearfix">
            <div class="col-sm-2">
                <span class="comment-time">{{time}}</span>
            </div>
            <div class="col-sm-10">
        {{/ifCond}}
        {{#ifCond type '==' 3 }}
        <div class="row clearfix">
            <div class="col-sm-1">
                <span class="qa-profile-pic">{{{pix}}}</span>
            </div>
            <div class="col-sm-11">
        {{/ifCond}}
                <div class="comment" id="comment-{{id}}" text_comment="{{content}}">
                    <p class="meta">
                        <span class="author {{#if isT}}isteacher{{/if}}">{{author}}</span>
                        <span class="time">{{created}}</span>
                        <span class="view-qa"><a target="_blank" href="/qa/view.php?id={{id}}" data-id="{{id}}" data-scormid="{{scormid}}" data-type="{{type}}"><i class="fa fa-link" aria-hidden="true"></i></a></span>
                    </p>
                    <div class="content {{#unless isApprove}}removed{{/unless}}">
                        <p>
                            {{#if isApprove}}
                            {{{content}}}
                            {{else}}
                            Nội dung vi phạm, đã bị ẩn bởi Hocmai.vn!
                            {{/if}}
                        </p>
                    </div>
                    <div class="actions">
                        {{#if isApprove}}
                        <a class="btnLike {{#if isQalike}}disabled{{/if}} {{#if guest}}notlogin{{/if}}" title="{{#if isQalike}}Bỏ thích{{else}}Thích{{/if}}" href="#like" scormid="{{scormid}}"  qaid="{{id}}"><span style="display: {{#if liked}}inline{{else}}none{{/if}};">{{liked}}</span> Thích</a>
                        <a class="btnReply {{#if guest}}notlogin{{/if}}" href="#reply" scormid="{{scormid}}" replyto="{{id}}"><span>{{replies_count}}</span> Trả lời</a>
                        {{#if isOwner}}
                        {{else}}
                        <a class="btnBookmark {{#if guest}}notlogin{{/if}}" href="#bookmark" scormid="{{scormid}}" qaid="{{id}}">{{#if isBookmark}}Bỏ theo dõi{{else}}Theo dõi{{/if}}</a>
                        {{/if}}
                        {{/if}}

                        {{#if allowAction}}
                        <a class="btnRepair" href="#repair" scormid="{{scormid}}" qaid="{{id}}">Sửa</a>
                        {{/if}}

                        {{#if isMod}}
                        {{#ifCond status '!=' 2}}
                        <a class="btnApprove {{#ifCond status '!=' 0}}approved{{/ifCond}}" href="#approve" scormid="{{scormid}}" qaid="{{id}}">{{#ifCond status '!=' 0}}Bỏ Duyệt{{/ifCond}}{{#ifCond status '==' 0}}Duyệt{{/ifCond}}</a>
                        {{/ifCond}}
                        <!--<a class="btnDelete" href="#delete" scormid="{{scormid}}" qaid="{{id}}">Xóa</a>-->
                        {{/if}}

                        <a class="btnReport" href="#report" scormid="{{scormid}}" qaid="{{id}}">Báo cáo vi phạm</a>
                    </div>
                </div>
                <ul class="comments" id="comments-{{id}}">
                    {{#if replies_count}}
                        {{#each replies}}
                            <li>
                                {{#ifCond reply.type '==' 3 }}
                                <div class="row clearfix">
                                    <div class="col-sm-1">
                                        <span class="qa-profile-pic">{{{reply.pix}}}</span>
                                    </div>
                                    <div class="col-sm-11">
                                {{/ifCond}}

                                <div class="comment" id="comment-{{reply.id}}" text_comment="{{reply.content}}">
                                    <p class="meta">
                                        <span class="author">{{reply.author}}</span>
                                        <span class="time">{{reply.created}}</span>
                                    </p>
                                    <div class="content">
                                        <p>{{{reply.content}}}</p>
                                    </div>
                                    <div class="actions">
                                        <a class="btnLike {{#ifCond qaliked '==' 1}}disabled{{/ifCond}} {{#if guest}}notlogin{{/if}}" title="{{#ifCond qaliked '==' 1}}Bỏ thích{{/ifCond}} {{#ifCond qaliked '!=' 1}}Thích{{/ifCond}} " href="#like" scormid="{{../scormid}}"  qaid="{{reply.id}}"><span style="display:{{#if reply.liked}}inline{{else}}none{{/if}};">{{reply.liked}}</span> Thích</a>
                                        {{#ifCond isOwner '||' ../isMod}}
                                        <a class="btnRepair" href="#repair" scormid="{{scormid}}" qaid="{{reply.id}}">Sửa</a>
                                        {{/ifCond}}

                                        {{#if ../isMod}}
                                        <a class="btnApprove {{#ifCond reply.status '!=' 0}}approved{{/ifCond}}" href="#approve" scormid="{{../scormid}}" qaid="{{reply.id}}">{{#ifCond reply.status '!=' 0}}Bỏ Duyệt{{/ifCond}}{{#ifCond reply.status '==' 0}}Duyệt{{/ifCond}}</a>
                                        <!--<a class="btnDelete" href="#delete" scormid="{{../scormid}}" qaid="{{reply.id}}">Xóa</a>-->
                                        {{/if}}

                                        <a class="btnReport" href="#report" scormid="{{../scormid}}" qaid="{{reply.id}}">Báo cáo vi phạm</a>
                                    </div>
                                </div>
                                {{#ifCond reply.type '==' 3 }}
                                    </div>
                                </div>
                                {{/ifCond}}
                            </li>
                        {{/each}}
                    {{/if}}
                    {{#ifCond replies_count '>' first_perpage}}
                    <li class="more" qaid="{{id}}" scormid="{{scormid}}" page="1" style="margin-left: 0 !important;">Xem thêm {{remain}} trả lời</li>
                    {{/ifCond}}
                </ul>
        {{#ifCond type '==' 1 }}
            </div>
        </div>
        {{/ifCond}}
        {{#ifCond type '==' 3 }}
            </div>
        </div>
        {{/ifCond}}

    </li>
</script>

<script id="qa-child-item" type="text/x-handlebars-template">
    <li>
        {{#ifCond type '==' 3 }}
        <div class="row clearfix">
            <div class="col-sm-1">
                <span class="qa-profile-pic">{{{pix}}}</span>
            </div>
            <div class="col-sm-11">
        {{/ifCond}}

        <div class="comment" id="comment-{{id}}" text_comment="{{content}}">
            <p class="meta">
                <span class="author">{{author}}</span>
                <span class="time">{{created}}</span>
            </p>
            <div class="content">
                <p>{{{content}}}</p>
            </div>
            <div class="actions">
                <a class="btnLike {{#if isQalike}}disabled{{/if}} {{#if guest}}notlogin{{/if}}" title="{{#if isQalike}}Bỏ thích{{else}}Thích{{/if}}" href="#like" scormid="{{scormid}}"  qaid="{{id}}"><span style="display:{{#if liked}}inline{{else}}none{{/if}};">{{liked}}</span> Thích</a>
                {{#if allowAction}}
                <a class="btnRepair" href="#repair" scormid="{{scormid}}" qaid="{{id}}">Sửa</a>
                {{/if}}

                {{#if isMod}}
                <a class="btnApprove {{#ifCond status '!=' 0}}approved{{/ifCond}}" href="#approve" scormid="{{scormid}}" qaid="{{id}}">{{#ifCond status '!=' 0}}Bỏ Duyệt{{/ifCond}}{{#ifCond status '==' 0}}Duyệt{{/ifCond}}</a>
                <!--<a class="btnDelete" href="#delete" scormid="{{scormid}}" qaid="{{id}}">Xóa</a>-->
                {{/if}}

                <a class="btnReport" href="#report" scormid="{{scormid}}" qaid="{{id}}">Báo cáo vi phạm</a>
            </div>
        </div>
        {{#ifCond type '==' 3 }}
            </div>
        </div>
        {{/ifCond}}
    </li>
</script>    

<script language="JavaScript" type="text/javascript" src="../js/lib/javascript-static.js"></script>
<script language="JavaScript" type="text/javascript" src="../js/lib/overlib.js"></script>
<script language="JavaScript" type="text/javascript" src="../js/lib/cookies.js"></script>


<script language="JavaScript" type="text/javascript" defer="defer">

</script>
    <script type="text/javascript">
    <!--
    	$j = jQuery;
    -->   
</script>

<script type="text/javascript">
        <!--//--><![CDATA[//><!--
        var pp_gemius_identifier = 'ByOVTycSJbxLGbNpycu8Dpa0zSUpqY8shVo0VbDkTez.r7';
        // lines below shouldn't be edited
        function gemius_pending(i) { window[i] = window[i] || function() {var x = window[i+'_pdata'] = window[i+'_pdata'] || []; x[x.length]=arguments;};};gemius_pending('gemius_hit'); gemius_pending('gemius_event'); gemius_pending('pp_gemius_hit'); gemius_pending('pp_gemius_event');(function(d,t) {try {var gt=d.createElement(t),s=d.getElementsByTagName(t)[0],l='http'+((location.protocol=='https:')?'s':''); gt.setAttribute('async','async');gt.setAttribute('defer','defer'); gt.src=l+'://hc.viam.com.vn/xgemius.js'; s.parentNode.insertBefore(gt,s);} catch (e) {}})(document,'script');
        //--><!]]>
</script>

<script src="../js/script.js" type="text/javascript"></script>