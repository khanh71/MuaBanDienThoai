<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.master" AutoEventWireup="true" CodeFile="DangNhap.aspx.cs" Inherits="DangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="gioithieu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="noidung" runat="Server">
    <div style="padding-top: 4%">
        <div style="background-color: #fff; padding: 20px; width: 50%; box-shadow: 5px 5px 50px #888888;" class="container">
            <h2>ĐĂNG NHẬP</h2>
            <asp:Label ID="Label1" runat="server" Text="Bạn phải đăng nhập để tiếp tục" ForeColor="Red"></asp:Label>
            <asp:Panel runat="server" DefaultButton="Button1">
                <div class="form-group">
                    <label for="email">Tên đăng nhập:</label><asp:RequiredFieldValidator runat="server" ForeColor="Red" Text="Vui lòng nhập tên đăng nhập" ControlToValidate="txtTen"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtTen" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="pwd">Mật khẩu:</label><asp:RequiredFieldValidator runat="server" Text="Vui lòng nhập mật khẩu" ForeColor="Red" ControlToValidate="txtMatkhau"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtMatkhau" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-check" style="margin-bottom: 50px; margin-top: -15px">
                    <asp:CheckBox ID="cbLuu" runat="server" Text=" Nhớ đăng nhập" CssClass="form-check-input" />
                </div>
                <asp:Button ID="Button1" runat="server" Text="Đăng Nhập" class="btn btn-primary" OnClick="Button1_Click" />
            </asp:Panel>
            <asp:Label ID="lbThongbaoloi" runat="server" ForeColor="Red"></asp:Label>
            <p>Chưa có tài khoản?
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/DangKy.aspx" Font-Underline="True" ForeColor="Blue">Đăng ký</asp:HyperLink></p>
        </div>
    </div>
</asp:Content>

