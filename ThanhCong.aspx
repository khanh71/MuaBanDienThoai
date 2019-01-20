<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.master" AutoEventWireup="true" CodeFile="ThanhCong.aspx.cs" Inherits="ThanhCong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <title>
        Đặt hàng thành công
    </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="gioithieu" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="noidung" Runat="Server">
    <div class="thanhcong">
        <asp:Image runat="server" ImageUrl="~/images/icon/success.png" />
        <p>ĐẶT HÀNG THÀNH CÔNG</p>
        <div style="margin:0 28%;text-align:left">
            <p>
            Đơn hàng của quý khách được hệ thống ghi nhận thành công.
        </p>
        <p>
            Mã số đơn hàng của quý khách: <asp:Label ID="lbmadh" runat="server" ForeColor="Black" Font-Bold="True"></asp:Label>
        </p>
        <p>Trong vòng 2 giờ làm việc, chúng tôi sẽ gọi điện để xác nhận đơn hàng quý khách đã đặt</p>
        <p>Thời gian thực hiện đơn hàng có thể mất từ 1-2 ngày và chúng tôi sẽ tiến hành giao hàng trong 1-3 ngày làm việc tiếp theo (nếu không có sự cố ngoài ý muốn)</p>
        <p>Quý khách có bất kì thắc mắc nào, xin vui lòng liên hệ với chúng tôi qua đường dây nóng <asp:Label runat="server" Text="0168.639.7134" Font-Bold="True" ForeColor="Red"></asp:Label> hoặc địa chỉ email <asp:Label ID="Label1" runat="server" Text="nguyenhoangmobile@gmail.com" ForeColor="#0066FF" Font-Underline="True"></asp:Label></p>
        <p>Cảm ơn quý khách đã đến với <asp:Label runat="server" Text="Nguyễn Hoàng mobile" Font-Bold="True"></asp:Label> !</p>
        </div>
        <div style="margin-top:10px">
            <asp:HyperLink runat="server" NavigateUrl="~/index.aspx" CssClass="tieptucmuahang">Về trang chủ</asp:HyperLink>
        </div>
    </div>
    
</asp:Content>

