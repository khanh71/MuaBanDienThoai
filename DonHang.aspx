<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="DonHang.aspx.cs" Inherits="DonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Đơn Đặt Hàng</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div>
        <h2 style="display: inline-block; text-transform: uppercase; font-weight: bold;">đơn hàng</h2>
    </div>
    <table class="tbdonhang col-12 table-hover">
        <tr>
            <th>Số ĐH</th>
            <th>Tên Khách Hàng</th>
            <th>Địa Chỉ
            </th>
            <th>Số Điện Thoại
            </th>
            <th>Trị Giá
            </th>
            <th>Hình Thức Thanh Toán
            </th>
            <th>Đã Giao Hàng
            </th>
        </tr>
        <asp:DataList ID="dlDonHang" runat="server" DataKeyField="SoDH" OnItemDataBound="dlDonHang_ItemDataBound" RepeatLayout="Flow" RepeatDirection="Horizontal">
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label runat="server" Text='<%# Eval("SoDH") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%# Eval("tennguoinhan") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%# Eval("diachinhan") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%# Eval("sdtnhan") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%# Eval("thanhtien","{0:#,#₫}") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lbthanhtoan" runat="server" Text='<%# Eval("thanhtoan") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:DataList>
    </table>
    <div style="margin-top: 10px; text-align: center">
        <asp:Button ID="Button3" runat="server" Text="Lưu" CssClass="save" OnClick="Button3_Click" />
    </div>
</asp:Content>

