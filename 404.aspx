<%@ Page Language="C#" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="_404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/404.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="error">
            <p class="p">4</p>
            <span class="dracula">
                <div class="con">
                    <div class="hair"></div>
                    <div class="hair-r"></div>
                    <div class="head"></div>
                    <div class="eye"></div>
                    <div class="eye eye-r"></div>
                    <div class="mouth"></div>
                    <div class="blod"></div>
                    <div class="blod blod2"></div>
                </div>
            </span>
            <p class="p">4</p>
            <div class="page-ms">
                <p class="page-msg">Liên kết mà bạn đang cố gắng truy cập đã không còn tồn tại</p>
                <asp:Button ID="Button1" runat="server" Text="Về Trang Chủ" CssClass="go-back" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
