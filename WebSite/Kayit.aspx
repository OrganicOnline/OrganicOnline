<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Kayit.aspx.cs" Inherits="Kayit" ViewStateMode="Enabled" %>

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

        #close img:hover{
            opacity:.5;
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
            background-color:rgba(140, 170, 182, 0.36);   
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
            border:3px solid rgba(140, 170, 182, 0.16);
        }
        .lbLogin:hover{
            background-color:#27AE60;
        }
        /* Login sonu */
        input.file{
	position: relative;
	text-align: left;
	-moz-opacity:0 ;
	filter:alpha(opacity: 0);
	opacity: 0;
    z-index:1;

 
        }
        .file:hover{
            cursor:pointer;
        }
        .fakeFileUpload{
/*padding-bottom:-100px;*/
	z-index: 2;
    height:50px;
        width:50px;

        }
        
        .fakeFileUpload img{
            position:relative;
        height:50px;
    width:50px;
margin-top:-100000000px;


}
            .fakeFileUpload img:hover {
                cursor:pointer;
            }
            .txtFileBilgi{
                text-align:left;
                font-size:12px;
margin-top:-65px;
margin-left:70px;
width:200px;
            }
            .lblStoreName{
                text-align:left;
                margin-left:-110px;
                padding:10px;
                margin-bottom:100px;
                font-size:13px;
                color:#2C3E50;
            }

    </style>
</head>
<body>

        <div id="header">
    <div style="float:left; height:130px; width:33%"><img src="http://comps.canstockphoto.com/can-stock-photo_csp11582898.jpg", width="100px", height="100px" /></div>
    <div style="float:left; height:130px; width:35%"><h1>Online GreenGrocer</h1></div>
    <div style="float:right; height:130px; width:32%">
        <ul style="padding:100px 0px 12px 0px">
          <a id="open" style="font-family: montserrat, arial, verdana" href="#"><li style="display:inline">Zaten bir hesabım var</li></a> |
          <a style="font-family: montserrat, arial, verdana" href="#"><li style="display:inline">Şifremi unuttum</li></a>
        </ul>
    </div>
</div>

    <!-- multistep form -->
    <form id="msform" name="cb" runat="server">
        <div id="loginWin" style="display:none">
        <div class="box yukari">
            <div class="block">
                <div id="close">
                    <p>Giriş</p>
                    <a id="close2" href="#">
                        <img src="http://icons.iconarchive.com/icons/rafiqul-hassan/blogger/512/Close-icon.png" /></a>
                </div>
                <img src="images/kullanıcı.png" />
                <asp:TextBox ID="txtLoginUsername" Style="width: 165px; height: 25px; float: right" TextMode="SingleLine" placeholder="Kullanıcı Adı" runat="server"></asp:TextBox>
                <img src="images/sifre.png" style="margin-top: 8px;" />
                <asp:TextBox ID="txtLoginPasswd" Style="width: 165px; height: 25px; float: right" TextMode="Password" placeholder="Şifre" runat="server"></asp:TextBox>
<%--                <div id="gonder">--%>
                    <asp:LinkButton ID="lbLogin" CssClass="lbLogin" runat="server" OnClick="lbLogin_Click"></asp:LinkButton>
<%--                </div>--%>
            </div>
        </div>
            </div>

        <!-- progressbar -->
        <ul id="progressbar">
            <li class="active">Hesap Kurulumu</li>
            <li>Kİşİsel Detaylar</li>
            <li>Hesap Detayları</li>
        </ul>
        <!-- fieldsets -->
        <fieldset>
            <h2 class="fs-title">Önce hesabını oluştur</h2>
            <h3 class="fs-subtitle">Hesabınıza bu bilgilerle girebilirsiniz.</h3>
            <asp:TextBox ID="txtKullaniciAdi" TextMode="SingleLine" placeholder="Kullanıcı Adı" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtPswd" TextMode="Password" placeholder="Şifre" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtPswdAgain" TextMode="Password" placeholder="Şifre Tekrar" runat="server"></asp:TextBox>
            <%--      <asp:Button Text="İleri" name="next" ID="btnNext" class="next action-button" runat="server" />--%>
            <input type="button" name="next" class="next action-button" value="İleri" />
        </fieldset>
        <fieldset>
            <h2 class="fs-title">bİraz daha detay bİlgİye İhtİyacımız var</h2>
            <h3 class="fs-subtitle">Kişisel bilgileriniz siz istemediğiniz sürece reklam amaçlı kullanılmaz.</h3>
            <asp:TextBox ID="txtAd" TextMode="SingleLine" placeholder="İsim" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtSoyad" TextMode="SingleLine" placeholder="Soyisim" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtMail" TextMode="SingleLine" placeholder="Email" runat="server"></asp:TextBox>
            <input type="button" name="previous" class="previous action-button" value="Geri" />
            <input type="button" name="next" class="next action-button" value="İleri" />
        </fieldset>
        <fieldset>

            <h2 class="fs-title">Hesabınızla İlgİlİ detaylar</h2>
            <h3 class="fs-subtitle">Hesabınızı hangi amaçla kullanmak istiyorsunuz?</h3>
            <div style="float: left; width: 80%; height: 30%; padding: inherit">
                <p style="margin-left: -10%; font-size: 12px; width: 80%; height: 30%; text-align: left">Manav dükkanım var ve siteyi ürünlerimi tanıtmak için kullanacağım. </p>
                <div style="float: right; margin-top: -15%; width: 20%">
                    <input type="radio" name="radio" id="rbManav" class="radio" runat="server" onclick="GetCheckedState();" />
                    <label for="rbManav">&nbsp; </label>
                </div>
            </div>
            <div id="txtUrunKayit" style="display: none">
                <asp:DropDownList ID="ddlIlce" runat="server" Width="120px" Style="float: left; font-family: montserrat" BackColor="white" ForeColor="ControlDark" CssClass="ddl" AppendDataBoundItems="true">
                    <asp:ListItem Enabled="true">İlçe Seçiniz</asp:ListItem>
                </asp:DropDownList>
                <h1>&nbsp;</h1>
                <asp:TextBox ID="txtAdres" TextMode="MultiLine" placeholder="Adres" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtTelefon" TextMode="Phone" placeholder="İş Telefonu" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtDukkanAd" TextMode="SingleLine" placeholder="Dükkanın Adı" runat="server"></asp:TextBox>
                <asp:Label CssClass="lblStoreName" Text="Dükkanın Fotoğrafı:" runat="server" />
                <div class="fakeFileUpload">
                <asp:FileUpload ID="fuFoto" runat="server" CssClass="file"/>
                    <img src="images/upload.png"/>
                    <div class="txtFileBilgi"><asp:Label ID="lblFileBilgi" Text="Dosya seçilmedi" runat="server" /></div>
                    </div>
                <br />
                    
            </div>
            <hr />
            <div style="float: left; width: 80%; height: 30%; padding: inherit">
                <p style="margin-left: -10%; font-size: 12px; width: 80%; height: 30%; text-align: left">Siteyi sadece ürün satın almak için kullanacağım. </p>
                <div style="float: right; margin-top: -13%; width: 20%">
                    <input type="radio" name="radio" id="rbMusteri" class="radio" runat="server" onclick="GetCheckedState();" />
                    <label for="rbMusteri">&nbsp; </label>
                </div>
            </div>
            <div id="txtSon" style="display: none">
                <p style="font-size: 13px; color: #640505; font-weight: bold">Kaydınızı başarıyla tamamladınız, formu gönderebilirsiniz. </p>
                <br />
            </div>
            <input type="button" name="previous" class="previous action-button" value="Geri" />
            <asp:Button Text="Gönder" CssClass="action-button" ID="btnGonder" OnClick="btnGonder_Click" runat="server" />
        </fieldset>
    </form>

    <script type="text/javascript">
        var current_fs, next_fs, previous_fs; //fieldsets
        var left, opacity, scale; //fieldset properties which we will animate
        var animating; //flag to prevent quick multi-click glitches

        $(".next").click(function () {
            if (animating) return false;
            animating = true;

            current_fs = $(this).parent();
            next_fs = $(this).parent().next();

            //activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            //show the next fieldset
            next_fs.show();
            //hide the current fieldset with style
            current_fs.animate({ opacity: 0 }, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale current_fs down to 80%
                    scale = 1 - (1 - now) * 0.2;
                    //2. bring next_fs from the right(50%)
                    left = (now * 50) + "%";
                    //3. increase opacity of next_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({ 'transform': 'scale(' + scale + ')' });
                    next_fs.css({ 'left': left, 'opacity': opacity });
                },
                duration: 800,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'easeInOutBack'
            });
        });

        $(".previous").click(function () {
            if (animating) return false;
            animating = true;

            current_fs = $(this).parent();
            previous_fs = $(this).parent().prev();

            //de-activate current step on progressbar
            $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

            //show the previous fieldset
            previous_fs.show();
            //hide the current fieldset with style
            current_fs.animate({ opacity: 0 }, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale previous_fs from 80% to 100%
                    scale = 0.8 + (1 - now) * 0.2;
                    //2. take current_fs to the right(50%) - from 0%
                    left = ((1 - now) * 50) + "%";
                    //3. increase opacity of previous_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({ 'left': left });
                    previous_fs.css({ 'transform': 'scale(' + scale + ')', 'opacity': opacity });
                },
                duration: 800,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'easeInOutBack'
            });
        });

        $(".submit").click(function () {
            return false;
        });
    </script>
    <%--    <script>
        var rbMusteri = $("#rbMusteri");
        var rbManav = $("#rbManav");
        var musteri = 0;
        var manav = 0;
        rbMusteri.click(function () {
            $("#txtSon").toggle("fast");
            musteri = 1;
            if (manav === 1) {
                $("#txtUrunKayit").toggle("fast");
                manav = 0;
            }
        });
        rbManav.click(function () {
            $("#txtUrunKayit").toggle("fast");
            manav = 1;
            if (musteri === 1) {
                $("#txtSon").toggle("fast");
                musteri = 0;
            }
        });
    </script>--%>

    <script>
        $("#close2").click(function () {
            $("#loginWin").css("display", "block").fadeOut(800)
        });

        $("#open").click(function () {
            $("#loginWin").fadeIn(800);
        });
    </script>

    <script type="text/javascript">
        function GetCheckedState() {
            var input = document.getElementById("rbMusteri");
            var isChecked = input.checked;
            if (isChecked == 1) {
                document.getElementById('txtUrunKayit').style.display = 'none';
                document.getElementById('txtSon').style.display = 'block';
            }
            else {
                document.getElementById('txtSon').style.display = 'none';
            }
        }
    </script>

    <script type="text/javascript">
        function GetCheckedState() {
            var input = document.getElementById("rbManav");
            var isChecked = input.checked;
            if (isChecked == 1) {

                document.getElementById('txtSon').style.display = 'none';
                document.getElementById('txtUrunKayit').style.display = 'block';
            }
            else {
                //alert("non check manav");
                document.getElementById('txtUrunKayit').style.display = 'none';
                document.getElementById('txtSon').style.display = 'block';
            }
        }

    </script>
    <script type="text/javascript">
        //function fileName() {
            //var src = $('img').attr('src');
            //var split = src.split('/');
            //var file = split[split.length - 1];
            //alert(file);
            //document.getElementById('lblFileBilgilendirme').innerText = file;
                $('input[type=file]').change(function () {
                    var filePath = $('#fuFoto').val();
                    var split = filePath.split("\\");
                    var file = split[split.length - 1];
                    document.getElementById("lblFileBilgi").innerHTML = file;
                    if (file.length <= 1) {
                    document.getElementById("lblFileBilgi").innerHTML = "Dosya seçilmedi";
                    }
                });
     //   }

    </script>
</body>
</html>
