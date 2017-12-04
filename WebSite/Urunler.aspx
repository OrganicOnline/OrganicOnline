<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Urunler.aspx.cs" Inherits="Urunler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .dlTablo{
            /*position: absolute;
            top: 10%;
            left: 25%;*/
            text-align:center;
        }
        .product{
            width:175px;
            height:240px;
            border: 1px solid #abcdef;
            border-radius:5px;
        }
        .productImg{
            width:165px;
            height:165px;
            margin-left:5px;
        }
        .productInfo{
            width:165px;
            height:25px;
            font-weight:bold;
            text-align:center;
        }
        .operationBtn{
            text-align:center;
        }
    </style>

</head>
<body>
<%--    <form id="form1" runat="server">--%>
<%--    <div class="dlTablo">
        <asp:DataList ID="dlUrunler" runat="server" OnItemCommand="dlUrunler_ItemCommand" RepeatColumns="3">
            <ItemTemplate>  
                <div class="product">
                    <div class="productImg">
                        <asp:Image ImageUrl='<% #Eval("CompanyPhoto", "~/{0}") %>' Width="165" Height="165"  runat="server" />
                    </div>
                    <div class="productInfo">
                        <asp:Label Text='<%#Eval("CompanyName") %>' runat="server" />
                    </div>
                    <div class="productInfo">
                        <asp:Label Text='<%#Eval("Phone", "{0} TL") %>' runat="server" />
                    </div>
                    <div class="operationBtn">
                        <asp:Button Text="Güncelle" CommandName="edit" CommandArgument='<%#Eval("ObjectID") %>' runat="server" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>--%>    
<%--    </form>--%>


  <form id="form1" runat="server">

    <h3>Button.PostBackUrl Example</h3>

    Enter a value to post:
    <asp:textbox id="TextBox1" 
      runat="Server">
    </asp:textbox>

    <br /><br />

    <asp:button id="Button1" 
      text="Post back to this page"
      runat="Server">
    </asp:button>

    <br /><br />

    <asp:button id="Button2"
      text="Post value to another page" 
      postbackurl="Button.PostBackUrlPage2cs.aspx" 
      runat="Server">
    </asp:button>

  </form>

</body>
</html>
