<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.master" AutoEventWireup="true" CodeFile="DangKy.aspx.cs" Inherits="DangKy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="gioithieu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="noidung" runat="Server">
    <div style="background-color: #fff; padding: 20px; width: 50%;box-shadow: 5px 5px 50px #888888;" class="container">
        <h2>ĐĂNG KÝ</h2>
        <asp:Panel runat="server" DefaultButton="Button1">
            <div class="form-group">
                <label>Tên đăng nhập:<span style="font-size:13px">(*)</span></label><asp:RequiredFieldValidator runat="server" ControlToValidate="txten"></asp:RequiredFieldValidator><asp:CustomValidator ID="CustomValidator1" runat="server" Text="Tên đăng nhập đã tồn tại, vui lòng thử lại với tên khác !" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                <asp:TextBox ID="txten" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Mật khẩu:<span style="font-size:13px">(*)</span></label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtMatkhau"></asp:RequiredFieldValidator><asp:RegularExpressionValidator runat="server" ErrorMessage="Độ dài tối thiểu 8 ký tự" ControlToValidate="txtMatkhau" ValidationExpression="^[\s\S]{8,}" ForeColor="Red"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtMatkhau" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Nhập lại mật khẩu:<span style="font-size:13px">(*)</span></label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtNhapLai"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Mật khẩu không trùng khớp" ControlToValidate="txtNhapLai" ControlToCompare="txtMatkhau"></asp:CompareValidator>
                <asp:TextBox ID="txtNhapLai" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Họ Tên:<span style="font-size:13px">(*)</span></label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtHoTen"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtHoTen" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Địa chỉ:<span style="font-size:13px">(*)</span></label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtDiachi"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtDiachi" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Số điện thoại:<span style="font-size:13px">(*)</span></label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtSDT"></asp:RequiredFieldValidator><asp:RegularExpressionValidator runat="server" ErrorMessage="Vui lòng nhập số có độ dài 10 hoặc 11" ValidationExpression="^\d{10,11}" ControlToValidate="txtSDT" ForeColor="Red"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtSDT" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Email:<span style="font-size:13px">(*)</span></label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Email không hợp lệ</asp:RegularExpressionValidator>
                <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="Button1" runat="server" Text="Đăng Ký" class="btn btn-primary" OnClick="Button1_Click" />
            <asp:Label ID="lbThongbaoloi" runat="server" ForeColor="Red"></asp:Label>
        </asp:Panel>
        <asp:Label ID="Label1" runat="server" Text="(*) Bắt buộc" Font-Size="12px"></asp:Label><asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Vui lòng nhập đầy đủ thông tin yêu cầu" />
    </div>
</asp:Content>

