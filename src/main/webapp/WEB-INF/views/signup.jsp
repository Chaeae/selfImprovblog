<%--
  Created by IntelliJ IDEA.
  User: KTDS
  Date: 2024-02-07
  Time: 오전 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<link href="/resources/css/login.css" rel="stylesheet" type="text/css">

<div id="container" class="container">
    <!-- FORM SECTION -->
    <div class="row">
        <!-- SIGN UP -->
        <div class="col align-items-center flex-col sign-up">
            <form action="/user/signup" method="post" >
                <div class="form-wrapper align-items-center">
                    <div class="form sign-up">
                        <div class="input-group">
                            <i class='bx bxs-user_ID'></i>
                            <input type="text" name="user_ID" placeholder="Id">
                        </div>
                        <div class="input-group">
                            <i class='bx bxs-lock-alt'></i>
                            <input type="password" name="user_pw" placeholder="Password">
                        </div>
                        <div class="input-group">
                            <i class='bx bxs-user'></i>
                            <input type="text" name="user_name" placeholder="Username">
                        </div>
                        <div class="input-group">
                            <i class='bx bxs-user_Age'></i>
                            <input type="text" name="user_age" placeholder="Age">
                        </div>
                        <div class="input-group">
                            <i class='bx bxs-user_Job'></i>
                            <input type="text" name="user_job" placeholder="Job">
                        </div>
                        <div class="input-group">
                            <i class='bx bx-mail-send'></i>
                            <input type="email" name="user_email" placeholder="Email">
                        </div>
                        <button type="submit">
                            Sign up
                        </button>
                        <p>
                  <span>
                    Already have an account?
                  </span>
                            <b onclick="toggle()" class="pointer">
                                Sign in here
                            </b>
                        </p>
                    </div>
                </div>
            </form>
        </div>
        <!-- END SIGN UP -->
        <!-- SIGN IN -->
        <div class="col align-items-center flex-col sign-in">
            <form action="/user/login" id="log" method="post" >
                <div class="form-wrapper align-items-center">
                    <div class="form sign-in">
                        <div class="input-group">
                            <i class='bx bxs-user'></i>
                            <input type="text" name="user_ID" id="user_ID" placeholder="Id">
                        </div>
                        <div class="input-group">
                            <i class='bx bxs-lock-alt'></i>
                            <%--                        <input type="text" name="user_pw" placeholder="Password">--%>
                            <input type="password" name="user_pw" id ="user_pw" placeholder="Password">
                        </div>
                        <button type="submit">
                            Log in
                        </button>
                        <p>
                            <b>
                                Forgot password?
                            </b>
                        </p>
                        <p>
                  <span>
                    Don't have an account?
                  </span>
                            <b onclick="toggle()" class="pointer">
                                Sign up here
                            </b>
                        </p>
                    </div>
                </div>
                <div class="form-wrapper">

                </div>
            </form>
        </div>
        <!-- END SIGN IN -->
    </div>
    <!-- END FORM SECTION -->
    <!-- CONTENT SECTION -->
    <div class="row content-row">
        <!-- SIGN IN CONTENT -->
        <div class="col align-items-center flex-col">
            <div class="text sign-in">
                <h2>
                    Welcome
                </h2>

            </div>
            <div class="img sign-in">

            </div>
        </div>
        <!-- END SIGN IN CONTENT -->
        <!-- SIGN UP CONTENT -->
        <div class="col align-items-center flex-col">
            <div class="img sign-up">

            </div>
            <div class="text sign-up">
                <h2>
                    Join with us
                </h2>

            </div>
        </div>
        <!-- END SIGN IN CONTENT -->
    </div>
    <!-- END CONTENT SECTION -->
</div>
</html>
<script src="/resources/js/signup.js"></script>

<script>
    let sf = document.getElementById("log");
    sf.addEventListener("submit",function(e){
        let eleId = document.getElementById("user_ID");
        let elePw = document.getElementById("user_pw");

        if(eleId.value.length == 0){
            alert("아이디를 입력하세요");
            e.preventDefault();
        }
        else if(elePw.value.length == 0){
            alert("비밀번호를 입력하세요");
            e.preventDefault();
        }
    });

</script>