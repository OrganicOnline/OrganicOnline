<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
</head>
<body>
    <form id="form1" runat="server" role="form">
        <div class="main">
        <div class="register">
        <table>
            <tr>
                <td class="style1"><p>Ad&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</p></td>
                <td class="style2">
                    <asp:TextBox ID="txtAd" class="form-control" runat="server" style="margin-left: 0px" Width="161px"></asp:TextBox>
                </td>
                <td class="style3"></td>
            </tr>

            <tr>
                <td class="style1"><p>Soyad&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</p></td>
                <td class="style2">
                    <asp:TextBox ID="txtSoyad" class="form-control" runat="server" Width="161px"></asp:TextBox>
                </td>
                <td class="style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="style1"><p>Kullanıcı Adı:</p></td>
                <td class="style2">
                    <asp:TextBox ID="txtUsr" class="form-control" runat="server" Width="161px"></asp:TextBox>
                </td>
                <td class="style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="style1"><p>Şifre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</p></td>
                <td class="style2">
                    <asp:TextBox ID="txtPswd" class="form-control" runat="server" Width="161px" Height="33px"></asp:TextBox>
                </td>
                <td class="style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="style1"><p>Şifre Tekrar&nbsp;&nbsp;:</p></td>
                <td class="style2">
                    <asp:TextBox ID="txtPswdAgain" class="form-control" runat="server" Width="161px"></asp:TextBox>
                </td>
                <td class="style3"></td>
            </tr>
            <tr>
                <td class="style1"><p>E-Mail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</p></td>
                <td class="style2">
                    <asp:TextBox ID="txtMail" class="form-control" runat="server" Width="161px"></asp:TextBox>
                </td>
                <td class="style3"></td>
            </tr>
        </table>

        <hr/>
                       <table>
                 <tr>
                     <td class="auto-style19">
                      <p> Bir manav dükkanım var ve siteyi ürünlerimi tanıtmak için kullanacağım.</p>
                     </td>
                     <td class="auto-style20">

                         <asp:CheckBox ID="cbAdmin" runat="server"/>

                     </td>
                  </tr>
                 <tr>
                     <td class="auto-style21">
                    <p>   Siteyi sadece ürünleri görmek ve sipariş vermek için kullanacağım.</p>
                     </td>
                     <td class="auto-style22">

                         <asp:CheckBox ID="cbUser" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" />

                     </td>
                  </tr>
                 </table>
            <br />
            <div id="btn"><asp:Button class="btn btn-default" ID="btnIleri" runat="server" Text="İleri" height="28px" Width="50px" OnClick="btnIleri_Click" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Smaller"/></div>
            </div>
            </div>
    </form>
    </body>
</html>
