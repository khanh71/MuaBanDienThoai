<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="CreateCT.aspx.cs" Inherits="CreateCT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Thêm Hãng Sản Xuất</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <h2 style="font-weight: bold; text-transform: uppercase">thêm hãng sản xuất</h2>
    <ul class="col-12 dlcongty">
        <li>
            <label>Tên Công Ty:</label><asp:RequiredFieldValidator runat="server" Text="Vui lòng nhập tên công ty" ForeColor="Red" ControlToValidate="txtTen"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtTen" runat="server" CssClass="form-control"></asp:TextBox>
        </li>
        <li>
            <label>Quốc Gia:</label>
            <asp:TextBox ID="txtQuocGia" runat="server" CssClass="form-control"></asp:TextBox>
        </li>
        <li>
            <label>Hình Ảnh:</label>
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </li>
        <li>
            <label>Giới Thiệu Sơ Lược:</label><asp:RequiredFieldValidator runat="server" Text="Vui lòng nhập mô tả" ForeColor="Red" ControlToValidate="txtMota"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtMota" runat="server" CssClass="form-control" Rows="4" TextMode="MultiLine"></asp:TextBox>
        </li>
        <li style="list-style: none; margin-top: 10px">
            <div style="text-align: center">
                <asp:Button ID="btnLuu" runat="server" Text="Lưu" CssClass="save" OnClick="btnLuu_Click" />
            </div>
        </li>
    </ul>
</asp:Content>

