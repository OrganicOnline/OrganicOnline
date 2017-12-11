<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Genel.master" CodeFile="EditProduct.aspx.cs" Inherits="EditProduct" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/AdminLTE.min.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- PRODUCT LIST -->
    <div class="col-md-12">

        <div class="box box-primary ">
            <div class="box-header with-border">
                <h3 class="box-title"><b>
                    <asp:Label Text="" ID="lblUrunAdı" runat="server" /></b></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="form-horizontal">
                    <div class="col-md-2">
                        <b>Ürün Adı:</b>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox Text="" CssClass="form-control" ID="txtProductName" runat="server" />
                    </div>
                </div>
                <div class="form-horizontal">
                    <div class="col-md-offset-1 col-md-2">
                        <b>Miktarı:</b>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox Text="" CssClass="form-control" ID="txtQuantity" runat="server" />
                    </div>
                </div>
                <div class="form-horizontal">
                    <div class="col-md-2">
                        <b>Kategorisi:</b>
                    </div>
                    <div class="col-md-3">
                        <asp:DropDownList CssClass="form-control" DataTextField="CategoryName" DataValueField="ObjectID" ID="ddlCategory" runat="server" />
                    </div>
                </div>
                <div class="form-horizontal">
                    <div class="col-md-offset-1 col-md-2">
                        <b>Kilogram Başına Fiyatı:</b>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox Text="" CssClass="form-control" ID="txtPrice" runat="server" />
                    </div>
                </div>
                <br />
                <div class="form-horizontal" style="margin-top: 10px">
                    <div class="col-md-offset-10 col-md-2">
                        <asp:Button Text="Kaydet" CssClass="btn btn-primary " OnClick="Unnamed_Click" runat="server" />
                    </div>
                </div>

            </div>
            <!-- /.box-body -->
        </div>
    </div>


</asp:Content>

