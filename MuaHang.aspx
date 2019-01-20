<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.master" AutoEventWireup="true" CodeFile="MuaHang.aspx.cs" Inherits="MuaHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="gioithieu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="noidung" runat="Server">
    <div style="box-shadow: 5px 5px 10px #888888;">
        <table style="width: 100%; background-color: #fff;">
            <tr>
                <td style="width: 60%; padding: 10px; vertical-align: top">
                    <h4>Thông Tin Người Mua Hàng</h4>
                    <form>
                        <div class="form-group">
                            <label style="font-weight: bold">Họ và Tên: </label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Text="Vui lòng nhập tên người nhận" ControlToValidate="txtTen"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtTen" runat="server" class="form-control" ForeColor="Black"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label style="font-weight: bold">Địa Chỉ: </label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="Vui lòng nhập địa chỉ" ForeColor="Red" ControlToValidate="txtDiaChi"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtDiaChi" runat="server" class="form-control" ForeColor="Black"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label style="font-weight: bold">Điện Thoại: </label><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="Vui lòng nhập số điện thoại" ForeColor="Red" ControlToValidate="txtSDT"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Vui lòng nhập số có độ dài 10 hoặc 11" ValidationExpression="^\d{10,11}" ControlToValidate="txtSDT" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtSDT" runat="server" class="form-control" ForeColor="Black"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label style="font-weight: bold">Email: </label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" Text="Vui lòng nhập Email" ForeColor="Red"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Email không hợp lệ</asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" ForeColor="Black"></asp:TextBox>
                        </div>
                        <div style="text-align: center">
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="cod" OnClick="LinkButton1_Click">
                                <p>THANH TOÁN KHI NHẬN HÀNG</p>
                                <p style="font-size: 13px">Nhận hàng tại nhà, miễn phí vận chuyển</p>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="online" OnClick="LinkButton2_Click">
                                <p>THANH TOÁN ONLINE</p>
                                <p style="font-size: 13px">Bằng thẻ ATM, Visa, Master</p>
                            </asp:LinkButton>
                        </div>
                    </form>
                </td>
                <td style="width: 40%; padding: 10px; vertical-align: top">
                    <h4>Giỏ Hàng</h4>
                    <asp:GridView ID="gvGioHang" runat="server" AutoGenerateColumns="False" CssClass="tbgiohang" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="Hình Ảnh">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/Home/"+Eval("HinhAnh") %>' Height="70px" />
                                </ItemTemplate>
                                <ItemStyle Width="25%" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="TenSP" HeaderText="Tên Sản Phẩm">
                                <ItemStyle Width="25%" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Số Lượng" DataField="SoLuong">
                                <ItemStyle Width="15%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Thành Tiền" ItemStyle-Width="17%">
                                <ItemTemplate>
                                    <asp:Label ID="lbThanhTien" runat="server" Text='<%# String.Format("{0:#,#₫}", Convert.ToDouble( Eval("ThanhTien"))) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="25%"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <div style="width: 100%; border-top: 1px solid #ccc; padding-top: 5px;">
                        <asp:Label ID="lbTongCong" runat="server" CssClass="tongtien1" ForeColor="Red"></asp:Label><br />
                        <asp:Label ID="Label1" runat="server" Text="• Phí giao hàng: Miễn phí" Font-Size="13px" ForeColor="#333333"></asp:Label><br />
                        <asp:Label ID="Label2" runat="server" Text="• Giá đã bao gồm VAT" Font-Size="13px" ForeColor="#333333"></asp:Label><br />
                        <asp:Label ID="Label3" runat="server" Text="• Miễn phí đổi trả hàng trong vòng 7 ngày" Font-Size="13px" ForeColor="#333333"></asp:Label>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

