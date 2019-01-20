<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.master" AutoEventWireup="true" CodeFile="TinTuc.aspx.cs" Inherits="TinTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <title>Tin Tức | Cập nhật thông tin mới nhất về công nghệ
    </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            padding-right: 30px;
            padding-left: 15px;
            vertical-align:top;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="gioithieu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="noidung" runat="Server">
    <div class="tintucmoi">
        <asp:DataList ID="dlTinTucTop" runat="server" RepeatColumns="2" RepeatDirection="Horizontal">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link-tintuc" NavigateUrl='<%# Eval("URL") %>'> 
                <table style="width:100%;">
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/news/" + Eval("Hinh") %>' />
                        </td>
                        </tr>
                    <tr>
                        <td style="padding: 5px 10px 0px 10px">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("TieuDe") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
                </asp:HyperLink>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <div class="tintuc">
        <asp:DataList ID="dlTinTuc" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link-c" NavigateUrl='<%# Eval("URL") %>'>
                <table style="margin: 10px 0">
                    <tr>
                        <td rowspan="3">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/news/" + Eval("Hinh") %>' />
                        </td>
                        <td class="auto-style1">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TieuDe") %>' CssClass="tieude"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="lbTomTat" runat="server" Text='<%# Eval("TomTat") %>' CssClass="TomTat" Width="400px" Height="4.5em" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" style="margin-top:-10px">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("NgayDang","{0:dd-MM-yyyy}") %>' ForeColor="#0066FF" CssClass="ngaydang"></asp:Label>
                        </td>
                    </tr>
                </table>
                    </asp:HyperLink>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

