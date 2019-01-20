<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="KhuyenMaiCty.aspx.cs" Inherits="KhuyenMaiCty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Khuyến Mãi Theo Công Ty</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div>
        <h2 style="display: inline-block; text-transform: uppercase; font-weight: bold">khuyến mãi công ty</h2>
        <ul style="text-align: center">
            <asp:DataList ID="dlHinh" runat="server" RepeatLayout="Flow" RepeatColumns="2" DataKeyField="MaDeal" RepeatDirection="Horizontal" OnItemDataBound="dlHinh_ItemDataBound" OnDeleteCommand="dlHinh_DeleteCommand">
                <ItemTemplate>
                    <li style="display: inline-block; margin: 2px 0">
                        <asp:Label runat="server" Text='<%# Eval("TenCty") %>' Font-Bold="True" Font-Size="17px"></asp:Label><br />
                        <asp:Image runat="server" ImageUrl='<%# "images/"+Eval("TenCty")+"/"+Eval("HinhAnh") %>' Width="485px" /><br />
                        <div class="SingleCheckbox" style="margin-top: 5px">
                            <asp:CheckBox ID="cbHinh" runat="server" />
                            <asp:Label ID="Label3" AssociatedControlID="cbHinh" runat="server" CssClass="CheckBoxLabel"></asp:Label>
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/hinhadmin/delete.png" CommandName="delete" CssClass="delhinh" />
                        </div>
                    </li>
                </ItemTemplate>
            </asp:DataList>
        </ul>
        <hr />
        <h5>
            <img src="hinhadmin/add1.png" style="margin-top: -5px" />
            Thêm Khuyến Mãi
        </h5>
        <asp:FileUpload ID="file_upload" class="multi" runat="server" /><br />
        <asp:DropDownList ID="ddlHangSX" runat="server" CssClass="custom-select" OnLoad="ddlHangSX_Load"></asp:DropDownList>
        <div style="text-align: center; margin-top: 10px">
            <asp:Button ID="Button2" runat="server" Text="Lưu" class="save" OnClick="Button2_Click" />
        </div>
    </div>
</asp:Content>

