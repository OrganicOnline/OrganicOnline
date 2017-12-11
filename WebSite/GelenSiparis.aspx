<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Genel.master" CodeFile="GelenSiparis.aspx.cs" Inherits="GelenSiparis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/AdminLTE.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- PRODUCT LIST -->
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title"><b>Gelen Siparişler</b></h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <ul class="products-list product-list-in-box">
                <asp:Repeater ID="rptSiparislerim" OnItemCommand="rptSiparislerim_ItemCommand" OnItemDataBound="rptSiparislerim_ItemDataBound" runat="server">
                    <ItemTemplate>
                        <li class="item">
                            <div class="col-md-3" style="border-right: groove; padding-left: 0px;">
                                <asp:Panel ID="pnlButtons" runat="server">
                                    <div class="product-info">
                                        <a href="javascript::;" class="product-title">İşlemler:</a>
                                        <p>
                                            <asp:Button Text="İptal Et" ID="btnIptal" CommandName='iptal' CommandArgument='<%#Eval("ObjectId") %>' CssClass="btn btn-danger btn-xs" runat="server" />
                                            <asp:Button Text="Kargoya Verdim" ID="btnOnay" CommandName='onay' CommandArgument='<%#Eval("ObjectId") %>' CssClass="btn btn-primary btn-xs" runat="server" />
                                        </p>
                                    </div>
                                </asp:Panel>
                                <asp:Label Visible="false" style="margin-left:0px" ID="lblBilgi" runat="server" />
                            </div>
                            <div class="col-md-2 " style="border-right: groove; margin-left: -50px;">
                                <div class="product-info">
                                    <a href="javascript::;" class="product-title"><%#Eval("Product.ProductName") %> </a>

                                    <span class="product-description"><b><%#Eval("Quantity") %> kg</b> - (<%#Eval("Product.Price") %> kg/TL)</span>
                                    <span class="product-description"><b>Ödeme Tipi: </b> <%#Eval("PaymentType.PaymentName") %></span>
                                    
                                </div>
                            </div>
                            <div class="col-md-4" style="border-right: groove">
                                <span class="product-description"><b>Teslimat Adresi: </b> <%#Eval("DeliveryAddress") %>
                                    <span class="product-description"><b>Not:</b> <%#Eval("DeliveryNote") %>
                            </div>
                            <div class="col-md-3">
                                <span class="product-description"><b>Sipariş Durumu: </b><asp:Label class="label label-warning pull-right" id="spanBilgi" runat="server"><%#Eval("Status.StatusName") %></asp:Label>
                                    <span class="product-description"><b>Son İşlem Tarihi: </b><span class="label label-default pull-right"><%#Eval("LastOperationDate","{0:dd/MM/yy - hh:mm}") %></span>
                            </div>

                        </li>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Label Text="Siparişiniz bulunmamaktadır." ID="lblNoSiparis" Visible="false" runat="server" />
            </ul>

        </div>
        <!-- /.box-body -->
    </div>
    <!-- /.box -->
</asp:Content>
