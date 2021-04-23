<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>login</title>
    <script src="<%=request.getContextPath()%>/static/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap3/js/bootstrap.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap3/css/bootstrap.css"></link>
    <script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
    <%--<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">--%>
    <!--font-awesome 核心我CSS 文件-->
    <link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

    <%--<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/style.css">

    <style type="text/css">
        .form{background: rgba(255,255,255,0.2);width:400px;margin:100px auto;}
        #login_form{display: block;}
        #register_form{display: none;}
        .fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
        input[type="text"],input[type="password"]{padding-left:26px;}
        .checkbox{padding-left:21px;}
    </style>
</head>
<body>
<!--
			基础知识：
			网格系统:通过行和列布局
			行必须放在container内
			手机用col-xs-*
			平板用col-sm-*
			笔记本或普通台式电脑用col-md-*
			大型设备台式电脑用col-lg-*
			为了兼容多个设备，可以用多个col-*-*来控制；
		-->
<div class="container">
    <div class="form row">
        <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form">
            <h3 class="form-title">Login to your account</h3>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="Username" name="userName" autofocus="autofocus" maxlength="20"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="Password" name="password" maxlength="8"/>
                </div>
                <div class="form-group">
                    <label class="checkbox">
                        <input type="checkbox" name="remember" value="1"/> Remember me
                    </label>
                    <hr />
                    <a href="javascript:" id="register_btn" class="">Create an account</a>
                </div>
                <div class="form-group">
                    <input type="button" class="btn btn-success pull-right" value="Login " id="loginbtn"/>
                </div>
            </div>
        </form>
    </div>

    <div class="form row">
        <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form">
            <h3 class="form-title">Login to your account</h3>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="Username" name="username" autofocus="autofocus"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="Password" id="register_password" name="password"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-check fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="Re-type Your Password" name="repassword"/>
                </div>
                <%--<div class="form-group">--%>
                    <%--<i class="fa fa-envelope fa-lg"></i>--%>
                    <%--<input class="form-control eamil" type="text" placeholder="Email" name="email"/>--%>
                <%--</div>--%>
                <div class="form-group">
                    <input type="button" class="btn btn-success pull-right" id="signUp_btn" value="Sign Up "/>
                    <input type="submit" class="btn btn-info pull-left" id="back_btn" value="Back"/>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">

    function showToast(msg,shortCutFunction)
    {
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "progressBar": true,
            "positionClass": "toast-bottom-right",
            "onclick": null,
            "showDuration": "400",
            "hideDuration": "1000",
            "timeOut": "7000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr[shortCutFunction](msg,"提示");
    }


    $(function () {
        $("#login_form").bootstrapValidator({

            live: 'enabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
            excluded: [':disabled', ':hidden', ':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的
            submitButtons: '#btn-test',//指定提交按钮，如果验证失败则变成disabled，但我没试成功，反而加了这句话非submit按钮也会提交到action指定页面
            message: '通用的验证失败消息',//好像从来没出现过
            feedbackIcons: {//根据验证结果显示的各种图标
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                // email: {
                //     validators: {
                //         emailAddress: {//验证email地址
                //             message: '不是正确的email地址'
                //         },
                //         notEmpty: {//检测非空
                //             message: '请输入邮箱'
                //         },
                //     }
                // },
                password: {
                    validators: {
                        notEmpty: {//检测非空
                            message: '请输入密码'
                        },
                    }
                },
                repassword: {
                    validators: {
                        notEmpty: {//检测非空
                            message: '请输入确认密码'
                        },
                        identical: {//与指定控件内容比较是否相同，比如两次密码不一致
                            field: 'password',//指定控件name
                            message: '两次输入的密码不同'
                        },
                    }
                },
                username: {
                    validators: {
                        notEmpty: {//检测非空,radio也可用
                            message: '请输入用户名'
                        },
                        stringLength: {//检测长度
                            min: 3,
                            max: 10,
                            message: '长度必须在3-10之间'
                        },
                        regexp: {//正则验证
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '所输入的字符不符要求'
                        },
                    }
                }
            }
        });

        function showToast(msg,shortCutFunction)
        {
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "progressBar": true,
                "positionClass": "toast-bottom-right",
                "onclick": null,
                "showDuration": "400",
                "hideDuration": "1000",
                "timeOut": "7000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
            toastr[shortCutFunction](msg,"提示");
        }

        $("#signUp_btn").click(function () {//非submit按钮点击后进行验证，如果是submit则无需此句直接验证
            $("#login_form").bootstrapValidator('validate');//提交验证
            if ($("#login_form").data('bootstrapValidator').isValid()) {//获取验证结果，如果成功，执行下面代码
                showToast("2345678","error");
                alert("yes");//验证成功后的操作，如ajax
            }
        });
    });


    $(function() {

        $('#register_btn').click(function() {

            $('#register_form').css("display", "block");
            $('#login_form').css("display", "none");
        });
        $('#back_btn').click(function() {
            $("#register_form").css("display", "none");
            $("#login_form").css("display", "block");
        });
    });

    $("#loginbtn").click(function () {//非submit按钮点击后进行验证，如果是submit则无需此句直接验证
        $("#login_form").bootstrapValidator('validate');//提交验证
        if ($("#login_form").data('bootstrapValidator').isValid()) {//获取验证结果，如果成功，执行下面代码

        //ajax
            $.ajax({
                        url:"${ctx}/user/userlogin",
                        type:"post",
                        //contentType: "application/json;charset=UTF-8",
                       // dataType:'json',
                        data: $("#login_form").serialize(),
                        success:function(data){
                        showToast(data,"info");
                        if(data.status=="200"){
                            location.href = "<%=request.getContextPath() %>/menu/index";
                        }
                       //$.messager.alert("提示消息",data,"info");
                            // 刷新页面
                      //$("#myTable").datagrid("load");
                }

            })
        }
    })



</script>

</body>
</html>
