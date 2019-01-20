<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ViewTinTuc.aspx.cs" Inherits="ViewTinTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Tin Tức</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div>
        <h2 style="display: inline-block; text-transform: uppercase; font-weight: bold">tin tức</h2>
        <asp:HyperLink runat="server" ImageUrl="~/hinhadmin/add.png" CssClass="add" NavigateUrl="~/CreateTinTuc.aspx"></asp:HyperLink>
    </div>
    <ul class="dlTinTuc col-12" style="padding: 0">
        <asp:DataList ID="dlTinTuc" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" DataKeyField="ID" OnDeleteCommand="dlTinTuc_DeleteCommand">
            <ItemTemplate>
                <li class="col-4" style="max-width: 33%">
                    <asp:HyperLink runat="server" NavigateUrl='<%#"~/SuaTinTuc.aspx?id=" + Eval("id")  %>'>
                    <asp:Image runat="server" ImageUrl='<%# "~/images/news/"+Eval("Hinh") %>' />
                    <asp:Label runat="server" Text='<%# Eval("TieuDe") %>' CssClass="dlTieuDe"></asp:Label>
                    <asp:Label runat="server" Text='<%# Eval("TomTat") %>' CssClass="dlTomTat"></asp:Label>
                    <asp:Button runat="server" Text="Xóa" CommandName="delete" CssClass="xoa" />
                    </asp:HyperLink>
                </li>
            </ItemTemplate>
        </asp:DataList>
    </ul>
</asp:Content>

