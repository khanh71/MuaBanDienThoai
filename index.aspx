<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <title>Nguyễn Hoàng mobile</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="gioithieu" runat="Server">
    <div class="banner col-12" style="display: block">
        <asp:Label ID="lbBanner" runat="server"></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="noidung" runat="Server">
    <br />
    <asp:Image ID="Image4" runat="server" ImageUrl="~/images/icon/gsct.png" CssClass="gsct" />
    <div class="khungvien-giamgia">
        <div class="view1">
            <ul class="col-12">
                <asp:DataList ID="dlGiamGia" runat="server" OnItemDataBound="dlDienThoai_ItemDataBound" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink runat="server" NavigateUrl='<%# "~/dtdd.aspx?MaSP=" + Eval("MaSP") %>'>
                                <asp:Label ID="lbGiamGia" runat="server" Text='<%# "Giảm " + Eval("GiamGia","{0:#,#}") + "₫" %>' CssClass="giamgia"></asp:Label>
                                <asp:Label ID="lbTraGop" runat="server" Text='<%# Eval("TraGop") %>' CssClass="tragop"></asp:Label>
                                <asp:Image runat="server" ImageUrl='<%# "~/images/Home/"+Eval("HinhAnh") %>' CssClass="image" />
                                <asp:Label runat="server" Text='<%# Eval("TenSP") %>' CssClass="ten-dt"></asp:Label>
                                <asp:Label ID="lbGiaBan" runat="server" Text='<%# Eval("GiaBan") %>' CssClass="giaban"></asp:Label>
                            </asp:HyperLink>
                        </li>
                    </ItemTemplate>
                </asp:DataList>
            </ul>
        </div>
    </div>
    <asp:DataList ID="dlHang" runat="server" DataKeyField="MaCty" RepeatLayout="Flow" OnItemDataBound="dlHang_ItemDataBound">
        <ItemTemplate>
            <div class="khungvien">
                <div class="hangdt">
                    <asp:HyperLink ID="hpHang" runat="server" Text='<%#Eval("tencty") %>' NavigateUrl='<%# "~/hangsanxuat.aspx?macty="+Eval("macty") %>'></asp:HyperLink>
                </div>
                <div class="view1">
                    <ul class="col-md-12">
                        <asp:DataList ID="dlDienThoai" runat="server" OnItemDataBound="dlDienThoai_ItemDataBound" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <ItemTemplate>
                                <li>
                                    <asp:HyperLink runat="server" NavigateUrl='<%# "~/dtdd.aspx?MaSP=" + Eval("MaSP") %>'>
                                        <asp:Label ID="lbGiamGia" runat="server" Text='<%# "Giảm " + Eval("GiamGia","{0:#,#}") + "₫" %>' CssClass="giamgia"></asp:Label>
                                        <asp:Label ID="lbTraGop" runat="server" Text='<%# Eval("TraGop") %>' CssClass="tragop"></asp:Label>
                                        <asp:Image runat="server" ImageUrl='<%# "~/images/Home/"+Eval("HinhAnh") %>' CssClass="image" />
                                        <asp:Label runat="server" Text='<%# Eval("TenSP") %>' CssClass="ten-dt"></asp:Label>
                                        <asp:Label ID="lbGiaBan" runat="server" Text='<%# Eval("GiaBan") %>' CssClass="giaban"></asp:Label>
                                    </asp:HyperLink>
                                </li>
                            </ItemTemplate>
                        </asp:DataList>
                    </ul>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

