<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="CreateAdmin.aspx.cs" Inherits="CreateAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Thêm Quản trị viên</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <h2 style="font-weight: bold; text-transform: uppercase">thêm quản trị viên</h2>
    <ul class="col-12 dlcongty">
        <li>
            <label>Tên đăng nhập:</label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtTenDN" ErrorMessage="Vui lòng nhập tên đăng nhập" ForeColor="Red"></asp:RequiredFieldValidator><asp:Label ID="lbThongbaoloi" runat="server" ForeColor="Red"></asp:Label>
            <asp:TextBox ID="txtTenDN" runat="server" CssClass="form-control"></asp:TextBox>
        </li>
        <li>
            <label>Mật khẩu:</label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtMatkhau" Text="Vui lòng nhập mật khẩu" ForeColor="Red"></asp:RequiredFieldValidator><asp:RegularExpressionValidator runat="server" ErrorMessage="Độ dài tối thiểu 8 ký tự" ControlToValidate="txtMatkhau" ValidationExpression="^[\s\S]{8,}" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtMatKhau" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </li>
        <li>
            <label>Nhập lại mật khẩu:</label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtNhapLai" Text="Vui lòng nhập lại mật khẩu" ForeColor="Red"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Mật khẩu không trùng khớp" ControlToValidate="txtNhapLai" ControlToCompare="txtMatKhau" ForeColor="Red"></asp:CompareValidator>
            <asp:TextBox ID="txtNhapLai" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </li>
        <li>
            <label>Họ Tên:</label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtHoTen" Text="Vui lòng nhập tên" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control"></asp:TextBox>
        </li>
        <li>
            <label>Địa chỉ:</label>
            <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
        </li>
        <li>
            <label>Số điện thoại:</label><asp:RegularExpressionValidator runat="server" ErrorMessage="Vui lòng nhập số có độ dài 10 hoặc 11" ValidationExpression="^\d{10,11}" ControlToValidate="txtSDT" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtSDT" runat="server" CssClass="form-control"></asp:TextBox>
        </li>
        <li>
            <label>Email:</label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" Text="Vui lòng nhập Email" ForeColor="Red"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Định dạng không hợp lệ</asp:RegularExpressionValidator>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
        </li>
        <li style="list-style: none; margin-top: 10px">
            <div style="text-align: center">
                <asp:Button ID="btnLuu" runat="server" Text="Lưu" CssClass="save" OnClick="btnLuu_Click" />
            </div>
        </li>
    </ul>
</asp:Content>

