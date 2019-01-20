<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.master" AutoEventWireup="true" CodeFile="Giohang.aspx.cs" Inherits="Giohang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <title>Giỏ hàng của bạn</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="gioithieu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="noidung" runat="Server">
    <div style="background-color: #fff; width: 100%; padding: 20px; border: 1px solid #ccc; box-shadow: 5px 5px 10px #888888;">
        <h3>Giỏ Hàng</h3>
        <asp:GridView ID="gvGiohang" runat="server" AutoGenerateColumns="False" CssClass="tbgiohang" DataKeyNames="TenSP" OnRowCommand="gvGiohang_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="Hình Ảnh Sản Phẩm">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/Home/"+Eval("HinhAnh") %>' Height="150px" />
                    </ItemTemplate>
                    <ItemStyle Width="20%" />
                </asp:TemplateField>
                <asp:BoundField DataField="TenSP" HeaderText="Tên Sản Phẩm">
                    <ItemStyle Width="15%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Số Lượng">
                    <ItemTemplate>
                        <asp:DropDownList ID="dlSoLuong" runat="server" AutoPostBack="True" SelectedValue='<%# Eval("SoLuong") %>' Width="70px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="custom-select">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                    <ItemStyle Width="17%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Giá Bán" ItemStyle-Width="17%">
                    <ItemTemplate>
                        <asp:Label ID="lbGiaBan" runat="server" Text='<%# String.Format("{0:#,#₫}", Convert.ToDouble( Eval("GiaBan"))) %>'></asp:Label>
                    </ItemTemplate>

                    <ItemStyle Width="17%"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ưu Đãi" ItemStyle-Width="17%">
                    <ItemTemplate>
                        <asp:Label ID="lbGiamGia" runat="server" Text='<%# String.Format("{0:#,#₫}", Convert.ToDouble( Eval("GiamGia"))) %>'></asp:Label>
                    </ItemTemplate>

                    <ItemStyle Width="17%"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Thành Tiền" ItemStyle-Width="17%">
                    <ItemTemplate>
                        <asp:Label ID="lbThanhTien" runat="server" Text='<%# String.Format("{0:#,#₫}", Convert.ToDouble( Eval("ThanhTien"))) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="17%"></ItemStyle>
                </asp:TemplateField>
                <asp:ButtonField CommandName="Xoa" ButtonType="Image" ImageUrl="~/images/icon/delete.png" Text="Xóa"></asp:ButtonField>
            </Columns>
        </asp:GridView>
        <div style="width: 100%; text-align: center">
            <asp:Image ID="imgEmpty" runat="server" ImageUrl="~/images/icon/empty-cart.png" />
        </div>
        <div style="width: 100%; border-top: 1px solid #ccc; padding-top: 5px" runat="server" id="dTien">
            <asp:Label ID="lbTongCong" runat="server" CssClass="tongtien" ForeColor="Red" Font-Size="18px"></asp:Label>
        </div>
        <table style="width: 100%">
            <tr>
                <td style="text-align: left">
                    <asp:HyperLink runat="server" NavigateUrl="~/index.aspx" CssClass="tieptucmuahang">Tiếp tục mua hàng</asp:HyperLink>
                </td>
                <td style="text-align: right">
                    <asp:LinkButton ID="hpThanhToan" runat="server" CssClass="tienhanhthanhtoan" OnClick="hpThanhToan_Click">Tiến hành thanh toán</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

