<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="DienThoai.aspx.cs" Inherits="DienThoai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Sản Phẩm</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div>
        <h2 style="display:inline-block; text-transform:uppercase; font-weight:bold">Danh Sách Sản Phẩm</h2>
        <asp:HyperLink runat="server" ImageUrl="~/hinhadmin/add.png" CssClass="add" NavigateUrl="~/CreateDT.aspx"></asp:HyperLink>
    </div>
    <ul class="dlDienThoai">
        <asp:DataList ID="dlDienThoai" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" DataKeyField="MaSP" OnDeleteCommand="dlDienThoai_DeleteCommand">
            <ItemTemplate>
                <li>
                    <asp:HyperLink runat="server" NavigateUrl='<%#"~/ViewDT.aspx?masp=" + Eval("masp")  %>'>
                        <asp:Image runat="server" ImageUrl='<%# "~/images/home/"+Eval("HinhAnh") %>' />
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("TenSP") %>'></asp:Label>
                        <asp:Button runat="server" Text="Xóa" CommandName="delete" CssClass="xoa" />
                    </asp:HyperLink>
                </li>
            </ItemTemplate>
        </asp:DataList>
    </ul>
</asp:Content>

