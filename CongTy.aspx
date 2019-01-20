<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="CongTy.aspx.cs" Inherits="CongTy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Hãng Sản Xuất</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div>
        <h2 style="display: inline-block; text-transform: uppercase; font-weight: bold">hãng sản xuất</h2>
        <asp:HyperLink runat="server" ImageUrl="~/hinhadmin/add.png" CssClass="add" NavigateUrl="~/CreateCT.aspx"></asp:HyperLink>
    </div>
    <div>
        <asp:DataList ID="dtMota" runat="server" CssClass="gioithieu-cty" RepeatLayout="Flow" OnEditCommand="dtMota_EditCommand" DataKeyField="MaCty" OnDeleteCommand="dtMota_DeleteCommand">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/" +Eval("TenCty") + "/" + Eval("HinhAnh") %>' CssClass="col-12" />
                <div class="detail col-12">
                    <asp:Label ID="lbTen" runat="server" Text='<%# Eval("TenCty") %>' CssClass="tenCty"></asp:Label>
                    <asp:Label ID="lbMota" runat="server" Text='<%# Eval("Mota") %>' CssClass="Mota"></asp:Label>
                </div>
                <div class="col-12">
                    <asp:ImageButton runat="server" ImageUrl="~/hinhadmin/edit.png" CommandName="edit" />
                    <asp:ImageButton runat="server" ImageUrl="~/hinhadmin/delete1.png" CommandName="delete" style="float:right" Width="30px" />
                </div>
                <hr />
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
