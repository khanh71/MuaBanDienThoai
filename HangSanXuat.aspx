<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.master" AutoEventWireup="true" CodeFile="HangSanXuat.aspx.cs" Inherits="HangSanXuat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <title id="lbTitle" runat="server"></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 106px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="gioithieu" runat="Server">
    <table style="max-height: 300px; overflow: hidden">
        <td>
            <asp:DataList ID="dtMota" runat="server" CssClass="gioithieu-cty">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/" +Eval("TenCty") + "/" + Eval("HinhAnh") %>' />
                    <div class="detail">
                        <asp:Label ID="lbTen" runat="server" Text='<%# Eval("TenCty") %>' CssClass="tenCty"></asp:Label>
                        <asp:Label ID="lbMota" runat="server" Text='<%# Eval("Mota") %>' CssClass="Mota"></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </td>
        <td>
            <asp:DataList ID="dtDeal" runat="server" RepeatColumns="1" CssClass="deal" style="max-height:300px;overflow:hidden">
                <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# "~/images/" +Eval("TenCty") + "/" + Eval("HinhAnh") %>' />
                </ItemTemplate>

            </asp:DataList>
        </td>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="noidung" runat="Server">
    <div class="khungvien-cty">
        <asp:DataList ID="dlSanPham" runat="server" RepeatColumns="5" OnItemDataBound="dlSanPham_ItemDataBound" RepeatDirection="Horizontal">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/dtdd.aspx?MaSP=" + Eval("MaSP") %>'>
                    <table class="view">
                        <tr>
                            <td>
                                <asp:Label ID="lbGiamGia" runat="server" Text='<%# "Giảm " + Eval("GiamGia","{0:#,#}") + "₫" %>' CssClass="giamgia"></asp:Label>
                                <asp:Label ID="lbTraGop1" runat="server" Text='<%# Eval("TraGop") %>' CssClass="tragop"></asp:Label>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/Home/"+Eval("HinhAnh") %>' CssClass="image" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TenSP") %>' CssClass="ten-dt"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbGiaBan1" runat="server" Text='<%# Eval("GiaBan") %>' CssClass="giaban"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="thongsokythuat" style="text-align: left">Màn hình:
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Manhinh") %>'></asp:Label><br />
                                CPU:
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("CPU") %>'></asp:Label><br />
                                RAM:
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("RAM1") %>'></asp:Label>, ROM:
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("ROM") %>'></asp:Label><br />
                                HĐH:
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("HDH1") %>'></asp:Label><br />
                                Camera:
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("Camera")+"," %>'></asp:Label>
                                Selfie: <asp:Label ID="Label8" runat="server" Text='<%# Eval("Selfie") %>'></asp:Label>
                                <br />
                                Pin:
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("Pin1") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="buy" NavigateUrl='<%# "~/giohang.aspx?MaSP=" + Eval("MaSP") %>'>Mua</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </asp:HyperLink>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

