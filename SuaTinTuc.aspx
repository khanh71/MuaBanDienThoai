<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="SuaTinTuc.aspx.cs" Inherits="SuaTinTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Cập nhật thông tin Tin tức</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <h2 style="display: inline-block; text-transform: uppercase; font-weight: bold">cập nhật tin tức</h2>
    <ul class="col-12 dlcongty">
        <asp:DataList ID="dlTinTuc" runat="server" OnUpdateCommand="dlTinTuc_UpdateCommand" RepeatLayout="Flow" DataKeyField="ID">
            <ItemTemplate>
                <li>
                    <label>Tiêu Đề:</label><asp:RequiredFieldValidator runat="server" Text="Vui lòng nhập tiêu đề" ForeColor="Red" ControlToValidate="txtTieuDe"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtTieuDe" runat="server" CssClass="form-control" Text='<%# Eval("TieuDe") %>'></asp:TextBox>
                </li>
                <li>
                    <label>Tóm Tắt Nội Dung:</label><asp:RequiredFieldValidator runat="server" Text="Vui lòng nhập tóm tắt" ForeColor="Red" ControlToValidate="txtTomTat"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtTomTat" runat="server" CssClass="form-control" Text='<%# Eval("TomTat") %>' TextMode="MultiLine" Rows="2"></asp:TextBox>
                </li>
                <li>
                    <label>Hình Ảnh:</label>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </li>
                <li>
                    <label>Đường Dẫn Tin:</label><asp:RequiredFieldValidator runat="server" Text="Vui lòng nhập đường dẫn" ForeColor="Red" ControlToValidate="txtLink"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtLink" runat="server" CssClass="form-control" Text='<%# Eval("URL") %>'></asp:TextBox>
                </li>
                <li style="list-style: none; margin-top: 10px">
                    <div style="text-align: center">
                        <asp:Button ID="btnLuu" runat="server" Text="Lưu" CssClass="save" CommandName="update" />
                    </div>
                </li>
            </ItemTemplate>
        </asp:DataList>
    </ul>
</asp:Content>

