<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Genel.master" CodeFile="ShopLayout.aspx.cs" Inherits="ShopLayout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/AdminLTE.min.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- PRODUCT LIST -->
    <div class="col-md-6">

        <div class="box box-primary ">
            <div class="box-header with-border">
                <h3 class="box-title"><b>Manavlar</b></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="clearfix"></div>
                <ul class="products-list product-list-in-box">
                    <asp:Repeater ID="rptSupplier" OnItemCommand="rptSupplier_ItemCommand" runat="server">
                        <ItemTemplate>
                            <li class="item">
                                <div class="product-img">
                                    <asp:Image ImageUrl='<%#Eval("PhotoPath", "~/{0}")%>' Width="50" Height="50" runat="server" />
                                </div>
                                <div class="product-info">
                                    <a href="javascript::;" class="product-title"><%#Eval("ProductName") %> </a>

                                    <span class="product-description"><b><%#Eval("Quantity") %> kg</b> <%#Eval("Price") %> TL/kg)
                                    </span>
                                </div>
                                <div class="pull-right">
                                    <a class="btn btn-primary btn-xs" href='EditProduct.aspx?id=<%#Eval("ObjectId") %>'>Güncelle</a>
                                    <asp:LinkButton Text="Kaldır" CssClass="btn btn-danger btn-xs" CommandName="sil" CommandArgument='<%#Eval("ObjectId") %>' runat="server" />
                                </div>
                            </li>




                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <asp:Panel ID="pnlBilgi" Visible="false" runat="server">
                    <div class="products-list product-list-in-box">

                        <div class="panel panel-default">
                            <div class="panel-body" style="color: dodgerblue">
                                Seçtiğiniz kriterlere uygun manav bulunamadı.
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <!-- /.box-body -->
        </div>
    </div>


</asp:Content>

