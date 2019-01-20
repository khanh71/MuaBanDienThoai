<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DangNhapAdMin.aspx.cs" Inherits="DangNhapAdMin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" type="image/png" href="hinhadmin/minologo.png" />
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100" style="padding-top: 30px; width: 600px">
                    <div style="text-align: center; width: 100%; margin-bottom: 20px">
                        <img src="hinhadmin/LOGO.png" />
                    </div>
                    <form class="login100-form validate-form">

                        <div class="wrap-input100 validate-input" data-validate="Valid email is required">
                            <asp:RequiredFieldValidator runat="server" Text="Vui lòng nhập tên đăng nhập" ForeColor="Red" ControlToValidate="txtTenDN"></asp:RequiredFieldValidator>
                            <input class="input100" type="text" placeholder="Tên Đăng Nhập" runat="server" style="font-family: Tahoma" id="txtTenDN" />
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <asp:RequiredFieldValidator runat="server" Text="Vui lòng nhập mật khẩu" ForeColor="Red" ControlToValidate="txtMatKhau"></asp:RequiredFieldValidator>
                            <input class="input100" type="password" name="pass" placeholder="Mật Khẩu" runat="server" style="font-family: Tahoma" id="txtMatKhau">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="container-login100-form-btn" style="font-weight: bold; font-family: Tahoma">
                            <asp:Button ID="Button1" runat="server" Text="ĐĂNG NHẬP" class="login100-form-btn" OnClick="Button1_Click" />
                            <div style="margin-top:5px">
                                <asp:Label ID="lbThongbaoloi" runat="server"></asp:Label>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
