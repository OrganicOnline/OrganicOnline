﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.master" AutoEventWireup="true" CodeFile="Urunlerr.aspx.cs" Inherits="Urunlerr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title></title>
    <link href="CSS/shop-homepage.css" rel="stylesheet" />
    <!-- Bootstrap Core CSS -->
    <%--<link href="CSS/bootstrap.min.css" rel="stylesheet" />--%>

    <link href="CSS/bootstrap-multiselect.css" rel="stylesheet" />
    <script src="JavaScript/bootstrap-multiselect.js"></script>
    <style>
        /* SATIN ALMA */

        #form1 fieldset {
            font-family: montserrat, arial, verdana;
            background: white;
            border: 0 none;
            border-radius: 3px;
            padding: 20px 30px;
            box-sizing: border-box;
            width: 60%;
            min-width: 550px;
        }

            #form1 fieldset input {
                padding: 15px;
                border: 1px solid #ccc;
                border-radius: 3px;
                margin: 0px 10px;
                width: 100%;
                box-sizing: border-box;
                font-family: montserrat;
                color: #2C3E50;
                font-size: 13px;
            }

        .dlTablo {
            text-align: center;
            margin-left: 10%;
        }

        .product {
            margin: 10px;
            width: 175px;
            height: 260px;
            border: 1px solid #abcdef;
            border-radius: 5px;
        }

        .productImg {
            width: 165px;
            height: 165px;
            margin-left: 3px;
        }

            .productImg a {
                position: absolute;
            }

        .productInfo {
            width: 165px;
            height: 25px;
            font-weight: bold;
            text-align: center;
        }

        #topFiyatTikla {
            float: left;
        }

            #topFiyatTikla:hover, :visited, :active, :link {
                cursor: pointer;
                text-decoration: none;
            }



        #kutular {
            position: absolute;
        }

        #sepet img {
            height: 40px;
            width: 40px;
            padding: 6px;
            /*background-color:#f8c54d;*/
            /*background-color: #f6cfcf;*/
            color: #ab8426;
            border-radius: 10px;
            position: absolute;
            z-index: 5;
        }

        #login img {
            height: 50px;
            width: 50px;
            padding: 10px;
            /*background-color:#755998;*/
            background-color: #e8d7f5;
            color: #ab8426;
            border-radius: 10px;
            position: absolute;
        }

        #sepet {
            display: block;
            margin-left: 65%;
            z-index: 5;
            margin-top: -65px;
            position: fixed;
        }

        #login {
            margin-left: 870px;
            position: absolute;
        }

        .sayi {
            /*margin:2.1% 29.6%;*/
            display: block;
            margin: -50px 65.7%;
            position: fixed;
            z-index: 6;
            font-weight: bold;
        }

        .box img {
            width: 25px;
            height: 25px;
            float: left;
            border: 2px solid ButtonFace;
            border-radius: 5px;
            padding: 2px;
            background-color: ButtonFace;
            background-color: red;
        }

        .box {
            background: #ccc;
            padding: 15px 15px;
            border-radius: 3px;
            display: inline-block;
            margin-left: 61%;
            margin-top: -10px;
            position: absolute;
            z-index: 5;
            width: 170px;
            height: 90px;
            opacity: .5;
            position: fixed;
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
                left: 80px;
            }

        .block {
            margin-top: 25px;
        }

        .close1 {
            margin-top: -40px;
        }

            .close1 img {
                width: 20px;
                height: 20px;
                float: right;
                background-color: #ccc;
            }

                .close1 img:hover {
                    opacity: .5;
                }

        #login p {
            float: left;
            padding-left: 40px;
            margin: 100px 300px;
            font-weight: bold;
        }

        .buton {
            margin-top: -25px;
            margin-left: 28px;
            position: absolute;
        }

        .butonn {
            position: absolute;
            margin-left: 20px;
            margin-top: 5px;
        }

        .adet {
            margin-top: -25px;
            position: absolute;
            float: left;
            font-weight: bold;
        }

        .topFiyat {
            margin-top: -25px;
            float: right;
            font-weight: bold;
        }

        .sayi:hover {
            cursor: pointer;
        }
    </style>

    <!-- Custom CSS -->


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">




    <%--    buradan aldım--%>



    <div id="kutular">
        <asp:Label ID="lblSayi" CssClass="sayi" Text="0" runat="server" />
        <div id="sepet">
            <a href="#">
                <img src="images/sepet.png" /></a>
        </div>
        <div class="box yukari">
            <div class="block">
                <div>
                    <asp:Label ID="lblUrunSayisi" CssClass="adet" runat="server" />
                    <%--                    <label id="adet">5 Ürün</label>--%>
                    <%--                    <label id="topFiyat">15.35 TL</label>--%>
                    <asp:Label ID="lblTopFiyat" CssClass="topFiyat" runat="server" />
                    <asp:Button ID="btnSiparis" Text="Sipariş Ver" class="btn btn-default butonn" runat="server" OnClick="btnSiparis_Click" />
                    <asp:Button ID="btnCikis" Text="Çıkış Yap" class="btn btn-default buton" runat="server" />
                </div>
            </div>
        </div>

    </div>




    <!-- Page Content -->
    <div class="container">

        <asp:Label ID="lblDeneme" runat="server" />
        <div class="row">


            <div class="col-md-9">

                <div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="images/resim1.png" alt="" />
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="images/resim2.png" alt="" />
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="images/resim3.png" alt="" />
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div>
                <div id="uyari">
                </div>
                <div class="container col-md-12">
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" href="#collapse1"><i class="glyphicon glyphicon-search"></i>&nbsp; Hızlı Arama</a>
                                </h4>
                            </div>
                            <div id="collapse1" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="col-md-6">
                                        <asp:TextBox runat="server" ID="txtSearchProduct" CssClass="form-control" placeholder="Ürun Adı" />
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox runat="server" ID="txtSearchSupplier" CssClass="form-control" placeholder="Manav Adı" />
                                    </div>
                                    <div style="padding-top: 10px" class="col-md-12">
                                        <span><b>Manav'ın Konumu:</b></span>
                                        <asp:ListBox ID="lstDistrict" runat="server" Width="100%" Height="100px" SelectionMode="Multiple" DataTextField="DistrictName" DataValueField="ObjectID"></asp:ListBox>
                                    </div>
                                    <div class="col-md-12" style="padding-top: 10px">
                                        <asp:Button Text="Ara" CssClass="btn btn-primary" ID="btnSearch" OnClick="btnSearch_Click" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-4">
                            <b>Filtrele:</b>
                        </div>
                        <div class="col-md-offset-4 col-md-4">
                            <b>Sırala:</b>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-4">
                            <asp:DropDownList CssClass="form-control" ID="ddlFiltering" AppendDataBoundItems="true" AutoPostBack="true" DataTextField="CategoryName" DataValueField="ObjectID" OnSelectedIndexChanged="ddlFiltering_SelectedIndexChanged" runat="server">
                                <asp:ListItem Text="Seçiniz" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-offset-4 col-md-4">
                            <asp:DropDownList CssClass="form-control" ID="ddlSorting" OnSelectedIndexChanged="ddlSorting_SelectedIndexChanged" AutoPostBack="true" runat="server">
                                <asp:ListItem Text="Seçiniz" />
                                <asp:ListItem Text="Fiyat Artan" Value="artan" />
                                <asp:ListItem Text="Fiyat Azalan" Value="azalan" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <asp:Panel ID="pnlInfo" Visible="false" runat="server">
                            <div class="panel panel-default">
                                <div class="panel-body" style="color: dodgerblue">
                                    Yorumunuz başarıyla eklenmiştir.
                                </div>
                            </div>
                        </asp:Panel>
                    </div>


                </div>

                <div class="col-md-12">
                    <asp:Panel ID="pnlBilgi" Visible="false" runat="server">
                        <div class="panel panel-default">
                            <div class="panel-body" style="color: dodgerblue">
                                Seçtiğiniz kriterlere uygun ürün bulunamadı.
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <asp:Panel ID="pnlUrunler" runat="server">
                    <div class="row">
                        <div class="dlTablo">
                            <asp:DataList ID="dlUrunler" runat="server" OnItemCommand="dlUrunler_ItemCommand" OnItemDataBound="dlUrunler_ItemDataBound" RepeatColumns="3">
                                <ItemTemplate>
                                    <div class="product">

                                        <div class="productImg">
                                            <a href="#" data-toggle="tooltip" data-placement="right" title='<%#Eval("Supplier.CompanyName") %>'><span class="glyphicon glyphicon-info-sign" aria-hidden="true" style="margin-left: 150px; z-index: 3;"></span></a>

                                            <asp:Image ImageUrl='<%#Eval("PhotoPath", "~/{0}")%>' Width="160" Height="160" runat="server" />
                                        </div>
                                        <div class="productInfo">

                                            <asp:Label Text='<%#Eval("ProductName") %>' runat="server" />
                                        </div>
                                        <div class="productInfo">
                                            <asp:Label Text='<%#Eval("Price", "{0} kg/TL") %>' runat="server" />
                                        </div>
                                        <div class="operationBtn">
                                            <button type="button" class="btn btn-danger btn-xs btnSatinAl" data-ad='<%#Eval("ProductName") %>' data-fiyat='<%#Eval("Price", "{0} kg/TL") %>' data-url='<%#Eval("PhotoPath") %>' data-manav='<%#Eval("Supplier.CompanyName") %>' data-id='<%#Eval("ObjectID") %>' data-toggle="modal" data-target="#myModal">Satın Al</button>
                                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target='#commentModal<%#Eval("ObjectID")%>'>Yorumlar </a>
                                        </div>
                                    </div>



                                    <div class="modal fade" id='commentModal<%#Eval("ObjectID") %>' tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <asp:HiddenField ID="hfCommentedProductId" Value='<%#Eval("ObjectID") %>' runat="server" />
                                                </div>
                                                <div class="modal-body">
                                                    <fieldset>


                                                        <asp:Repeater ID="rptCommentList" runat="server">
                                                            <ItemTemplate>
                                                                <div class="panel panel-default" style="margin-left: 10px">
                                                                    <div class="panel-body">
                                                                        <div class="col-md-3" style="padding-left: 0px; border-right: groove;">
                                                                            <div class="pull-left">
                                                                                <span><%#Eval("User.Ad") %>&nbsp; <%#Eval("User.Soyad") %></span>
                                                                                <span class="label label-default "><%#Eval("CommentDate","{0:dd/MM/yy - hh:mm}") %></span>
                                                                                <asp:Label CssClass="star-calc " Style="display: none" Text='<%#Eval("Star") %>' runat="server" />
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-md-7">
                                                                            <div class="pull-left">
                                                                                <a class="product-title" style="margin-left: -50px"><%#Eval("CommentHeader") %> </a>
                                                                                <p><%#Eval("CommnetBody") %></p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-12 " style="padding: 0px">
                                                                            <%--                                                                        <%if (Eval("Star") == "5")
                                                                            { %>
                                                                        asd
                                                                        <%} %>--%>
                                                                            <%--                                                                     <%for (int i = 0; i < Convert.ToInt32(Eval("Star")); i++)
                                                                            { %>
                                                                        <i class="glyphicon glyphicon-star" style="color: yellow"></i>
                                                                        <%} %>--%>
                                                                        </div>
                                                                    </div>
                                                                    <div class="clearfix"></div>
                                                                </div>




                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <asp:TextBox ID="txtCommentHeader" CssClass="form-control" placeholder="Başlık" runat="server"></asp:TextBox>
                                                        <asp:TextBox ID="txtCommentBody" Style="margin-left: 10px" TextMode="MultiLine" CssClass="form-control" Rows="3" placeholder="Yorum" runat="server"></asp:TextBox>
                                                        <br />
                                                        <div class="col-md-12" style="padding-bottom: 10px">
                                                            <div class="pull-left">
                                                                <label class="col-md-4 ">Puan: </label>

                                                            </div>
                                                            <asp:DropDownList CssClass="col-md-8 form-control" Style="margin-left: 10px" Width="20%" ID="ddlStar" AutoPostBack="false" runat="server">
                                                                <asp:ListItem Text="1" Value="1" />
                                                                <asp:ListItem Text="2" Value="2" />
                                                                <asp:ListItem Text="3" Value="3" />
                                                                <asp:ListItem Text="4" Value="4" />
                                                                <asp:ListItem Text="5" Value="5" />
                                                            </asp:DropDownList>
                                                            <br />
                                                        </div>
                                                        <asp:Button class="btn btn-info" Text="Yorum Yap" runat="server" CommandName="btnLeaveComment" CommandArgument="" />

                                                    </fieldset>
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </ItemTemplate>
                            </asp:DataList>
                        </div>







                        <!-- Modal -->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel" style="font-family: montserrat, arial, verdana"></h4>
                                        <asp:HiddenField ID="hfManavAdı" runat="server" />
                                    </div>
                                    <div class="modal-body">
                                        <fieldset>
                                            <div class="productImg" style="width: 50%">
                                                <img id="imgProductFoto" src="#" width="160" height="160" />
                                            </div>
                                            <div style="width: 50%; float: right; margin-top: -25%">
                                                <asp:TextBox ID="txtMiktar" Style="width: 80px; height: 25px; float: left" TextMode="SingleLine" placeholder="Miktar" runat="server"></asp:TextBox>
                                                <asp:Label Text="kg" Style="float: left; margin-top: 5px;" runat="server" />
                                                <br />
                                                <br />
                                                <br />
                                                <label>&nbsp;&nbsp;Toplam:&nbsp;&nbsp;</label>
                                                <label id="lblToplamFiyat"></label>
                                                <asp:HiddenField ID="hfToplamFiyat" runat="server" />

                                            </div>
                                            <div class="productInfo">
                                                <asp:Label ID="lblProductName" runat="server" />
                                                <asp:HiddenField ID="hfProductName" runat="server" />
                                            </div>
                                            <div class="productInfo">
                                                <asp:Label ID="lblPrice" runat="server"></asp:Label>
                                                <asp:HiddenField ID="lblUrunID" runat="server"></asp:HiddenField>
                                            </div>


                                            <br />

                                        </fieldset>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
                                        <asp:Button ID="btnSepeteEkle" class="btn btn-info" Text="Sepete Ekle" runat="server" OnClick="btnSepeteEkle_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>



            </div>

        </div>

    </div>
    <!-- /.container -->

    <div class="container">

        <hr />

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; OrganicOnline 2017</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->




    <!-- jQuery -->
    <script src="JavaScript/jquery-1.11.3.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="JavaScript/bootstrap.min.js"></script>

    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=btnCikis.ClientID%>, #<%=btnSiparis.ClientID%>, .box, #adet, #topFiyat").hide();
            $(".star-calc").each(function () {
                var starCount = $(this).text();
                for (var i = 0; i < starCount; i++) {
                    $(this).parent().append("<i class='glyphicon glyphicon-star' style='color: #F87720'></i>")
                }
            });
        })


        var fiyat;

        $(".btnSatinAl").click(function () {
            var x = $(this).data('manav');
            document.getElementById("myModalLabel").innerHTML = x;
            $('#<%=hfManavAdı.ClientID%>').val(x);

            document.getElementById('<%=lblProductName.ClientID%>').innerHTML = $(this).data('ad');
            $('#<%=hfProductName.ClientID%>').val($(this).data('ad'));

            var x = $(this).data('id');
            $('#<%=lblUrunID.ClientID%>').val(x);

            document.getElementById('<%=lblPrice.ClientID%>').innerHTML = $(this).data('fiyat');
            fiyat = $(this).data('fiyat');
            var src = $(this).data('url');
            $("#imgProductFoto").attr('src', src);
        })

        $('#<%=txtMiktar.ClientID%>').keyup(function () {

            var istenenMiktar = $('#<%=txtMiktar.ClientID%>').val();
            fiyat = fiyat.split(' ');
            fiyat = fiyat[0];
            fiyat = fiyat.replace(",", ".");
            istenenMiktar = istenenMiktar.replace(",", ".");
            console.log("fiyat noktalı:" + fiyat);

            var toplam = istenenMiktar * fiyat;
            console.log("toplam:" + toplam);
            toplam = toplam.toFixed(2);
            $('#<%=hfToplamFiyat.ClientID%>').val(toplam);
            toplam = toplam + " " + "TL";
            document.getElementById('lblToplamFiyat').innerHTML = toplam;
        })

        $(".btn-default").click(function () {
            $('#<%=txtMiktar.ClientID%>').val("");
            $("#lblToplamFiyat").text("");
        });

        $(".close").click(function () {
            $('#<%=txtMiktar.ClientID%>').val("");
            $("#lblToplamFiyat").text("")
        });
    </script>






    <script>
        $('#sepet, #<%=lblSayi.ClientID%>').click(function () {
            $(".box").css("height", "90");
            $("#<%=btnCikis.ClientID%>").hide();

            $("#<%=btnSiparis.ClientID%>, #<%=lblUrunSayisi.ClientID%>, #<%=lblTopFiyat.ClientID%>").show();

            $(".box").toggle();

        })

        $("#login").click(function () {
            $(".box").css("height", "65");
            $('#<%=btnCikis.ClientID%>').show();
            $("#<%=btnSiparis.ClientID%>, #adet, #topFiyat").hide();
            $(".box").toggle();
        })
    </script>
</asp:Content>
