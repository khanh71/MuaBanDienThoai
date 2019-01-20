<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="QuanTriVien.aspx.cs" Inherits="QuanTriVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Quản trị viên</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div>
        <h2 style="display: inline-block; text-transform: uppercase; font-weight: bold;">quản trị viên</h2>
        <asp:HyperLink runat="server" ImageUrl="~/hinhadmin/add.png" CssClass="add" NavigateUrl="~/CreateAdmin.aspx"></asp:HyperLink>
    </div>
    <table class="tbdonhang col-12 table-hover">
        <tr>
            <th>Mã Admin</th>
            <th>Họ Tên</th>
            <th>Địa Chỉ
            </th>
            <th>Số Điện Thoại
            </th>
            <th>Email
            </th>
            <th>Xóa
            </th>
            <th>Sửa</th>
        </tr>
        <asp:DataList ID="dlAdmin" runat="server" DataKeyField="ID" RepeatLayout="Flow" OnDeleteCommand="dlAdmin_DeleteCommand" OnEditCommand="dlAdmin_EditCommand">
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%# Eval("hoten") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%# Eval("diachi") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%# Eval("sdt") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%# Eval("email") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/icon/delete.png" style="margin-top:5px" CommandName="delete" />
                    </td>
                    <td>
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/hinhadmin/edit.png" style="margin-top:5px" Width="23px" CommandName="edit" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:DataList>
    </table>
</asp:Content>

