<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="SuaCT.aspx.cs" Inherits="SuaCT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title id="lbTitle" runat="server"></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="col-12">
        <asp:Label ID="TenCT" runat="server" Font-Size="35px"></asp:Label>
    </div>
    <div>
        <asp:DataList ID="dtMota" runat="server" RepeatLayout="Flow" DataKeyField="MaCty" OnUpdateCommand="dtMota_UpdateCommand">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/" +Eval("TenCty") + "/" + Eval("HinhAnh") %>' CssClass="col-12" />
                <ul class="col-12 dlcongty">
                    <li>
                        <label>Tên Công Ty:</label><asp:RequiredFieldValidator runat="server" Text="Vui lòng nhập tên công ty" ForeColor="Red" ControlToValidate="txtTen"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtTen" runat="server" Text='<%# Eval("TenCty") %>' CssClass="form-control"></asp:TextBox>
                    </li>
                    <li>
                        <label>Quốc Gia:</label>
                        <asp:TextBox ID="txtQuocGia" runat="server" Text='<%# Eval("QuocGia") %>' CssClass="form-control"></asp:TextBox>
                    </li>
                    <li>
                        <label>Giới Thiệu Sơ Lược:</label><asp:RequiredFieldValidator runat="server" Text="Vui lòng nhập mô tả" ForeColor="Red" ControlToValidate="txtMota"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtMota" runat="server" Text='<%# Eval("Mota") %>' CssClass="form-control" Rows="4" TextMode="MultiLine"></asp:TextBox>
                    </li>
                    <li style="list-style: none; margin-top: 10px">
                        <div style="text-align: center">
                            <asp:Button ID="btnLuu" runat="server" Text="Lưu" CommandName="update" CssClass="save" />
                        </div>
                    </li>
                </ul>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

