<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <script src="JavaScript/jquery-1.11.3.js"></script>
        <script src="JavaScript/jquery.easing.1.3.js"></script>
        <style>
            @import url(http://fonts.googleapis.com/css?family=Montserrat);

            #header {
                height: 130px;
                background-color: white;
            }

                #header img {
                    padding: 12px 0px 12px 400px;
                }

                #header h1 {
                    padding: 40px 0px 12px 0px;
                    text-align: center;
                    color: #1d4626;
                }

            * {
                margin: 0;
                padding: 0;
            }

            #header a {
                color: #27AE60;
                text-decoration: none;
                font-size: 14px;
            }

            html {
                /*Image only BG fallback*/
                background-color: #8caab6;
            }

            body {
                font-family: montserrat, arial, verdana;
            }
            /*form styles*/
            #msform {
                width: 400px;
                margin: 50px auto;
                text-align: center;
                position: relative;
            }

                #msform fieldset {
                    background: white;
                    border: 0 none;
                    border-radius: 3px;
                    box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
                    padding: 20px 30px;
                    box-sizing: border-box;
                    width: 80%;
                    margin: 0 10%;
                    /*stacking fieldsets above each other*/
                    position: absolute;
                }
                    /*Hide all except first fieldset*/
                    #msform fieldset:not(:first-of-type) {
                        display: none;
                    }
                /*inputs*/
                #msform input, #msform textarea {
                    padding: 15px;
                    border: 1px solid #ccc;
                    border-radius: 3px;
                    margin-bottom: 10px;
                    width: 100%;
                    box-sizing: border-box;
                    font-family: montserrat;
                    color: #2C3E50;
                    font-size: 13px;
                }
                /*buttons*/
                #msform .action-button {
                    width: 100px;
                    background: #27AE60;
                    color: white;
                    border: 0 none;
                    border-radius: 1px;
                    cursor: pointer;
                    padding: 10px 5px;
                    margin: 10px 5px;
                }

                    #msform .action-button:hover, #msform .action-button:focus {
                        box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
                    }
            /*headings*/
            .fs-title {
                font-size: 15px;
                text-transform: uppercase;
                color: #2C3E50;
                margin-bottom: 10px;
            }

            .fs-subtitle {
                font-weight: normal;
                font-size: 13px;
                color: #666;
                margin-bottom: 20px;
            }
            /*progressbar*/
            #progressbar {
                margin-bottom: 30px;
                overflow: hidden;
                /*CSS counters to number the steps*/
                counter-reset: step;
            }

                #progressbar li {
                    list-style-type: none;
                    color: white;
                    text-transform: uppercase;
                    font-size: 12px;
                    width: 33.33%;
                    float: left;
                    position: relative;
                }

                    #progressbar li:before {
                        content: counter(step);
                        counter-increment: step;
                        width: 20px;
                        line-height: 20px;
                        display: block;
                        font-size: 10px;
                        color: #333;
                        background: white;
                        border-radius: 3px;
                        margin: 0 auto 5px auto;
                    }
                    /*progressbar connectors*/
                    #progressbar li:after {
                        content: '';
                        width: 100%;
                        height: 2px;
                        background: white;
                        position: absolute;
                        left: -50%;
                        top: 9px;
                        z-index: -1; /*put it behind the numbers*/
                    }

                    #progressbar li:first-child:after {
                        /*connector not needed before the first step*/
                        content: none;
                    }
                    /*marking active/completed steps green*/
                    /*The number of the step and the connector before it = green*/
                    #progressbar li.active:before, #progressbar li.active:after {
                        background: #27AE60;
                        color: white;
                    }
            /* dropdown list */
            .ddl {
                border: 2px solid rgba(180, 177, 177, 0.64);
                border-radius: 5px;
                padding: 3px;
                -webkit-appearance: none;
                background-position: 88px;
                background-repeat: no-repeat;
                cursor: pointer;
            }

            /* dropdown list son */

            /* Radio Buton */
            label {
                /*width: 200px;
  border-radius: 3px;
  border: 1px solid #D1D3D4*/
            }


            /* style label */
            input.radio:empty ~ label {
                position: relative;
                float: left;
                line-height: 2.5em;
                text-indent: 3.25em;
                margin-top: -2em;
                cursor: pointer;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

                input.radio:empty ~ label:before {
                    position: absolute;
                    display: block;
                    top: 0;
                    bottom: 0;
                    left: 0;
                    content: '';
                    width: 2.5em;
                    background: #D1D3D4;
                    border-radius: 3px 3px 3px 3px;
                }

            /* toggle hover */
            input.radio:hover:not(:checked) ~ label:before {
                content: '\2714';
                text-indent: .1em;
                color: #C2C2C2;
            }

            input.radio:hover:not(:checked) ~ label {
                color: #888;
            }

            /* toggle on */
            input.radio:checked ~ label:before {
                content: '\2714';
                text-indent: .1em;
                color: #9CE2AE;
                background-color: #4DCB6D;
            }

            input.radio:checked ~ label {
                color: #777;
            }

            /* radio focus */
            input.radio:focus ~ label:before {
                box-shadow: 0 0 0 3px #999;
            }
            /* Radio Buton Son */


            /* Login ksımı için */

            .box img {
                width: 25px;
                height: 25px;
                float: left;
                border: 2px solid ButtonFace;
                border-radius: 5px;
                padding: 2px;
                background-color: ButtonFace;
            }

            .box {
                background: #ccc;
                padding: 15px 15px;
                border-radius: 3px;
                display: inline-block;
                margin-left: 70%;
                margin-top: -30px;
                position: absolute;
                z-index: 1;
                width: 198px;
                height: 100px;
            }

                .box:before {
                    content: '';
                    width: 0;
                    height: 0;
                    position: absolute;
                    border: 8px solid transparent;
                }

                .box.yukari:before {
                    border-bottom-color: #ccc;
                    top: -16px;
                    left: 8px;
                }

            .block {
                margin-top: 25px;
            }

            #close img {
                width: 15px;
                height: 15px;
                float: right;
                margin-top: -30px;
                background-color: #ccc;
            }

                #close img:hover {
                    opacity: .5;
                }

            #close p {
                float: left;
                padding-left: 40px;
                margin-top: -30px;
                font-weight: bold;
            }

            /*#gonder img {
            float: right;
            width: 25px;
            height: 25px;
            z-index: 1;
            margin-top: -42px;
            margin-left: 100px;
            background-color: azure;
        }

            #gonder img:hover {
                background-color: green;
            }*/

            .lbLogin {
                background-image: url("/images/Arrow-32.png");
                background-color: rgba(140, 170, 182, 0.36);
                background-repeat: no-repeat;
                padding-left: 6px;
                padding-right: 4px;
                display: inline-block;
                min-height: 16px;
                background-position: 1px;
                float: right;
                width: 25px;
                height: 25px;
                z-index: 1;
                margin-top: -41px;
                margin-left: 75px;
                border: 3px solid rgba(140, 170, 182, 0.16);
            }

                .lbLogin:hover {
                    background-color: #27AE60;
                }
            /* Login sonu */
            input.file {
                position: relative;
                text-align: left;
                -moz-opacity: 0;
                filter: alpha(opacity: 0);
                opacity: 0;
                z-index: 1;
            }

            .file:hover {
                cursor: pointer;
            }

            .fakeFileUpload {
                /*padding-bottom:-100px;*/
                z-index: 2;
                height: 50px;
                width: 50px;
            }

                .fakeFileUpload img {
                    position: relative;
                    height: 50px;
                    width: 50px;
                    margin-top: -100000000px;
                }

                    .fakeFileUpload img:hover {
                        cursor: pointer;
                    }

            .txtFileBilgi {
                text-align: left;
                font-size: 12px;
                margin-top: -65px;
                margin-left: 70px;
                width: 200px;
            }

            .lblStoreName {
                text-align: left;
                margin-left: -110px;
                padding: 10px;
                margin-bottom: 100px;
                font-size: 13px;
                color: #2C3E50;
            }
        </style>

</head>
<body>

        <div id="header">
    <div style="float:left; height:130px; width:33%"><img src="http://comps.canstockphoto.com/can-stock-photo_csp11582898.jpg", width="100px", height="100px" /></div>
    <div style="float:left; height:130px; width:35%"><h1>Organic Online</h1></div>
    <div style="float:right; height:130px; width:32%">
        <ul style="padding:100px 0px 12px 0px">
          <a  id="open" style="font-family: montserrat, arial, verdana" href="Kayit.aspx"><li style="display:inline">Kayıt Ol</li></a> |
          <a style="font-family: montserrat, arial, verdana" href="#"><li style="display:inline">Şifremi unuttum</li></a>
        </ul>
    </div>
</div>

    <asp:Panel Visible="false" ID="panelDanger" runat="server">
        <div style="text-align:center; padding-top:10px; color:darkred" class="panel panel-danger">
      <div class="panel-heading">UYARI</div>
      <div class="panel-body">Kullanıcı adı veya şifre yanlış.</div>
    </div>
    </asp:Panel>
        
    <!-- multistep form -->
    <form id="msform" name="cb" runat="server">

        <fieldset>
            <h2 class="fs-title">Giriş</h2>
            <h3 class="fs-subtitle">Giriş yapmak için kullanıcı adı ve şifrenizi giriniz.</h3>
            <asp:TextBox ID="txtKullaniciAdi" TextMode="SingleLine" placeholder="Kullanıcı Adı" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtPswd" TextMode="Password" placeholder="Şifre" runat="server"></asp:TextBox>
            <asp:Button Text="Giriş" class="next action-button" id="btnLogin" OnClick="btnLogin_Click" runat="server" />
        </fieldset>
    </form>
</body>
</html>
