<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.master" AutoEventWireup="true" CodeFile="UrunSiparis.aspx.cs" Inherits="UrunSiparis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .eklenenUrunler {
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
        #form1 input, #form1 textarea {
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
            width: 100%;
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
            text-align: center;
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

        <div id="urunKayit" runat="server">
            <fieldset>
                <h2 class="fs-title">Ürün Sİparİş</h2>
                <h3 class="fs-subtitle">Aşağıdaki siparişini vermek istediğiniz ürünleri doğrulayın.</h3>
                <div class="dropdown">
                    <div class="eklenenUrunler">
                        <p id="pBilgi" runat="server" visible="false">
                            Sipariş listenizde herhangi bir ürün bulunmamaktadır. Sipariş sayfasına dönmek için
                            <asp:HyperLink runat="server" ID="hpTikla" NavigateUrl="~/Urunlerr.aspx"> tıklayınız.</asp:HyperLink>
                        </p>
                        <table>
                            <asp:Repeater ID="rptUrunler" OnItemCommand="rptUrunler_ItemCommand" runat="server">
                                <HeaderTemplate>
                                    <thead>
                                        <tr>
                                            <th>&nbsp;</th>
                                            <th>Ürün İsmi</th>
                                            <th>Sipariş Kilosu</th>
                                            <th>Fiyatı</th>
                                            <th>Bulunduğu Manav</th>
                                        </tr>
                                    </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tbody>
                                        <tr>
                                            <td>

                                                <a href="#" data-toggle="tooltip" data-placement="left" title="Kaldır">
                                                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("ProductName")%>' CommandName="kaldir"><span class="glyphicon glyphicon-remove"></span></asp:LinkButton></a>

                                            </td>
                                            <%--<td><%# Container.DataItem.ToString() %></td>--%>
                                            <td><%#Eval("ProductName")%></td>
                                            <td><%#Eval("Quantity", "{0} kg")%></td>
                                            <td><%#Eval("Price", "{0} TL")%></td>
                                            <td><%#Eval("Supplier.CompanyName")%></td>

                                        </tr>
                                    </tbody>
                                </ItemTemplate>
                            </asp:Repeater>

                        </table>
                        <%-- <br />--%>
                    </div>
                    <%--<br />--%>
                    <%--                    <div id="solBolum">
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
                    </div>--%>
                </div>
                <br />
                <br />
                <asp:TextBox ID="txtAdres" TextMode="MultiLine" placeholder="Siparişi Göndermek İstediğiniz Adres" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtNot" TextMode="MultiLine" placeholder="Siparişe Eklemek İstediğiniz Not" runat="server"></asp:TextBox>

                <asp:Panel ID="pnlPaymnet" runat="server">
                    <div class="dropdown">
                        <div class="eklenenUrunler">
                            <h3 style="margin-top: 0px" class="fs-subtitle">Ödeme tipini seçiniz.</h3>
                            <div class="col-md-4">
                                <div class="pull-left">
                                    <asp:RadioButton ID="rb1" runat="server" GroupName="group1" Text="Havale"></asp:RadioButton>
                                    <asp:RadioButton ID="rb2" runat="server" GroupName="group1" Text="Kredi Kartı"></asp:RadioButton>
                                    <asp:RadioButton ID="rb3" runat="server" GroupName="group1" Text="Nakit (Elden)"></asp:RadioButton>

                                </div>
                            </div>
                            <div class="col-md-8">
                                <div id="pnlCard" style="display: none">
                                    <div class="col-md-4">Kart Sahibi Ad/Soyad:</div>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control required" />
                                    </div>
                                    <div class="col-md-4">Kart Numarası:</div>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" />
                                    </div>
                                    <div class="col-md-4">Son Kullanma Tarihi: </div>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" placeholder="MM/YY" />
                                    </div>
                                    <div class="col-md-4">CVC: </div>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" />
                                    </div>
                                </div>
                                <div id="pnlHavaleAndNakit" style="display: none">
                                    <p><i class="glyphicon glyphicon-info-sign"></i>Ödeme tipiniz manav tarafından kabul edildiği zaman gerekli bilgiler tarafınıza gönderilecektir. </p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </asp:Panel>





                <asp:Button Text="Onayla" ID="btnOnayla" class="next action-button" runat="server" OnClick="btnOnayla_Click" />
            </fieldset>
        </div>
    </div>


    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
        $("#<%=rb1.ClientID%>, #<%=rb3.ClientID%>").click(function () {
            $("#pnlHavaleAndNakit").show();
            $("#pnlCard").hide();
        });
        $("#<%=rb2.ClientID%>").click(function () {
            $("#pnlCard").show();
            $("#pnlHavaleAndNakit").hide();
        });
    </script>
</asp:Content>

