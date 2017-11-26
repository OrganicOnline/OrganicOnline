<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Anasayfa.aspx.cs" Inherits="Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <%--        <meta name="description" content="Awesome Bubble Navigation with jQuery" />--%>
    <meta name="keywords" content="jquery, circular menu, navigation, round, bubble" />
    <link type="text/css" href="CSS/style.css" rel="stylesheet" media="screen" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="JavaScript/jquery.easing.1.3.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial;
            background: #fff url(images/bg.png) no-repeat top left;
        }

        .title {
            width: 548px;
            height: 119px;
            position: absolute;
            top: 400px;
            left: 150px;
        }

        a.back {
            position: fixed;
            width: 150px;
            height: 27px;
            outline: none;
            bottom: 0px;
            left: 0px;
        }

        #content {
            margin: 0 auto;
        }

        .konusanManav h2 {
            margin-left: 160px;
            margin-top: -80px;
            color:#495d2d;
        }

        .konusanManav {
            margin-left: 70%;
        }

        #konusanManav {
            width: 150px;
            height: 190px;
        }
    </style>
</head>
<body>
    <div id="content">
        <a class="back" href="http://tympanus.net/codrops/2010/04/29/awesome-bubble-navigation-with-jquery"></a>
        <div class="title"></div>
        <div class="konusanManav">
            <asp:Image ImageUrl="images/konusanManav.png" ID="konusanManav" runat="server" />
            <h2>GreenGrocer</h2>
            <h2>Online</h2>
        </div>
        <div class="navigation" id="nav">
            <div class="item user">
                <img src="images/bg_user.png" alt="" width="199" height="199" class="circle" />
                <a href="#" class="icon"></a>
                <h2>Hesap</h2>
                <ul>
                    <li><a href="#">Kayıt Ol</a></li>
                    <li><a href="#">Gİrİş Yap</a></li>
                </ul>
            </div>
            <div class="item home">
                <img src="images/bg_home.png" alt="" width="199" height="199" class="circle" />
                <a href="#" class="icon"></a>
                <h2>SİTEye GİRİŞ</h2>
                <ul>
                    <li><a href="#">Ürünler</a></li>
                    <li><a href="#">İletİşİm</a></li>
                    <li><a href="#">Hakkımızda</a></li>
                </ul>
            </div>
            <div class="item shop">
                <img src="images/bg_shop.png" alt="" width="199" height="199" class="circle" />
                <a href="#" class="icon"></a>
                <h2>Alışverİş</h2>
                <ul>
                    <li><a href="#">Katalog</a></li>
                    <li><a href="#">Sepetİm</a></li>
                    <li><a href="#">Ürün Talebİ</a></li>
                </ul>
            </div>
            <div class="item camera">
                <img src="images/bg_camera.png" alt="" width="199" height="199" class="circle" />
                <a href="#" class="icon"></a>
                <h2>Manavlar</h2>
                <ul>
                    <li><a href="#">Galerİ</a></li>
                    <li><a href="#">Detaylar</a></li>

                </ul>
            </div>
            <div class="item fav">
                <img src="images/bg_fav.png" alt="" width="199" height="199" class="circle" />
                <a href="#" class="icon"></a>
                <h2>Favoriler</h2>
                <ul>
                    <li><a href="#">En çok satanlar</a></li>
                    <li><a href="#">Yorumlar</a></li>
                    <li><a href="#">Yorum Yap</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- The JavaScript -->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="JavaScript/jquery.easing.1.3.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#nav > div').hover(
            function () {
                var $this = $(this);
                $this.find('img').stop().animate({
                    'width': '199px',
                    'height': '199px',
                    'top': '-25px',
                    'left': '-25px',
                    'opacity': '1.0'
                }, 500, 'easeOutBack', function () {
                    $(this).parent().find('ul').fadeIn(700);
                });

                $this.find('a:first,h2').addClass('active');
            },
            function () {
                var $this = $(this);
                $this.find('ul').fadeOut(500);
                $this.find('img').stop().animate({
                    'width': '52px',
                    'height': '52px',
                    'top': '0px',
                    'left': '0px',
                    'opacity': '0.1'
                }, 5000, 'easeOutBack');

                $this.find('a:first,h2').removeClass('active');
            }
        );
        });
    </script>
</body>
</html>
