<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="CreateTinTuc.aspx.cs" Inherits="CreateTinTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Thêm Tin Tức</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <h2 style="font-weight: bold; text-transform: uppercase">thêm tin tức</h2>
    <ul class="col-12 dlcongty">
        <li>
            <label>Tiêu Đề:</label><asp:RequiredFieldValidator runat="server" Text="Vui lòng nhập tiêu đề" ForeColor="Red" ControlToValidate="txtTieuDe"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtTieuDe" runat="server" CssClass="form-control"></asp:TextBox>
        </li>
        <li>
            <label>Tóm Tắt Nội Dung:</label><asp:RequiredFieldValidator runat="server" Text="Vui lòng nhập tóm tắt" ForeColor="Red" ControlToValidate="txtTomTat"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtTomTat" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
        </li>
        <li>
            <label>Hình Ảnh:</label><asp:RequiredFieldValidator runat="server" Text="Vui lòng thêm hình ảnh" ForeColor="Red" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </li>
        <li>
            <label>Đường Dẫn Tin:</label><asp:RequiredFieldValidator runat="server" Text="Vui lòng nhập đường dẫn" ForeColor="Red" ControlToValidate="txtLink"></asp:RequiredFieldValidator><asp:RegularExpressionValidator runat="server" ControlToValidate="txtLink" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" ForeColor="Red">Đường dẫn không hợp lệ</asp:RegularExpressionValidator>
            <asp:TextBox ID="txtLink" runat="server" CssClass="form-control"></asp:TextBox>
        </li>
        <li style="list-style: none; margin-top: 10px">
            <div style="text-align: center">
                <asp:Button ID="btnLuu" runat="server" Text="Lưu" CssClass="save" OnClick="btnLuu_Click" />
            </div>
        </li>
    </ul>
</asp:Content>

