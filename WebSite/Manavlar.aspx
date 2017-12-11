<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.master" AutoEventWireup="true" CodeFile="Manavlar.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/AdminLTE.min.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- PRODUCT LIST -->
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title"><b>Manavlar</b></h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <div class="products-list product-list-in-box">

                <div style="padding-top: 10px" class="col-md-12">
                    <span><b>Manav'ın Konumu:</b></span>
                    <asp:ListBox ID="lstDistrict" runat="server" Width="100%" Height="100px" SelectionMode="Multiple" DataTextField="DistrictName" DataValueField="ObjectID"></asp:ListBox>
                </div>
                <div class="col-md-12" style="padding-top: 10px">
                    <asp:Button Text="Ara" CssClass="btn btn-primary pull-right" ID="btnSearch" OnClick="btnSearch_Click" runat="server" />
                </div>
            </div>
            <div class="clearfix"></div>
            <ul class="products-list product-list-in-box">
                <asp:Repeater ID="rptSupplier" OnItemDataBound="rptSupplier_ItemDataBound" runat="server">
                    <ItemTemplate>
                        <li class="item">
                            <div class="product-img">
                                <img src="images/default-50x50.gif" alt="Product Image" />
                            </div>
                            <div class="product-info">
                                <a href="javascript::;" class="product-title"><%#Eval("CompanyName") %> <span data-toggle="modal" data-target='#commentModal<%#Eval("ObjectID")%>' class="label label-primary pull-right">Yorumlara Bak</span></a>

                                <span class="product-description"><b><%#Eval("District.DistrictName") %></b> <%#Eval("Adress") %> - (<%#Eval("Phone") %>)
                                </span>
                            </div>
                        </li>


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
                                                                <div class="pull-left" style="margin-left: 20px">
                                                                    <div class="row">
                                                                        <span><%#Eval("User.Ad") %>&nbsp; <%#Eval("User.Soyad") %></span>
                                                                    </div>
                                                                    <div class="row">
                                                                        <span class="label label-default "><%#Eval("CommentDate","{0:dd/MM/yy - hh:mm}") %></span>

                                                                    </div>

                                                                    <asp:Label CssClass="star-calc" Style="display: none" Text='<%#Eval("Star") %>' runat="server" />
                                                                </div>
                                                            </div>

                                                            <div class="col-md-7">
                                                                <div class="pull-left">
                                                                    <a class="product-title"><%#Eval("Product.ProductName") %> ürünü için yapılan yorum şöyle:</a>
                                                                    <br />
                                                                    <span><a class="product-title"><%#Eval("CommentHeader") %> </a></span>
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
                                            <asp:Panel ID="pnlInfo" Visible="false" runat="server">
                                                Bu manava henüz yorum yapılmamıştır.
                                            </asp:Panel>

                                        </fieldset>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
                                    </div>
                                </div>
                            </div>
                        </div>

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
    <!-- /.box -->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".star-calc").each(function () {
                var starCount = $(this).text();
                for (var i = 0; i < starCount; i++) {
                    $(this).parent().append("<i class='glyphicon glyphicon-star' style='color: #F87720'></i>")
                }
            });
        })

    </script>
</asp:Content>

