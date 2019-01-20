<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.master" AutoEventWireup="true" CodeFile="TimKiem.aspx.cs" Inherits="TimKiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <title runat="server" id="kqtk"></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="gioithieu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="noidung" runat="Server">
    <div style="background-color: #fff; padding-bottom: 20px; padding-top: 5px;">
        <asp:Label ID="kq" runat="server" CssClass="kq" ForeColor="Black" Font-Size="20px"></asp:Label>
        <asp:Label ID="lbThongBao" runat="server"></asp:Label>
        <div class="view1">
            <ul class="col-12">
                <asp:DataList ID="dlTimKiem" runat="server" RepeatDirection="Horizontal" OnItemDataBound="dlTimKiem_ItemDataBound" RepeatLayout="Flow">
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/dtdd.aspx?MaSP=" + Eval("MaSP") %>'>
                                <asp:Label ID="lbGiamGia" runat="server" Text='<%# "Giảm " + Eval("GiamGia","{0:#,#}") + "₫" %>' CssClass="giamgia"></asp:Label>
                                <asp:Label ID="lbTraGop" runat="server" Text='<%# Eval("TraGop") %>' CssClass="tragop"></asp:Label>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/Home/"+Eval("HinhAnh") %>' CssClass="image" />
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TenSP") %>' CssClass="ten-dt"></asp:Label>
                                <asp:Label ID="lbGiaBan" runat="server" Text='<%# Eval("GiaBan") %>' CssClass="giaban"></asp:Label>
                            </asp:HyperLink>
                        </li>
                    </ItemTemplate>
                </asp:DataList>
            </ul>
        </div>
    </div>
</asp:Content>

