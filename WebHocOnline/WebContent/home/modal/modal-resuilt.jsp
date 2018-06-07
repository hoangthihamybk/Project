<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal hocmai-modal fade" id="changeThemeModal" tabindex="-1" role="dialog" aria-labelledby="changeThemeModalTitle" aria-hidden="true">
    <div class="modal-dialog" style="width: 450px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="changeThemeModalTitle">Xác nhận</h4>
            </div>
            <div class="modal-body">
                <div class="warning-des">Vui lòng xác nhận sử dụng giao diện cũ của Hocmai.vn</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-cancel" data-dismiss="modal">Bỏ qua</button>
                <button id="changethemehocmai" type="button" class="btn btn-primary" data-dismiss="modal">Đồng ý</button>
            </div>
        </div>
    </div>
</div>

<div class="modal hocmai-modal fade" id="errorVideoModal" tabindex="-1" role="dialog" aria-labelledby="errorVideoModalTitle" aria-hidden="true">
    <div class="modal-dialog" style="width: 450px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="errorVideoModalTitle">Thông báo</h4>
            </div>
            <div class="modal-body">
                <div class="warning-des">Đã có lỗi xảy ra trong quá trình xem video bài giảng. Vui lòng thử lại sau 17h00phút</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-cancel" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<div class="modal hocmai-modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalTitle" aria-hidden="true">
    <div class="modal-dialog" style="">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="loginModalTitle">đăng nhập</h4>
            </div>
            <div class="modal-body">
                <form id="login" name="login" method="post" action="/loginv2/index.php">
                    <div class="alertMsg"></div>
                    <div class="clearfix">
                        <div class="login-element-wr input-username">
                            <input type="text" class="edit-login" size="30" name="username" placeholder="Tên đăng nhập"/>
                        </div>
                        <div class="login-element-wr input-password">
                            <input type="password" id="realpass" size="30" name="password" class="edit-login" placeholder="Mật khẩu"/>
                        </div>
                        <div class="clearfix">
                            <div class="login-actions">
                                <input type="hidden" id="a" value="https://hocmai.vn/mod/quiz/review.php?attempt=22892690" name="a"/>
                                <input type="hidden" id="testcookies" value="1" name="testcookies"/>
                                <div class="login-actions-left" style="display: none;">
                                    <div class="checkbox">
                                        <input type="checkbox" class="chkRemember" name="remember" value="1" style="margin-left: -20px;">
                                        <label><span>Ghi nhớ</span></label>
                                    </div>
                                </div>
                                <div class="login-actions-right">
                                    <input type="submit" class="btn-login" value="Đăng nhập"/>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="login-action-sub">
                                <ul>
                                    <li><a target="_blank" href="https://hocmai.vn/loginv2/signup.php" class="login-register">Đăng ký</a></li>
                                    <li><a class="login-forgot" target="_blank" href="https://hocmai.vn/loginv2/forgot_password.php">Quên mật khẩu?</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="login-social">
                    <ul>
                        <li class="fb-social" data-name="facebook"><a href="/login/?&miniLogin=facebook" class="blue-tooltip" data-toggle="tooltip" title="Đăng nhập bằng facebook"></a></li>
                        <li class="google-social" data-name="google"><a href="/login/loginGoogle2.php?" class="blue-tooltip" data-toggle="tooltip" title="Đăng nhập bằng google"></a></li>
                        <li class="yahoo-social" data-name="yahoo"><a href="/login/?&miniLogin=openid&auth=yahoo" class="blue-tooltip" data-toggle="tooltip" title="Đăng nhập bằng yahoo"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal hocmai-modal fade" id="fbConfirmModal" role="dialog" aria-labelledby="fbConfirmModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="fbConfirmModalTitle">Tham gia group khóa học "20h tán đổ môn Hóa"</h4>
            </div>
            <div class="modal-body">
                <form id="fb-confirm-form" class="confirm-form" name="uicf" method="post" action="/user/fb-confirm.php">
                    <div>
                        <p>Group "<a href="https://www.facebook.com/groups/hoa.thayledangkhuong.hocmai/" target="_blank">Chinh phục điểm cao môn Hoá</a>" chỉ dành cho học sinh đã đăng kí khoá học và là nơi để Bạn thực hành, trao đổi bài tập trong khoá học với thầy Lê Đăng Khương. Bạn cần làm theo 2 bước sau để tham gia group:</p>
                        <p><strong>Bước 1</strong>: Kết bạn với tài khoản <a href="https://www.facebook.com/hocsinhcap3" target="_blank">HS Hocmai</a></p>
                        <p><strong>Bước 2</strong>: Gửi Tin nhắn tới tài khoản <a href="https://www.facebook.com/hocsinhcap3" target="_blank">HS Hocmai</a> với nội dung: <br/><br/><i>Em đã đăng kí khoá PEN-C/PEN-I thầy Lê Đăng Khương, tài khoản đăng kí khoá học của em là....</i></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal hocmai-modal fade" id="testTrialModal" role="dialog" aria-labelledby="testTrialModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="testTrialModalTitle">Đặt chỗ PEN-I giảm 30% học phí</h4>
            </div>
            <div class="modal-body">
                <div>
                    <p>- Ưu đãi <strong style="color: red">30%</strong> học phí PEN-I dành riêng cho bạn</p>
                    <p>- Thời gian: Chỉ đến hết <strong style="color: red">4/12/2015</strong></p>
                </div>
                <div class="dc-btn-wrapper">
                    <a class="btn btn-primary" href="http://hocmai.vn/su-kien/dat-cho-pen-i/?utm_source=course-pop-up&utm_medium=pop-up&utm_campaign=DC-PEN-I-2016">Đặt chỗ ngay</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal hocmai-modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModalTitle" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 450px; width: 100%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="messageModalTitle">Thông báo</h4>
            </div>
            <div class="modal-body">
                <div class="warning-des"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-cancel" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="loginSocialModal" tabindex="-1" role="dialog" aria-labelledby="loginSocialTitle" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="loaderv2">
                    <img src="https://hocmai.vn/theme/new2/images/ajax-loader.gif" alt="">
                    <p class="loaderv2-text">Bạn đang đăng nhập. Vui lòng chờ trong giây lát.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="viewQAModal" tabindex="-1" role="dialog" aria-labelledby="viewQAModalTitle" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 600px; width: 100%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <div class="view-scorm-comments" id="scorm-comments-view" data-toggle="comments" data-action="auto">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-cancel" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="sectionLevelModal" tabindex="-1" role="dialog" aria-labelledby="sectionLevelTitle" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body"></div>
        </div>
    </div>
</div>
<div class="modal hocmai-modal fade" id="registerPackageModal" tabindex="-1" role="dialog" aria-labelledby="registerPackageTitlte" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Hocmai</h4>
            </div>
            <div class="modal-body">
                <p class="rp-message">Bạn cần <strong>ĐĂNG KÝ</strong> khóa học này để tham gia làm bài "Đánh giá năng lực"!</p>
                <div class="rp-btn">
                    <a href="#" class="course-register-now">Đăng ký ngay</a>
                </div>
            </div>
        </div>
    </div>
</div>