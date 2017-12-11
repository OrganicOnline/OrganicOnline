<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Genel.master" CodeFile="CommentApproval.aspx.cs" Inherits="CommentApproval" %>

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
            <ul class="products-list product-list-in-box">
                <asp:Repeater ID="rptComments" OnItemCommand="rptComments_ItemCommand" runat="server">
                    <ItemTemplate>
                        <li class="item">
                            <div class="product-info">
                                <a href="javascript::;" class="product-title"><%#Eval("User.Ad") %>  -  <%#Eval("CommentHeader") %> <span class="label label-default pull-right"><%#Eval("CommentDate","{0:dd/MM/yy - hh:mm}") %></span></a>
                                <span class="product-description"><b>Yıldız Sayısı:</b> <%#Eval("Star") %></span>
                                <span> <%#Eval("CommnetBody") %></span>
                            </div>
                            <div class="pull-right">
                                
                            <asp:Button Text="Onayla" CssClass="btn btn-primary btn-xs" ID="btnApprove" CommandName="Onayla" CommandArgument='<%#Eval("ObjectId") %>' runat="server" />
                            <asp:Button Text="Onaylama ve Sil" CssClass="btn btn-danger btn-xs" ID="btnIgnore" CommandName="Sil" CommandArgument='<%#Eval("ObjectId") %>' runat="server" />
                            </div>
                        </li>

                    </ItemTemplate>
                </asp:Repeater>
            </ul>

        </div>
        <!-- /.box-body -->
    </div>
    <!-- /.box -->
</asp:Content>
