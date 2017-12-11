<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Genel.master" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <meta charset="utf-8" />
    <title>JANGO | Ultimate Multipurpose Bootstrap HTML Theme - FAQ</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300italic,400italic,700italic,400,300,700&amp;subset=all' rel='stylesheet' type='text/css'>
    <link href="assets/plugins/socicon/socicon.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/bootstrap-social/bootstrap-social.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/animate/animate.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN: BASE PLUGINS  -->
    <link href="assets/plugins/cubeportfolio/css/cubeportfolio.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/owl-carousel/owl.carousel.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/owl-carousel/owl.theme.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/owl-carousel/owl.transitions.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/slider-for-bootstrap/css/slider.css" rel="stylesheet" type="text/css" />
    <!-- END: BASE PLUGINS -->
    <!-- BEGIN THEME STYLES -->
    <link href="assets/base/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="assets/base/css/components.css" id="style_components" rel="stylesheet" type="text/css" />
    <link href="assets/base/css/themes/default.css" rel="stylesheet" id="style_theme" type="text/css" />
    <link href="assets/base/css/custom.css" rel="stylesheet" type="text/css" />
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />





</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="c-layout-page">
        <!-- Page Header-->
        <div class="c-layout-breadcrumbs-1 c-bgimage c-subtitle c-fonts-uppercase c-fonts-bold c-bg-img-center" >
            <div class="c-content-box c-size-md ">
                <div class="container">
                    <div class="c-content-contact-1 c-opt-1">
                        <div class="row" data-auto-height=".c-height">
                            <div class="col-sm-8 c-desktop"></div>
                            <div class="col-sm-4">
                                <div class="c-body">
                                    <div class="c-section">
                                        <h3 class="c-font-lowercase">Organic Online</h3>
                                    </div>
                                    <div class="c-section">
                                        <div class="c-content-label c-font-uppercase c-font-bold c-theme-bg">Adres</div>
                                        <p style="font-size: 14px">
                                            Elektrik-Elektronik Mühendisliği Fakültesi,
                                           
                                            <br />
                                            Ayazağa Kampüsü, İstanbul Teknik Üniversitesi
                                           
                                            <br />
                                            İstanbul, Türkiye
                                        </p>
                                    </div>
                                    <div class="c-section">
                                        <div class="c-content-label c-font-uppercase c-font-bold c-theme-bg">İletİşİm</div>
                                        <p>
                                            <strong>Telefon</strong> +90-212-285-0000
                                           
                                            <br />
                                            <strong>Faks</strong> +90-212-285-0001
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="gmapbg" class="c-content-contact-1-gmap" style="height: 115%;"></div>
            </div>
        </div>
    </div>
    <script src="assets/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-migrate.min.js" type="text/javascript"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery.easing.min.js" type="text/javascript"></script>
    <script src="assets/plugins/reveal-animate/wow.js" type="text/javascript"></script>
    <script src="assets/base/js/scripts/reveal-animate/reveal-animate.js" type="text/javascript"></script>
    <!-- END: CORE PLUGINS -->
    <!-- BEGIN: LAYOUT PLUGINS -->
    <script src="assets/plugins/cubeportfolio/js/jquery.cubeportfolio.min.js" type="text/javascript"></script>
    <script src="assets/plugins/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
    <script src="assets/plugins/counterup/jquery.counterup.min.js" type="text/javascript"></script>
    <script src="assets/plugins/counterup/jquery.waypoints.min.js" type="text/javascript"></script>
    <script src="assets/plugins/fancybox/jquery.fancybox.pack.js" type="text/javascript"></script>
    <script src="assets/plugins/slider-for-bootstrap/js/bootstrap-slider.js" type="text/javascript"></script>
    <!-- END: LAYOUT PLUGINS -->
    <!-- BEGIN: THEME SCRIPTS -->
    <script src="assets/base/js/components.js" type="text/javascript"></script>
    <script src="assets/base/js/components-shop.js" type="text/javascript"></script>
    <script src="assets/base/js/app.js" type="text/javascript"></script>
<%--    <script>
        $(document).ready(function () {
            App.init(); // init core    
        });
    </script>--%>
    <!-- END: THEME SCRIPTS -->
    <!-- BEGIN: PAGE SCRIPTS -->
    <%--<script src="assets/base/js/scripts/pages/faq.js" type="text/javascript"></script>--%>




    <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyAeVM13kA_RNXVBVKCW-RMa1C3dZBn4ZCc"></script>
    <%--<script src="https://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>--%>
    <script src="assets/plugins/gmaps/gmaps.js" type="text/javascript"></script>

    <%--<script src="assets/base/js/scripts/pages/contact.js" type="text/javascript"></script>--%>
    <script>
        var myLatlng = new google.maps.LatLng(41.104600, 29.024276);
        var mapOptions = {
            zoom: 18,
            center: myLatlng
        }
        var map = new google.maps.Map(document.getElementById("gmapbg"), mapOptions);

        var marker = new google.maps.Marker({
            position: myLatlng,
            title: "Hello World!"
        });

        // To add the marker to the map, call setMap();
        marker.setMap(map);
    </script>
    <!-- END: PAGE SCRIPTS -->
    <!-- END: LAYOUT/BASE/BOTTOM -->
</asp:Content>
