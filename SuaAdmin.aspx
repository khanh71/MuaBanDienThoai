<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="SuaAdmin.aspx.cs" Inherits="SuaAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Cập nhật thông tin Quản trị viên</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <h2 style="font-weight: bold; text-transform: uppercase">Cập nhật thông tin quản trị viên</h2>
    <ul class="col-12 dlcongty">
        <asp:DataList ID="dlSuaAdmin" runat="server" RepeatLayout="Flow" OnUpdateCommand="dlSuaAdmin_UpdateCommand" DataKeyField="id">
            <ItemTemplate>
                <li>
            <label>Họ Tên:</label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtHoTen" Text="Vui lòng nhập tên" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control" Text='<%#Eval("HoTen") %>'></asp:TextBox>
        </li>
        <li>
            <label>Địa chỉ:</label>
            <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control" Text='<%#Eval("DiaChi") %>'></asp:TextBox>
        </li>
        <li>
            <label>Số điện thoại:</label>
            <asp:TextBox ID="txtSDT" runat="server" CssClass="form-control" Text='<%#Eval("SDT") %>'></asp:TextBox>
        </li>
        <li>
            <label>Email:</label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" Text="Vui lòng nhập Email" ForeColor="Red"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Định dạng không hợp lệ</asp:RegularExpressionValidator>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Text='<%#Eval("Email") %>'></asp:TextBox>
        </li>
        <li style="list-style: none; margin-top: 10px">
            <div style="text-align: center">
                <asp:Button ID="btnLuu" runat="server" Text="Lưu" CssClass="save"  CommandName="update" />
            </div>
        </li>
            </ItemTemplate>
        </asp:DataList>
    </ul>
</asp:Content>

