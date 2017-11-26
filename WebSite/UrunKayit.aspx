<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.master" AutoEventWireup="true" CodeFile="UrunKayit.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        @import url(http://fonts.googleapis.com/css?family=Montserrat);

        /*.box img {
            width: 25px;
            height: 25px;
            float: right;
            border: 2px solid ButtonFace;
            border-radius: 5px;
            padding: 2px;
            background-color: ButtonFace;
        }

            .box img:hover {
                opacity: .5;
            }

        .box {
            font-family: montserrat, arial, verdana;
            background: #ccc;
            padding: 10px 15px;
            border-radius: 3px;
            display: inline-block;
            position: relative;
            width: 250px;
        }

            .box p {
                font-size: 13px;
            }

            .box:before {
                content: '';
                width: 0;
                height: 0;
                position: absolute;
                border: 8px solid transparent;
            }

            .box.sol:before {
                border-right-color: #ccc;
                bottom: 30px;
                left: -16px;
            }*/

        #eklenenUrunler {
            border: 1px solid;
            border-radius: 3px;
            border-color: #ccc;
            padding: 10px;
        }
        /* ÜRÜN KAYIT  */
        #form1 h2, h3 {
            font-weight: bold;
            text-align: center;
        }

        #form1 fieldset {
            font-family: montserrat, arial, verdana;
            background: white;
            border: 0 none;
            border-radius: 3px;
            box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
            padding: 20px 30px;
            box-sizing: border-box;
            width: 60%;
            min-width: 550px;
            margin: 0 20%;
        }

            #form1 fieldset:not(:first-of-type) {
                display: none;
            }
        /*inputs*/
        #form1 input, #msform textarea {
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
        #form1 .action-button {
            width: 100px;
            background: #27AE60;
            color: white;
            border: 0 none;
            border-radius: 1px;
            cursor: pointer;
            padding: 10px 5px;
            margin: 10px 65%;
        }

            #form1 .action-button:hover, #msform .action-button:focus {
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

        #solBolum {
            width: 40%;
            float: left;
        }

        #sagBolum {
            width: 60%;
            float: right;
        }


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
            z-index: 2;
            height: 50px;
            width: 50px;
        }

            .fakeFileUpload img {
                position: absolute;
                height: 50px;
                width: 50px;
                margin-top: -65px;
            }

                .fakeFileUpload img:hover {
                    cursor: pointer;
                }

        .txtFileBilgi {
            text-align: left;
            font-size: 12px;
            margin-top: -55px;
            margin-left: 70px;
            width: 200px;
        }

        table {
            /*margin: 0px 35px;*/
            width:100%;
        }

        thead {
            background: SteelBlue;
            color: white;
        }

        th {
            text-align: center;
        }

        th,
        td {
            padding: 5px 10px;
        }


        tbody tr td:nth-child(2) {
            text-align: center;
        }

        tbody tr td:nth-child(3),
        tbody tr td:nth-child(4) {
            text-align: center;
        }

        tbody tr td:nth-child(5) {
            text-align: right;
        }

        .glyphicon-remove:hover {
            color: #B40404;
            cursor: pointer;
        }

        .glyphicon-remove {
            color: black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="=col-md-9">
<%--        <div id="bilgiEkranı">
            <img src="images/konusanManav.png" width="100px" height="130px" />
            <div class="box sol">
                <div class="block">
                    <div class="close1">
                        <a id="close2" href="#">
                            <img src="http://icons.iconarchive.com/icons/rafiqul-hassan/blogger/512/Close-icon.png" />
                        </a>
                        <p id="paragrafBilgi" runat="server">Ürün kaydını aşağıdaki formu doldurarak yapabilirsiniz.</p>
                    </div>
                </div>

            </div>
        </div>--%>

        <div id="urunKayit" runat="server">
            <fieldset>
                <h2 class="fs-title">Ürün Kaydı</h2>
                <h3 class="fs-subtitle">Manavınıza eklemek istediğiniz ürünün bilgilerini giriniz.</h3>
                <div class="dropdown">
<%--                    <%if(Session["liste"] != null || HttpContext.Current.Session.Count != 0)
                      { %>--%>
                    <div id="eklenenUrunler">
                        <p id="pBilgi" runat="server" visible="false">Listeye eklediğiniz bir ürün bulunmamaktadır.</p>
                        <table>
                            <asp:Repeater ID="rptListe" OnItemCommand="rptListe_ItemCommand" runat="server">
                                <HeaderTemplate>
                                    <thead>
                                        <tr>
                                            <th>&nbsp;</th>
                                            <th>Ürün Tipi</th>
                                            <th>Ürün İsmi</th>
                                            <th>Toplam Miktar</th>
                                            <th>Fiyat</th>
                                        </tr>
                                    </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tbody>
                                        <tr>
                                            <td>

                                              <a href="#" data-toggle="tooltip" data-placement="left" title="Kaldır" ><asp:LinkButton runat="server" CommandArgument='<%#Eval("productName")%>' CommandName="kaldir"><span class="glyphicon glyphicon-remove"></span></asp:LinkButton></a>                  
                                                
                                            </td>
                                            <td><%#Eval("categoryID")%></td>
                                            <td><%#Eval("productName")%></td>
                                            <td><%#Eval("quantity", "{0} kg")%></td>
                                            <td><%#Eval("price", "{0} kg/TL")%></td>

                                        </tr>
                                    </tbody>
                                </ItemTemplate>
                            </asp:Repeater>

                        </table>
                        <br />
                        <asp:Button Text="Kaydet" ID="btnKaydet" class="next action-button" runat="server" OnClick="btnKaydet_Click" />

                    </div>
                    <%--<%} %>--%>
                    <br />
                    <div id="solBolum">
                        <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown" aria-haspopup="true">
                            <span id="spnTur" runat="server">Ürün Türü</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                            <asp:HiddenField ID="hfCategoryId" Value="default" runat="server" />

                            <asp:Repeater ID="rptKategori" OnItemCommand="rptKategori_ItemCommand" runat="server">
                                <ItemTemplate>
                                    <li role="presentation">
                                        <asp:LinkButton Text='<%#Eval("CategoryName") %>' CommandArgument='<%#Eval("ObjectID")%>' CommandName="categoryById" runat="server" />
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <div id="sagBolum">
                        <div class="fakeFileUpload">
                            <asp:FileUpload ID="fuUrunFoto" runat="server" CssClass="file" />
                            <img src="images/upload.png" />
                            <div class="txtFileBilgi">
                                <asp:Label ID="lblFileBilgi" Text="Ürünün Fotoğrafı" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <asp:TextBox ID="txtUrunAdi" TextMode="SingleLine" placeholder="Ürünün Adı" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtStok" TextMode="SingleLine" placeholder="Ürünün Kilogram Cinsinden Toplam Miktarı" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtFiyat" TextMode="SingleLine" placeholder="Ürünün Kilogram Başına Fiyatı" runat="server" Width="80%"></asp:TextBox>
                <asp:Label Text="TL" runat="server" />
                <asp:Button Text="Ekle" ID="btnEkle" class="next action-button" runat="server" OnClick="btnEkle_Click" />
            </fieldset>
        </div>
    </div>
    <script>
        $("#close2").click(function () {
            $("#bilgiEkranı").css("display", "block").fadeOut(800)
        });
    </script>
    <script>
        $(function () {
            $(".dropdown-menu li a").click(function () {
                $('#<%=spnTur.ClientID%>').text($(this).text());
                $('#<%=spnTur.ClientID%>').val($(this).text());
            });

        });
    </script>

    <script type="text/javascript">
        $('input[type=file]').change(function () {
            var filePath = $('#<%=fuUrunFoto.ClientID%>').val();
            var split = filePath.split("\\");
            var file = split[split.length - 1];
            alert(file);
            document.getElementById('<%=lblFileBilgi.ClientID%>').innerHTML = file;
            if (file.length <= 1) {
                document.getElementById('<%=lblFileBilgi.ClientID%>').innerHTML = "Dosya seçilmedi";
            }
        });
    </script>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
<%--    <script>
        $("#<%=btnKaydet.ClientID%>").click(function () {
            alert("Hi");
            document.getElementById('<%=paragrafBilgi.ClientID%>').innerText = "Ürünleriniz başarıyla kaydedilmiştir.";
        });
    </script>--%>
</asp:Content>

