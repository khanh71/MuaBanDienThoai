<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="SlideHome.aspx.cs" Inherits="SlideHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Khuyến Mãi Chung</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div>
        <h2 style="display: inline-block; text-transform: uppercase; font-weight: bold">slide trang chủ</h2>
        <asp:DataList ID="dlHinh" runat="server" RepeatLayout="Flow" DataKeyField="ID" OnDeleteCommand="dlHinh_DeleteCommand" OnItemDataBound="dlHinh_ItemDataBound">
            <ItemTemplate>
                <div class="col-12 bannerhome">
                    <asp:Image runat="server" ImageUrl='<%# "images/home/banner/"+Eval("Hinh") %>' /><br />
                    <div class="SingleCheckbox" style="margin-top: 5px">
                        <asp:CheckBox ID="cbHinh" runat="server" />
                        <asp:Label ID="Label3" AssociatedControlID="cbHinh" runat="server" CssClass="CheckBoxLabel"></asp:Label>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/hinhadmin/delete.png" CommandName="delete" CssClass="delhinh" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <br />
        <div class="col-12" style="float:left;padding-left:0">
        <h5>
            <img src="hinhadmin/add1.png" style="margin-top: -5px" />
            Thêm Hình Ảnh
        </h5>
            </div>
        <asp:FileUpload ID="file_upload" class="multi" runat="server" />
        <div style="text-align: center; margin-top: 10px">
            <asp:Button ID="Button2" runat="server" Text="Lưu" class="save" OnClick="Button2_Click"/>
        </div>
    </div>
</asp:Content>

